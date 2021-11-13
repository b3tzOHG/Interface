local A, L = ...
local playerClass = select(2, UnitClass('player'))

L.F = {}

local BACKDROP = 'Interface\\ChatFrame\\ChatFrameBackground'
local EDGE = 'Interface\\Buttons\\WHITE8x8'

local statusbarColor = {75/255, 82/255, 74/255}
local statusbarBG = {.7, .7, .7}

-- > Kill Blizz group Frame
local frameHider = CreateFrame('Frame')
	frameHider:Hide()

	InterfaceOptionsFrameCategoriesButton11:SetScale(0.00001)
	InterfaceOptionsFrameCategoriesButton11:SetAlpha(0)

	CompactRaidFrameManager:SetParent(frameHider)
	CompactUnitFrameProfiles:UnregisterAllEvents()

for i = 1, MAX_PARTY_MEMBERS do
	local name = 'PartyMemberFrame'..i
	local frame = _G[name]

	frame:SetParent(frameHider)

	_G[name..'HealthBar']:UnregisterAllEvents()
	_G[name..'ManaBar']:UnregisterAllEvents()

	local pet = name..'PetFrame'
	local petframe = _G[pet]

	petframe:SetParent(frameHider)

	_G[pet]:UnregisterAllEvents()
end

local function createBD(parent, anchor, r, g, b, a)
	local frame = CreateFrame('Frame', nil, parent, 'BackdropTemplate')
		frame:SetFrameStrata('BACKGROUND')
		frame:SetPoint('TOPLEFT', anchor, 'TOPLEFT', -1, 1)
		frame:SetPoint('BOTTOMRIGHT', anchor, 'BOTTOMRIGHT', 1, -1)
		frame:SetBackdrop({
			edgeFile = EDGE, edgeSize = 1, 
			bgFile = BACKDROP, 
		})
		frame:SetBackdropColor(r, g, b, a)
		frame:SetBackdropBorderColor(0, 0, 0)
	
	return frame
end
L.F.createBD = createBD

local function createUnit(self)
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)
	
	self:RegisterForClicks'AnyUp'
	L.F.createBD(self, self)
	L.F.createHealthBar(self)
	L.F.Healcomm(self)
	L.F.DebuffHighlight(self)
	L.F.createRaidIcon(self)
	L.F.MouseoverHighlight(self)
end
L.F.createUnit = createUnit

local function createPlayerThings(self)
	L.F.createClassPower(self)
	L.F.createRunes(self)
	L.F.createStagger(self)
	--L.F.StackString(self)
	L.F.createInfoIconPlayer(self)
	L.F.createInfoBarsPlayer(self)
end
L.F.createPlayerThings = createPlayerThings

local function Name(self, style)
	local name = self.Health:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightSmallLeft')
		name:SetFont(font, fontsize, fontoutline)
		if (style == 2) then
			name:SetPoint('BOTTOM', 0, 1)
			self:Tag(name, '[narden:color][narden:PartyName]')
		elseif (style == 1) then			
			name:SetPoint('BOTTOM', 0, 5)
			name:SetPoint('TOP', 0, -5)
			name:SetPoint('LEFT', self.Health, 'LEFT', 2, 0)
			name:SetPoint('RIGHT', self.HealthValue, 'LEFT')
			--self:Tag(name, '[difficulty][smartlevel] |cffFFFFFF[name]|r')
			self:Tag(name, '[difficulty][smartlevel] [narden:color][name]  [arenaspec]')
		elseif (style == 3) then
			name:SetPoint('LEFT', 2, 1)
			name:SetPoint('RIGHT', -2, 1)
			name:SetPoint('BOTTOM')
			name:SetPoint('TOP')
			self:Tag(name, '[difficulty][smartlevel] [narden:color][name]')
		else
			name:SetPoint('LEFT', 2, 1)
			name:SetPoint('RIGHT', -2, 1)
			name:SetPoint('BOTTOM', 0, 5)
			name:SetPoint('TOP', 0, -5)
			self:Tag(name, '[narden:color][name]')
		end	
		self.Name = name
end
L.F.Name = Name

local function createStagger(self)
	if(select(2, UnitClass('player')) ~= 'MONK') then return end
		local Stagger = CreateFrame('StatusBar', nil, self)
		Stagger:SetSize(widthBig, heightPower)
		Stagger:SetStatusBarTexture(HAL_K)
		Stagger:SetPoint('BOTTOMLEFT', self, 'TOPLEFT', 0, 1)
		
		--Stagger.bg = Stagger:CreateTexture(nil, 'BACKGROUND')
		--Stagger.bg:SetTexture(HAL_K)
		--Stagger.multiplier = 0.35
		L.F.createBD(Stagger, Stagger, 0, 0, 0, .7)

		-- Register with oUF
		self.Stagger = Stagger
	
end
L.F.createStagger = createStagger

local function createRunes(self)
if(select(2, UnitClass('player')) ~= 'DEATHKNIGHT') then return end
	local Runes = {}
	
	for i = 1, 6 do
		local Rune = CreateFrame('StatusBar', nil, self)
		Rune:SetSize(38.5, 3)
		Rune:SetPoint('BOTTOMLEFT', self, 'TOPLEFT', (i-1) * (Rune:GetWidth()+1),2)
		Rune.bg = Rune:CreateTexture(nil, 'BORDER')
		Rune.bg:SetPoint('BOTTOMLEFT', -1, -1)
		Rune.bg:SetPoint('TOPRIGHT', 1, 1)
		Rune.bg:SetTexture(BACKDROP)
		Rune.bg.multiplier = 0.2
		Runes[i] = Rune
	end
	Runes.colorSpec = true
	self.Runes = Runes
end
L.F.createRunes = createRunes

local function ClassPowerPostUpdate(self, cur, max, hasMaxChanged, powerType)
	if not max or not cur then return end
	for i = 1, 10 do
		self[i]:SetWidth(((widthBig)/max)-((max-1)/max))
		if i == 1 then
			--self[i]:SetPoint('TOPLEFT', oUF_NardenPlayer, 'BOTTOMLEFT', 0, -1)
			self[i]:SetPoint('BOTTOMLEFT', oUF_NardenPlayer, 'TOPLEFT', 0, 1)
		else
			self[i]:SetPoint('BOTTOMLEFT', oUF_NardenPlayer, 'TOPLEFT', (i -1) * (self[i]:GetWidth()+1) , 1)
			--self[i]:SetPoint('TOPLEFT', oUF_NardenPlayer, 'BOTTOMLEFT', (i -1) * (self[i]:GetWidth()+1) , -1)
		end
	end
end

local function createClassPower(self)
	local ClassPower = {}

	for index = 1, 10 do 
		local Bar = CreateFrame('StatusBar', nil, self)
		Bar:SetSize(widthBig, heightPower)
		Bar:SetPoint('BOTTOMLEFT', self, 'TOPLEFT',(index - 1) * Bar:GetWidth()+1, 1)
		--Bar:SetPoint('TOPLEFT', self, 'BOTTOMLEFT',(index - 1) * Bar:GetWidth()+1, -1)
		L.F.createBD(Bar, Bar, 0, 0, 0, 1)
		ClassPower[index] = Bar
	end
	ClassPower.PostUpdate = ClassPowerPostUpdate
	self.ClassPower = ClassPower
end
L.F.createClassPower = createClassPower

local function HealthString(self)
	local HealthValue = self.Health:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightSmallLeft')
	HealthValue:SetFont(font, fontsize, fontoutline)
	HealthValue:SetPoint('RIGHT', self.Health, 'RIGHT', -2, 0)
	self:Tag(HealthValue, '[narden:status][narden:thealth]')
	
	self.HealthValue = HealthValue
end
L.F.HealthString = HealthString

local function PowerString(self)
	local PowerValue = self.Health:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightSmallLeft')
	PowerValue:SetFont(font, 22, fontoutline)
	PowerValue:SetPoint('RIGHT', self.Health, 'RIGHT', -2, 0)
	self:Tag(PowerValue, '[powercolor][narden:power]')
	
	self.PowerValue = PowerValue
end
L.F.PowerString = PowerString

local function StackString(self)
	local StackString = self.Health:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightSmallLeft')
	StackString:SetFont(font, fontlarge, fontoutline)
	StackString:SetPoint('BOTTOM',UIParent, 'BOTTOM', 0, 355)
	--StackString:SetPoint('RIGHT', self.Health, 'LEFT', -3, 0)
	self:Tag(StackString, '[narden:stacks]')
end
L.F.StackString = StackString

local function createInfoIconPlayer(self)
	local ct = CreateFrame('Frame', nil, self.Health)
		ct:SetSize(10, 10)
		ct:SetPoint('CENTER')
		ct:SetAlpha(0.8)
		ct.text = ct:CreateFontString(nil, 'OVERLAY')
		ct.text:SetFont(font, fontsize, fontoutline)
		ct.text:SetPoint('RIGHT', self.PowerValue, 'LEFT', -2, 0)
		ct.text:SetText('|cffAF5050!|r')
	self.CombatIndicator = ct
		
	local r = CreateFrame('Frame', nil, self.Health)
		r:SetSize(10, 10)
		r:SetPoint('CENTER')
		r:SetAlpha(0.8)
		r.text = r:CreateFontString(nil, 'OVERLAY')
		r.text:SetFont(font, fontsize, fontoutline)
		r.text:SetPoint('CENTER', self.Health, 'CENTER', 0, 0)
		r.text:SetText('zZz')
	self.RestingIndicator = r
end
L.F.createInfoIconPlayer = createInfoIconPlayer

local function createInfoIconParty(self)
	local leader = self.Health:CreateTexture(nil, 'OVERLAY')
		leader:SetPoint('TOPLEFT', self.Health, 'TOPLEFT', 0, -5)
		leader:SetSize(12, 12)
	self.LeaderIndicator = leader
	
	local assistand = self.Health:CreateTexture(nil, 'OVERLAY')
		assistand:SetPoint('TOPLEFT', self.Health, 'TOPLEFT', 0, -5)
		assistand:SetSize(12, 12)
	self.AssistantIndicator = assistand
		
	local rdy = self.Health:CreateTexture(nil, 'OVERLAY')
		rdy:SetPoint('TOP', self.Health, 'TOP', 0, -2)
		rdy:SetSize(19, 19)
	self.ReadyCheckIndicator = rdy
	
	local lfd = self.Health:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightSmallLeft')
		lfd:SetFont(font, fontsize, fontoutline)
		lfd:SetPoint('BOTTOMLEFT', self.Health, 'BOTTOMLEFT', 14, 1)
		lfd.Override = L.F.UpdateLFD
	self.GroupRoleIndicator = lfd
end
L.F.createInfoIconParty = createInfoIconParty

local function createInfoBarsPlayer(self)
	local classcolor = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
	local altp = CreateFrame('StatusBar', nil, self)
		altp:SetStatusBarTexture(HAL_K)
		altp:SetHeight(heightPower)
		altp:SetWidth(widthBig)
		altp:EnableMouse(true)
		L.F.createBD(altp, altp)
		--altp:SetPoint('BOTTOM', oUF_NardenPlayer, 'TOP', 0, 1)
		altp:SetPoint('BOTTOM', UIParent, 'BOTTOM', 0, 8)
	
	self.AlternativePower = altp	

	local Exp = CreateFrame('StatusBar', nil, self)
		Exp:SetStatusBarTexture(HAL_K)
		--Exp:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 33, 8)
		Exp:SetPoint("TOP", UIParent, "TOP", 0, -6)
		Exp:SetHeight(heightPower)
		Exp:SetWidth(widthBig)
		Exp:EnableMouse(true)
	
	local Rested = CreateFrame('StatusBar', nil, Exp)
		Rested:SetStatusBarTexture(HAL_K)
		Rested:SetAllPoints(Exp)
		L.F.createBD(Exp, Rested, classcolor.r*.35, classcolor.g*.35, classcolor.b*.35, 1)
		
	self.Experience = Exp
	self.Experience.Rested = Rested

	-- local ArtifactPower = CreateFrame("StatusBar", nil, self)
		-- ArtifactPower:SetStatusBarTexture(HAL_K)
		-- --ArtifactPower:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -33, 8)
		-- ArtifactPower:SetPoint("TOPRIGHT", Minimap, "BOTTOMRIGHT", 0, -1)
		-- ArtifactPower:SetPoint("TOPLEFT", Minimap, "BOTTOMLEFT", 0, -1)
		-- ArtifactPower:SetHeight(heightPower)
		-- --ArtifactPower:SetWidth(498)
		-- ArtifactPower:EnableMouse(true)
		-- ArtifactPower.color = {classcolor.r, classcolor.g, classcolor.b}
		-- ArtifactPower.tooltipAnchor = "ANCHOR_LEFT"
		-- L.F.createBD(ArtifactPower, ArtifactPower, classcolor.r*.35, classcolor.g*.35, classcolor.b*.35, 1)
	
	-- self.ArtifactPower = ArtifactPower
end
L.F.createInfoBarsPlayer = createInfoBarsPlayer

local function PostUpdateHealth(Health, unit, cur, max)
	if(UnitIsDeadOrGhost(unit)) then 
		Health:SetStatusBarColor(35/255, 35/255, 35/255)
		Health.bg:SetVertexColor(.3, .1, .1)
		Health:SetValue(0)
	elseif (not UnitIsConnected(unit)) then
		Health:SetStatusBarColor(35/255, 35/255, 35/255)
		Health.bg:SetVertexColor(1, 173/255, 51/255)
		Health:SetValue(0)
	elseif (UnitIsTapDenied(unit)) then
		Health:SetStatusBarColor(.6, .6, .6)
		Health.bg:SetVertexColor(.3, .3, .3)
	else	
		Health:SetStatusBarColor(35/255, 35/255, 35/255)
		Health.bg:SetVertexColor(.7, .7, .7)
	end
end

local function createHealthBar(self)
	local healthBar = CreateFrame('StatusBar', nil, self)
	healthBar:SetStatusBarTexture(HAL_K)
	healthBar:SetStatusBarColor(35/255, 35/255, 35/255)

	healthBar:SetReverseFill(false)
	healthBar:SetPoint('TOP')
	healthBar:SetPoint('LEFT')
	healthBar:SetPoint('RIGHT')
	healthBar:SetPoint('BOTTOM', self, 0, heightPower + 1)
				
	local healthBarBG = healthBar:CreateTexture(nil, 'BACKGROUND')
	healthBarBG:SetAllPoints(healthBar)
	healthBarBG:SetTexture(HAL_K)
	healthBarBG:SetVertexColor(.7, .7, .7)
	--healthBarBG.multiplier = .35
	
	healthBar.PostUpdate = PostUpdateHealth
	self.Health = healthBar
	self.Health.bg = healthBarBG
end
L.F.createHealthBar = createHealthBar

local function createPowerBar(self)
	local powerBar = CreateFrame('StatusBar', nil, self)
	powerBar:SetStatusBarTexture(HAL_K)
	powerBar:SetPoint('TOPRIGHT', self.Health, 'BOTTOMRIGHT', 0, -1)
	powerBar:SetPoint('TOPLEFT', self.Health, 'BOTTOMLEFT', 0, -1)
	powerBar:SetHeight(heightPower)
	
	powerBar.frequentUpdates = true 
	
	powerBar.colorClass = true
	powerBar.colorReaction = true
			 
	local powerBarBG = powerBar:CreateTexture(nil, 'BORDER')
	powerBarBG:SetAllPoints(powerBar)
	powerBarBG:SetTexture(BACKDROP)
	powerBarBG.multiplier = 0.3
		
	self.Power = powerBar
	self.Power.bg = powerBarBG
end
L.F.createPowerBar = createPowerBar

local function createAdditionalPower(self)
	-- Position and size
    local AdditionalPower = CreateFrame('StatusBar', nil, self)
	AdditionalPower:SetStatusBarTexture(HAL_K)
	AdditionalPower:SetPoint('TOPRIGHT', self.Health, 'TOPRIGHT', -40, -1)
	AdditionalPower:SetPoint('TOPLEFT', self.Health, 'TOPLEFT', 40, -1)
	AdditionalPower:SetHeight(heightPower)
	AdditionalPower:SetFrameLevel(self.Health:GetFrameLevel()+3)

    -- Add a background
    local Background = AdditionalPower:CreateTexture(nil, 'BACKGROUND')
    Background:SetAllPoints(AdditionalPower)
    Background:SetTexture(BACKDROP)
	Background.multiplier = 0.3

    -- Register it with oUF
    AdditionalPower.bg = Background
    self.AdditionalPower = AdditionalPower
end
L.F.createAdditionalPower = createAdditionalPower

local function createPowerPrediction(self)
	local classcolor = RAID_CLASS_COLORS[select(2, UnitClass("player"))]	
	
    local mainBar = CreateFrame('StatusBar', nil, self.Power)
    mainBar:SetReverseFill(true)
	mainBar:SetStatusBarTexture(HAL_K)
	mainBar:SetStatusBarColor(classcolor.r*.2, classcolor.g*.2, classcolor.b*.2)
    mainBar:SetPoint('TOP')
    mainBar:SetPoint('BOTTOM')
    mainBar:SetPoint('RIGHT', self.Power:GetStatusBarTexture(), 'RIGHT')
    mainBar:SetWidth(self:GetWidth())
	
	-- local altBar = CreateFrame('StatusBar', nil, self.AdditionalPower)
    -- altBar:SetReverseFill(true)
	-- altBar:SetStatusBarTexture(HAL_K)
	-- altBar:SetStatusBarColor(classcolor.r*.35, classcolor.g*.35, classcolor.b*.35)
    -- altBar:SetPoint('TOP')
    -- altBar:SetPoint('BOTTOM')
    -- altBar:SetPoint('RIGHT', self.AdditionalPower:GetStatusBarTexture(), 'RIGHT')
    -- altBar:SetWidth(self:GetWidth())
	
	self.PowerPrediction = {
        mainBar = mainBar,
       --altBar = altBar
	}
end
L.F.createPowerPrediction = createPowerPrediction

local function PostCastStop(cb, unit)
	if cb.Text then cb.Text:SetText("") end
end

local function PostCastStopUpdate(self, event, unit)
	if(unit ~= self.unit) then return end
	return PostCastStop(self.Castbar, unit)
end

local function PostCastStart(Castbar, unit, spell, spellrank)
	if unit ~= 'player' and Castbar.notInterruptible then --and UnitCanAttack('player', unit) then
		--Castbar.Text:SetTextColor(1, 0, 0)
		Castbar:SetStatusBarColor(1, 0, 0, 1)
	else 
		--Castbar.Text:SetTextColor(1, 1, 1)
		Castbar:SetStatusBarColor(64/255, 224/255, 208/255, 1)
	end
end

local function PostChannelStart(Castbar, unit, spell)
	if unit ~= 'player' and Castbar.notInterruptible then 
		--Castbar.Text:SetTextColor(1, 0, 0)
		Castbar:SetStatusBarColor(1, 0, 0, 1)
	else
		--Castbar.Text:SetTextColor(1, 1, 1)
		Castbar:SetStatusBarColor(64/255, 224/255, 208/255, 1)
	end
end
local function CustomTimeText(self, duration)
    if self.max > 86400 then
        self.Time:SetFormattedText("%.1f/%.1f", floor(duration/86400 + 0.5), floor(self.max/86400 + 0.5))
    else
        self.Time:SetFormattedText("%.1f/%.1f", duration, self.max)
    end
end

local function createCastbar(self)
	local cb = CreateFrame('StatusBar', nil, self)
	cb:SetStatusBarTexture(HAL_K)
	cb:SetStatusBarColor(64/255, 224/255, 208/255, 1)
	cb:SetHeight(20)
	cb:SetPoint('TOPRIGHT', self, 'BOTTOMRIGHT', 0, -3)
	cb:SetPoint('TOPLEFT', self, 'BOTTOMLEFT', 21, -3)
	createBD(cb, cb, 0, 0, 0, 1)
	
	cb.Time = cb:CreateFontString(nil, 'OVERLAY')
	cb.Time:SetFont(font, fontsize, fontoutline)
	cb.Time:SetTextColor(.4, .7, .9)
	cb.Time:SetPoint('RIGHT', cb, 'RIGHT', -2, 0)
	cb.Time:SetJustifyH("RIGHT")
	
	cb.Text = cb:CreateFontString(nil, 'OVERLAY')
	cb.Text:SetFont(font, fontsize, fontoutline)
	cb.Text:SetPoint('LEFT', cb, 'LEFT', 2, 0)
	cb.Text:SetPoint('RIGHT',  cb.Time, 'LEFT', -10, 0)
	cb.Text:SetPoint('TOP', 0, -5)
	cb.Text:SetPoint('BOTTOM', 0, 5)
	cb.Text:SetJustifyH("LEFT")
	
	cb.Icon = cb:CreateTexture(nil, 'ARTWORK')
	cb.Icon:SetTexCoord(.1, .9, .1, .9)
	cb.Icon:SetSize(20, 20)
	cb.IBackdrop = L.F.createBD(cb, cb.Icon)
	cb.Icon:SetPoint('RIGHT', cb, 'LEFT', -1, 0)
	
	if (self.unit == 'player') then
		cb.SafeZone = cb:CreateTexture(nil, 'OVERLAY')
		cb.SafeZone:SetColorTexture(.6, 0, 0, .6)
		cb.Text:Hide()
		cb:ClearAllPoints()
		cb:SetWidth(257)
		cb:SetPoint('BOTTOMLEFT', self, 'TOPRIGHT', 25, 3)
	end 
				
	cb.CustomTimeText = CustomTimeText
	cb.Ticks = {}
	cb.PostCastStart = PostCastStart
	cb.PostCastStopUpdate = PostCastStopUpdate
	cb.PostCastStop = PostCastStop
	cb.PostChannelStart = PostChannelStart
	self.Castbar = cb
end
L.F.createCastbar = createCastbar

local function hideInfoText(self)
	self.Castbar:SetScript('OnShow', function(event)
		if(self.unit == 'player') then
			--self.PowerValue:SetAlpha(0)
			self.CombatIndicator:SetAlpha(0)
		elseif (self.unit:match('nameplate')) then
			self.Name:SetAlpha(0) 
		elseif (self.unit == 'vehicle') then
			self.CombatIndicator:SetAlpha(0)
		elseif (self.unit == 'pet') then
			self.CombatIndicator:SetAlpha(0)
		else
			self.Name:SetAlpha(0) 
			self.HealthValue:SetAlpha(0)
		end
	end)
	self.Castbar:SetScript('OnHide', function(event)
		if(self.unit == 'player') then
			--self.PowerValue:SetAlpha(1)
			self.CombatIndicator:SetAlpha(1)
		elseif (self.unit:match('nameplate')) then
			self.Name:SetAlpha(1)
		elseif (self.unit == 'vehicle') then
			self.CombatIndicator:SetAlpha(1)
		elseif (self.unit == 'pet') then
			self.CombatIndicator:SetAlpha(1)
		else
			self.Name:SetAlpha(1) 
			self.HealthValue:SetAlpha(1)
		end
	end)
end
L.F.hideInfoText = hideInfoText

--[[Aura Section]]
local function CreateAuraTimer(self, elapsed)
	if (self.expiration) then
		if(self.expiration < 60) then
			self.remaining:SetFormattedText('%d', self.expiration)
		else
			self.remaining:SetText()
		end
	self.expiration = self.expiration - elapsed
	end
end

local function PostCreateIcon(Auras, button)
	local c = button.count
	c:ClearAllPoints()
	c:SetPoint('TOPRIGHT', 1, 0)
	c:SetFontObject(nil)
	c:SetFont(font, fontsmall, 'THINOUTLINE')
	c:SetTextColor(1, 1, 1)
	
	button.cd:SetHideCountdownNumbers(true)
	button.cd.noOCC = true
	button.cd:SetReverse(false)
	
	button.icon:SetTexCoord(.1, .9, .1, .9)
	button.texture = button:CreateTexture("$parentOverlay", "ARTWORK")
	button.texture:SetParent(button)
	button.texture:SetTexture(BUTTON_BORDER)
	button.texture:SetPoint("TOPRIGHT", button, 1, 1)
	button.texture:SetPoint("BOTTOMLEFT", button, -1, -1)
	button.texture:SetVertexColor(0, 0, 0)
	
	button.overlay:SetTexture(nil)
	
	button.stealable:SetTexture(BUTTON_BORDER)
	button.stealable:SetAllPoints(button)
	button.stealable:SetTexCoord(0, 1, 0, 1)
			
	local remaining = button:CreateFontString(nil, 'OVERLAY')
	remaining:SetFont(font, fontsize, fontoutline)
	remaining:SetPoint('BOTTOM', 1, 1)
	button.remaining = remaining
	button:HookScript('OnUpdate', CreateAuraTimer)
		
end

local function PostUpdateGapIcon(Auras, unit, icon, visibleBuffs)
		if(Auras.currentGap) then
			Auras.currentGap:Show()
		end
		
		icon:Hide()
		Auras.currentGap = icon 
	end
	
local function PostUpdateIcon(_, unit, icon, index, _, filter)
	local _, _, _, _, duration, expiration = UnitAura(unit, index, icon.filter)
		
	if(duration and duration > 0) then
		icon.expiration = expiration - GetTime()
	else
		icon.expiration = math.huge
	end
	
	if icon.isDebuff and UnitIsFriend("player", unit) then
	local r,g,b = icon.overlay:GetVertexColor()
		icon.texture:SetVertexColor(r, g, b, 1)
	else 
		icon.texture:SetVertexColor(0, 0, 0, 1)
	end	
	
	if (unit == 'target') or (unit == 'focus') then
		icon:EnableMouse(true)
	else	
		icon:EnableMouse(false)
	end
end
	
local function createAura(self, num, size, width, horiz, vert)
		local Auras = CreateFrame("Frame", nil, self)
		Auras:SetSize(width, (2*size)+3)
		Auras["growth-x"] = horiz
		Auras["growth-y"] = vert
		Auras.numBuffs = num
		Auras.numDebuffs = num
		Auras.numTotal = 2*num
		Auras.size = size
		Auras.spacing = 3
		Auras.showDebuffType = true
		Auras.showStealableBuffs = true
		Auras.disableCooldown = true

		Auras.PostUpdateIcon = PostUpdateIcon 	
		Auras.PostUpdateGapIcon = PostUpdateGapIcon
		Auras.PostCreateIcon = PostCreateIcon 
		
	return Auras	
end
L.F.createAura = createAura

local function Healcomm(self)
	local myBar = CreateFrame('StatusBar', nil, self.Health)
	myBar:SetStatusBarTexture(HAL_K)
	myBar:SetStatusBarColor(.7, .95, 1)
	myBar:SetPoint('TOP')
	myBar:SetPoint('BOTTOM')
	myBar:SetPoint('LEFT', self.Health:GetStatusBarTexture(), 'RIGHT')
	myBar:SetWidth(self:GetWidth())
	myBar:SetFrameLevel(self.Health:GetFrameLevel())
	
	local otherBar = CreateFrame('StatusBar', nil, self.Health)
	otherBar:SetStatusBarTexture(HAL_K)
	otherBar:SetStatusBarColor(35/255, 197/255, 45/255)
	otherBar:SetPoint('TOP')
	otherBar:SetPoint('BOTTOM')
	otherBar:SetPoint('LEFT', myBar:GetStatusBarTexture(), 'RIGHT')
	otherBar:SetWidth(self:GetWidth())
	otherBar:SetFrameLevel(self.Health:GetFrameLevel())
	
	local absorbBar = CreateFrame('StatusBar', nil, self.Health)
	absorbBar:SetStatusBarTexture(HAL_K)
	absorbBar:SetStatusBarColor(0, 204/255, 1)
	absorbBar:SetPoint('TOP')
	absorbBar:SetPoint('BOTTOM')
	absorbBar:SetPoint('LEFT', otherBar:GetStatusBarTexture(), 'RIGHT')
	absorbBar:SetWidth(self:GetWidth())
	absorbBar:SetFrameLevel(self.Health:GetFrameLevel())
	
	local healAbsorbBar = CreateFrame('StatusBar', nil, self.Health)
	healAbsorbBar:SetStatusBarTexture(HAL_K)
	healAbsorbBar:SetStatusBarColor(1, .6, .2, .4)
	healAbsorbBar:SetPoint('TOP')
	healAbsorbBar:SetPoint('BOTTOM')
	healAbsorbBar:SetPoint('RIGHT', self.Health:GetStatusBarTexture())
	healAbsorbBar:SetWidth(self:GetWidth())
	healAbsorbBar:SetFrameLevel(self.Health:GetFrameLevel()+1)
	healAbsorbBar:SetReverseFill(true)
	
	local overAbsorb = self.Health:CreateTexture(nil, 'OVERLAY')
	overAbsorb:SetPoint('TOP')
	overAbsorb:SetPoint('BOTTOM')
	overAbsorb:SetPoint('LEFT', self.Health, 'RIGHT', 0, 0)
	overAbsorb:SetWidth(2)
	
	local overHealAbsorb = self.Health:CreateTexture(nil, 'OVERLAY')
	overHealAbsorb:SetPoint('TOP')
	overHealAbsorb:SetPoint('BOTTOM')
	overHealAbsorb:SetPoint('LEFT', self.Health, 'RIGHT', 0, 0)
	overHealAbsorb:SetWidth(2)
			
	self.HealthPrediction = {
		myBar = myBar, 
		otherBar = otherBar, 
		absorbBar = absorbBar, 
		healAbsorbBar = healAbsorbBar, 
		overAbsorb = overAbsorb, 
		overHealAbsorb = overHealAbsorb, 
		maxOverflow = 1, 
	}
end
L.F.Healcomm = Healcomm

local function AuraIcon(self, icon)
    if (icon.cd) then
        icon.cd:SetReverse(true)
        icon.cd:SetDrawEdge(true)
        icon.cd:SetAllPoints(icon.icon)
        icon.cd:SetHideCountdownNumbers(true)
    end
end

local function CreateIndicators(self, unit)

    self.AuraWatch = CreateFrame('Frame', nil, self)

    local Auras = {}
    Auras.icons = {}
    Auras.customIcons = true
    Auras.presentAlpha = 1
    Auras.missingAlpha = 0
    Auras.PostCreateIcon = AuraIcon

    local buffs = {}

    if (indicatorList['ALL']) then
        for key, value in pairs(indicatorList['ALL']) do
            tinsert(buffs, value)
        end
    end

    if (indicatorList[playerClass]) then
        for key, value in pairs(indicatorList[playerClass]) do
            tinsert(buffs, value)
        end
    end

    if (buffs) then
        for key, spell in pairs(buffs) do

            local icon = CreateFrame('Frame', nil, self.AuraWatch)
            icon:SetWidth(11)
            icon:SetHeight(11)
            icon:SetPoint(spell[2], self.Health, unpack(offsets[spell[2]].icon))

            icon.spellID = spell[1]
            icon.anyUnit = spell[4]
            icon.hideCount = spell[5]

            local cd = CreateFrame("Cooldown", nil, icon, "CooldownFrameTemplate")
            cd:SetAllPoints(icon)
            icon.cd = cd
			icon.cd.noCooldownCount = true
                -- Indicator

            local tex = icon:CreateTexture(nil, 'OVERLAY')
            tex:SetAllPoints(icon)
            tex:SetTexture(INDICATOR)
            icon.icon = tex

                -- Color Overlay

            if (spell[3]) then
                icon.icon:SetVertexColor(unpack(spell[3]))
            else
                icon.icon:SetVertexColor(0.8, 0.8, 0.8)
            end

            if not icon.hideCount then
                local count = icon:CreateFontString(nil, 'OVERLAY')
                count:SetShadowColor(0, 0, 0)
                count:SetShadowOffset(1, -1)
                count:SetPoint(unpack(offsets[spell[2]].count))
                count:SetFont(font, fontsize)
                icon.count = count
            end

             Auras.icons[spell[1]] = icon
        end
    end
    self.AuraWatch = Auras
end
L.F.CreateIndicators = CreateIndicators
		
local function CustomAuraFilter(_, unit, icon, _, _, _, _, _, _, caster, _, _, spellID)
	local playerUnits = {
			player = true,
			pet = true,
			vehicle = true,
	}
	-- if(icon.isDebuff and not UnitIsFriend("player", unit) and not (playerUnits[icon.caster] and TargetDebuffCastByPlayer[spellID]) and icon.caster ~= unit and not TargetDebuff[spellID])
	if(icon.isDebuff and not UnitIsFriend("player", unit) and not playerUnits[icon.caster] and icon.caster ~= unit and not TargetDebuff[spellID])
		or(not icon.isDebuff and UnitIsPlayer(unit) and not UnitIsFriend("player", unit) and not TargetBuff[spellID]) then
				return false
			end
			return true
	end
L.F.CustomAuraFilter = CustomAuraFilter
		
local instDebuffs = {}
local delaytimer = 0
local zoneDelay = function(self, elapsed)
    delaytimer = delaytimer + elapsed

    if (delaytimer < 5) then
        return
    end

    if (IsInInstance()) then
        local mapid = select(8, GetInstanceInfo())

        if (auras.instances[mapid]) then
            instDebuffs = auras.instances[mapid]
        end
    else
        instDebuffs = {}
    end

    self:SetScript('OnUpdate', nil)
    delaytimer = 0
end

local getZone = CreateFrame('Frame')
getZone:RegisterEvent('PLAYER_ENTERING_WORLD')
getZone:RegisterEvent('ZONE_CHANGED_NEW_AREA')
getZone:SetScript('OnEvent', function(self, event)

        -- Delay just in case zone data hasn't loaded

    self:SetScript('OnUpdate', zoneDelay)

    if (event == 'PLAYER_ENTERING_WORLD') then
        self:UnregisterEvent('PLAYER_ENTERING_WORLD')
    end
end)

local function RaidDebuffFilter(_, _, _, name,_, _, _, _, _, _, caster)
	if (instDebuffs[name]) then
		return true
	elseif (auras.debuffs[name]) then
		return true
	end
end
L.F.RaidDebuffFilter = RaidDebuffFilter

local function UpdateLFD(self, event)
	local lfdrole = self.GroupRoleIndicator
	local role = UnitGroupRolesAssigned(self.unit)

	if role == "DAMAGER" then
		lfdrole:SetTextColor(1, .1, .1, 1)
		lfdrole:SetText("")
	elseif role == "TANK" then
		lfdrole:SetTextColor(1, 0, 0, 1)
		lfdrole:SetText("<")
	elseif role == "HEALER" then
		lfdrole:SetTextColor(0, 1, 0, 1)
		lfdrole:SetText("+")
	else
		lfdrole:SetTextColor(0, 0, 0, 0)
	end
end
L.F.UpdateLFD = UpdateLFD

-- > Create Mouseover Highlight on UnitFrames

local function MouseoverHighlight(self)
	self:SetScript("OnEnter", function(self)
        UnitFrame_OnEnter(self)

        if self.Mouseover then
            self.Mouseover:SetAlpha(0.5)
        end
    end)

    self:SetScript("OnLeave", function(self)
        UnitFrame_OnLeave(self)

        if self.Mouseover then
            self.Mouseover:SetAlpha(0)
        end
    end)
	
	local Mouseover = self.Health:CreateTexture(nil, 'OVERLAY')
	Mouseover:SetAllPoints(self.Health)
	Mouseover:SetTexture(HIGHLIGHT)
	Mouseover:SetVertexColor(.6, .6, .6)
	Mouseover:SetAlpha(0)
	self.Mouseover = Mouseover
end
L.F.MouseoverHighlight = MouseoverHighlight

-- > Spell Range for not party units
local function createUnitFader(self)
	self.SpellRange = {
		insideAlpha = 1.0, -- Frame alpha when in range
		outsideAlpha = 0.6, -- Frame alpha when out of range
	}
end
L.F.createUnitFader = createUnitFader

-- > Debuffhighlight
local function DebuffHighlight(self)
	local dbh = self.Health:CreateTexture(nil, 'OVERLAY')
	dbh:SetAllPoints(self.Health)
	dbh:SetTexture(HAL_A)
	dbh:SetBlendMode('ADD')
	dbh:SetVertexColor(0, 0, 0, 0)
	self.DebuffHighlightAlpha = .5
	self.DebuffHighlightFilter = true
	
	self.DebuffHighlight = dbh
end
L.F.DebuffHighlight = DebuffHighlight

local function UpdateTarget(self, event, unit)
	if UnitIsUnit('target', self.unit) then
		self.targetborder:SetBackdropBorderColor(1, 1, 1, 1)
	else	
		self.targetborder:SetBackdropBorderColor(0, 0, 0, 0)
	end
end
L.F.UpdateTarget = UpdateTarget

local function UpdateThreat(self, _, unit)
	if (self.unit ~= unit) then
		return
	end

	local threatStatus = UnitThreatSituation(unit) or 0
	if (threatStatus and threatStatus == 3) then
		self.ThreatIndicator:SetBackdropBorderColor(1, 0, 0, 1)
	else	
		self.ThreatIndicator:SetBackdropBorderColor(0, 0, 0, 0)
	end
end
L.F.UpdateThreat = UpdateThreat

local function createRaidIcon(self)
	local ri = self.Health:CreateTexture(nil, 'OVERLAY')
	ri:SetSize(22, 22)
	ri:SetPoint('CENTER', 0, 10)
	self.RaidTargetIndicator = ri
end
L.F.createRaidIcon = createRaidIcon

local function createCombatFeedbackText(self, padding)
	local fcf = CreateFrame("Frame", nil, self)
	fcf.useCLEU = true
	fcf:SetSize(32, 32)
	fcf:SetPoint("CENTER", 0, padding)
		 
	for i = 1, 6 do
	-- give names to these font strings to avoid breaking /fstack and /tinspect
		fcf[i] = fcf:CreateFontString("$parentFCFText" .. i, "OVERLAY")
	end
	fcf.format = "|T%2$s:0:0:0:0:64:64:4:60:4:60|t %1$s"
	fcf.fontFlags = "OUTLINE"		
	
	self.FloatingCombatFeedback = fcf	
end
L.F.createCombatFeedbackText = createCombatFeedbackText

-- > Mirror Bars
	for i = 1, 3 do
		local bar = _G['MirrorTimer'..i]
		
		if (BackdropTemplateMixin) then
			Mixin(bar, BackdropTemplateMixin)
		end
		
		bar:SetParent(UIParent)
		bar:SetSize(160, 6)
		bar:ClearAllPoints()
		bar:SetPoint('TOP', 0, -(i*14+102))
		bar:SetBackdrop({
			bgFile = 'Interface\\ChatFrame\\ChatFrameBackground',
			edgeFile = 'Interface\\ChatFrame\\ChatFrameBackground',
			edgeSize = 1,
			insets = {top = 1, bottom = 1, left = 1, right = 1},
		})
		bar:SetBackdropColor(.1, .1, .1, .75)
		bar:SetBackdropBorderColor(0, 0, 0, 1)
		
		local statusbar = bar:GetChildren()
		statusbar:ClearAllPoints()
		statusbar:SetPoint('TOPLEFT', bar, 'TOPLEFT', 1, -1)
		statusbar:SetPoint('BOTTOMRIGHT', bar, 'BOTTOMRIGHT', -1, 1)
		statusbar:SetStatusBarTexture(HAL_K)
		
		local bg, text, border = bar:GetRegions()
		bg:Hide()
		border:Hide()
		
		text:ClearAllPoints()
		text:SetPoint('TOP', bar, 'BOTTOM', 0, -4)
		text:SetFont(font, fontsize, 'THINOUTLINE')
		text:SetShadowColor(0, 0, 0, 0)
		
	end