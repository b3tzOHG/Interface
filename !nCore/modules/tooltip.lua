cfg = {
	fontSize = 15, 
	
	anchormouse = false,
	
	abbrevRealmNames = true,
    showPlayerTitles = true,
   
	showMouseoverTarget = true,
	
	bgColor = {0.08,0.08,0.1,0.8},
	borderColor = {0,0,0,1},
}

local select = select
local format = string.format
local floor = floor
local upper = string.upper
local sub = sub
local gsub = gsub
local find = find

local UnitName = UnitName
local UnitLevel = UnitLevel
local UnitExists = UnitExists
local UnitCreatureType = UnitCreatureType
local GetQuestDifficultyColor = GetQuestDifficultyColor

GameTooltipHeaderText:SetFont(STANDARD_TEXT_FONT, (cfg.fontSize + 2), "OUTLINE")
GameTooltipHeaderText:SetShadowOffset(0, 0)

GameTooltipText:SetFont(STANDARD_TEXT_FONT, (cfg.fontSize), "OUTLINE")
GameTooltipText:SetShadowOffset(0, 0)

GameTooltipTextSmall:SetFont(STANDARD_TEXT_FONT, (cfg.fontSize), "OUTLINE")
GameTooltipTextSmall:SetShadowOffset(0, 0)
GameTooltipStatusBar:ClearAllPoints()
GameTooltipStatusBar:Hide()

function SetBackdropStyle(self, style)
	if self.IsEmbedded then return end --do nothing on embedded tooltips
	
	if (not self.IsSkinned) then
		self.Backdrop = CreateFrame('Frame', nil, self, 'BackdropTemplate')
		self.Backdrop:SetAllPoints()
		self.Backdrop:SetFrameLevel(self:GetFrameLevel())
		
		self.Backdrop:SetBackdrop({edgeFile = 'Interface\\Buttons\\WHITE8x8', edgeSize = 1, bgFile = 'Interface\\ChatFrame\\ChatFrameBackground'})
		self.Backdrop:SetBackdropColor(unpack(cfg.bgColor))
				
		self.Backdrop:SetBackdropBorderColor(unpack(cfg.borderColor))
		
		if self.NineSlice then
			self.NineSlice:SetAlpha(0)
		end
		
		self.IsSkinned = true
	end
end

local function GetFormattedUnitType(unit)
    local creaturetype = UnitCreatureType(unit)
    if creaturetype then
        return creaturetype
    else
        return ""
    end
end

local function GetFormattedUnitClassification(unit)
    local class = UnitClassification(unit)
    if class == "worldboss" then
        return "|cffFF0000"..BOSS.."|r "
    elseif class == "rareelite" then
        return "|cffFF66CCRare|r |cffFFFF00"..ELITE.."|r "
    elseif class == "rare" then
        return "|cffFF66CCRare|r "
    elseif class == "elite" then
        return "|cffFFFF00"..ELITE.."|r "
    else
        return ""
    end
end

local function GetFormattedUnitLevel(unit)
    local diff = GetQuestDifficultyColor(UnitLevel(unit))
    if UnitLevel(unit) == -1 then
        return "|cffff0000??|r "
    elseif UnitLevel(unit) == 0 then
        return "? "
    else
        return format("|cff%02x%02x%02x%s|r ", diff.r*255, diff.g*255, diff.b*255, UnitLevel(unit))
    end
end

local function GetFormattedUnitClass(unit)
    local color = RAID_CLASS_COLORS[select(2, UnitClass(unit))]
    if color then
		return format(" |cff%02x%02x%02x%s|r", color.r*255, color.g*255, color.b*255, UnitClass(unit))
		--return (" "..UnitClass(unit))
    end
end

local function GetFormattedUnitString(unit)
    if UnitIsPlayer(unit) then
        if not UnitRace(unit) then
            return nil
        end
        return GetFormattedUnitLevel(unit)..UnitRace(unit)..GetFormattedUnitClass(unit)
    else
        return GetFormattedUnitLevel(unit)..GetFormattedUnitClassification(unit)..GetFormattedUnitType(unit)
    end
end

local function AddMouseoverTarget(self, unit)
    local unitTargetName = UnitName(unit.."target")
    local unitTargetClassColor = RAID_CLASS_COLORS[select(2, UnitClass(unit.."target"))] or { r = 1, g = 0, b = 1 }
    local unitTargetReactionColor = {
        r = select(1, GameTooltip_UnitColor(unit.."target")),
        g = select(2, GameTooltip_UnitColor(unit.."target")),
        b = select(3, GameTooltip_UnitColor(unit.."target"))
    }

    if UnitExists(unit.."target") then
        if UnitName("player") == unitTargetName then
            self:AddLine(format("|cffff00ff%s|r", upper(YOU)), 1, 1, 1)
        else
            if UnitIsPlayer(unit.."target") then
                self:AddLine(format("|cff%02x%02x%02x%s|r", unitTargetClassColor.r*255, unitTargetClassColor.g*255, unitTargetClassColor.b*255, unitTargetName:sub(1, 40)), 1, 1, 1)
            else
                self:AddLine(format("|cff%02x%02x%02x%s|r", unitTargetReactionColor.r*255, unitTargetReactionColor.g*255, unitTargetReactionColor.b*255, unitTargetName:sub(1, 40)), 1, 1, 1)
            end
        end
    end
end

-- >> move the GameTooltip
hooksecurefunc("GameTooltip_SetDefaultAnchor", function(self, parent)
	if (cfg.anchormouse) then
		self:SetOwner(parent, "ANCHOR_CURSOR")
	else
		self:SetOwner(parent, "ANCHOR_NONE")
		self:ClearAllPoints()
		self:SetPoint("BOTTOMRIGHT", UIParent, -32, 225)
	end
end)

hooksecurefunc("SharedTooltip_SetBackdropStyle", SetBackdropStyle)

GameTooltip:HookScript("OnTooltipSetUnit", function(self, ...)
    local _, unit = self:GetUnit()
	
    if UnitExists(unit) and UnitName(unit) ~= UNKNOWN then
        local name, realm = UnitName(unit)

            -- Player Titles

        if cfg.showPlayerTitles then
            if UnitPVPName(unit) then
                name = UnitPVPName(unit)
            end
        end

        GameTooltipTextLeft1:SetText(name)
	
		if UnitIsDeadOrGhost(unit) then
			GameTooltipTextLeft1:SetTextColor(0.5,0.5,0.5)
		end
            -- Color guildnames

        if GetGuildInfo(unit) then
            --if GetGuildInfo(unit) == GetGuildInfo("player") and IsInGuild("player") then
               GameTooltipTextLeft2:SetText("|cffFF66CC"..GameTooltipTextLeft2:GetText().."|r")
           -- end
        end

            -- Level

        for i = 2, GameTooltip:NumLines() do
            if _G["GameTooltipTextLeft"..i]:GetText():find("^"..TOOLTIP_UNIT_LEVEL:gsub("%%s", ".+")) then
                _G["GameTooltipTextLeft"..i]:SetText(GetFormattedUnitString(unit))
            end
        end

              -- Mouseover Target

        if cfg.showMouseoverTarget then
            AddMouseoverTarget(self, unit)
        end

            -- Away and DND

        if UnitIsAFK(unit) then
            self:AppendText("|cff00ff00 <"..CHAT_MSG_AFK..">|r")
        elseif UnitIsDND(unit) then
            self:AppendText("|cff00ff00 <"..DEFAULT_DND_MESSAGE..">|r")
        end

            -- Player realm names

        if realm and realm ~= "" then
            if cfg.abbrevRealmNames then
                self:AppendText(" (*)")
            else
                self:AppendText(" - "..realm)
            end
        end
    end
end)

-- loop over tooltips
local tooltips = { GameTooltip,ShoppingTooltip1,ShoppingTooltip2,ItemRefTooltip,ItemRefShoppingTooltip1,ItemRefShoppingTooltip2,WorldMapTooltip,
WorldMapCompareTooltip1,WorldMapCompareTooltip2,SmallTextTooltip }
for i, tooltip in next, tooltips do
	tooltip:SetScale(1)
  if tooltip:HasScript("OnTooltipCleared") then
    tooltip:HookScript("OnTooltipCleared", SetBackdropStyle)
  end
end
--spellid line
--func TooltipAddSpellID
local function TooltipAddSpellID(self,spellid)
  if not spellid then return end
  self:AddDoubleLine("|cff0099ffspellid|r",spellid)
  self:Show()
end

--hooksecurefunc GameTooltip SetUnitBuff
hooksecurefunc(GameTooltip, "SetUnitBuff", function(self,...)
  TooltipAddSpellID(self,select(10,UnitBuff(...)))
end)

--hooksecurefunc GameTooltip SetUnitDebuff
hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self,...)
  TooltipAddSpellID(self,select(10,UnitDebuff(...)))
end)

--hooksecurefunc GameTooltip SetUnitAura
hooksecurefunc(GameTooltip, "SetUnitAura", function(self,...)
  TooltipAddSpellID(self,select(10,UnitAura(...)))
end)

--hooksecurefunc SetItemRef
hooksecurefunc("SetItemRef", function(link)
  local type, value = link:match("(%a+):(.+)")
  if type == "spell" then
    TooltipAddSpellID(ItemRefTooltip,value:match("([^:]+)"))
  end
end)

--HookScript GameTooltip OnTooltipSetSpell
GameTooltip:HookScript("OnTooltipSetSpell", function(self)
  TooltipAddSpellID(self,select(2,self:GetSpell()))
end)