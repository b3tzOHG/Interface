local A, L = ...

local _G = _G
local font = 'Fonts\\ARIALN.ttf'
local fontoutline = 'THINOUTLINE'
local fontsize = 16
local margin, buffsPerRow, sizeBuff, sizeDebuff = 4, 8, 40, 60
local textureBorder = 'Interface\\AddOns\\!nCore\\media\\Button\\Normal_Square.tga'

local origSecondsToTimeAbbrev = _G.SecondsToTimeAbbrev
local function SecondsToTimeAbbrevHook(seconds)
    origSecondsToTimeAbbrev(seconds)
	
    local tempTime
    if (seconds < 60) then
	tempTime = (seconds)
        return '|cffffffff%d|r', tempTime
    end

    return '', seconds
end
SecondsToTimeAbbrev = SecondsToTimeAbbrevHook

BuffFrame:SetScript('OnUpdate', nil)
hooksecurefunc(BuffFrame, 'Show', function(self)
    self:SetScript('OnUpdate', nil)
end)

BuffFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
BuffFrame:HookScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        BuffFrame_Update()
    end
end)

-- TemporaryEnchantFrame ...
TempEnchant1:ClearAllPoints()
TempEnchant1:SetPoint('TOPRIGHT', Minimap, 'TOPLEFT', -margin*2, 0)

TempEnchant2:ClearAllPoints()
TempEnchant2:SetPoint('TOPRIGHT', TempEnchant1, 'TOPLEFT', -margin, 0)

local function UpdateFirstButton(self)
    if (self and self:IsShown()) then
        self:ClearAllPoints()
        if (UnitHasVehicleUI('player')) then
            self:SetPoint('TOPRIGHT', TempEnchant1)
            return
        else
            if (BuffFrame.numEnchants > 0) then
                self:SetPoint('TOPRIGHT', _G['TempEnchant'..BuffFrame.numEnchants], 'TOPLEFT', -margin, 0)
                return
            else
                self:SetPoint('TOPRIGHT', TempEnchant1)
                return
            end
        end
    end
end

local function CheckFirstButton()
    if (BuffButton1) then
		UpdateFirstButton(BuffButton1)
    end
end

hooksecurefunc('BuffFrame_UpdateAllBuffAnchors', function()
    local previousBuff, aboveBuff
    local numBuffs = 0
    local numTotal = BuffFrame.numEnchants

    for i = 1, BUFF_ACTUAL_DISPLAY do
        local buff = _G['BuffButton'..i]

		numBuffs = numBuffs + 1
		numTotal = numTotal + 1

		buff:ClearAllPoints()
		if (numBuffs == 1) then
			UpdateFirstButton(buff)
		elseif (numBuffs > 1 and mod(numTotal, buffsPerRow) == 1) then
			if (numTotal == buffsPerRow + 1) then
				--buff:SetPoint('TOPRIGHT', TempEnchant1, 'TOPLEFT', -margin, 0)
				buff:SetPoint('TOP', TempEnchant1, 'BOTTOM', 0, -margin)
			else
				--buff:SetPoint('RIGHT', aboveBuff, 'LEFT', -margin, 0)
				buff:SetPoint('TOP', aboveBuff, 'BOTTOM', 0, -margin)
			end

			aboveBuff = buff
		else	
			buff:SetPoint('TOPRIGHT', previousBuff, 'TOPLEFT', -margin, 0)
			--buff:SetPoint('TOPLEFT', previousBuff, 'BOTTOMLEFT', 0, -margin)
		end

		previousBuff = buff
    end
end)

hooksecurefunc("DebuffButton_UpdateAnchors", function(self, index)
    local numBuffs = BUFF_ACTUAL_DISPLAY + BuffFrame.numEnchants
    local rowSpacing
    local debuffSpace = sizeBuff + margin
    local numRows = ceil(numBuffs/buffsPerRow)

    if numRows and numRows > 1 then
        rowSpacing = -numRows * debuffSpace
    else
        rowSpacing = -debuffSpace
    end

    local buff = _G[self..index]
    buff:ClearAllPoints()

    if index == 1 then
        buff:SetPoint("TOPRIGHT", TempEnchant1, "BOTTOMRIGHT", 0, rowSpacing)
    elseif index >= 2 and mod(index, buffsPerRow) == 1 then
        buff:SetPoint("TOP", _G[self..(index-buffsPerRow)], "BOTTOM", 0, -margin)
    else
        buff:SetPoint("TOPRIGHT", _G[self..(index-1)], "TOPLEFT", -margin, 0)
    end
end)

for i = 1, NUM_TEMP_ENCHANT_FRAMES do
    local button = _G['TempEnchant'..i]
    button:SetSize(sizeBuff, sizeBuff)

    button:SetScript('OnShow', function()
        CheckFirstButton()
    end)

    button:SetScript('OnHide', function()
        CheckFirstButton()
    end)

    local icon = _G['TempEnchant'..i..'Icon']
    icon:SetTexCoord(.1, .9, .1, .9)

    local duration = _G['TempEnchant'..i..'Duration']
    duration:ClearAllPoints()
    duration:SetPoint('BOTTOM', button, 'BOTTOM', 0, 2)
    duration:SetFont(font, fontsize, fontoutline)
	duration:SetShadowOffset(0, 0)
    duration:SetDrawLayer('OVERLAY')
	
	local border = _G["TempEnchant"..i.."Border"]
    border:ClearAllPoints()
    border:SetPoint("TOPRIGHT", button, 1, 1)
    border:SetPoint("BOTTOMLEFT", button, -1, -1)
    border:SetTexture(textureBorder)
    border:SetTexCoord(0, 1, 0, 1)
    border:SetVertexColor(0.9, 0.25, 0.9)
end

hooksecurefunc('AuraButton_Update', function(self, index)
    local button = _G[self..index]

    if (button) then
		if button then
			if self:match("Debuff") then
				button:SetSize(sizeDebuff, sizeDebuff)
			else
                button:SetSize(sizeBuff, sizeBuff)
			end
        end

        local icon = _G[self..index..'Icon']
        if (icon) then
            icon:SetTexCoord(.1, .9, .1, .9)
        end

        local duration = _G[self..index..'Duration']
        if (duration) then
            duration:ClearAllPoints()
            duration:SetPoint('BOTTOM', button, 'BOTTOM', 0, 2)
            duration:SetFont(font, fontsize, fontoutline)
            duration:SetShadowOffset(0, 0)
            duration:SetDrawLayer('OVERLAY')
        end

        local count = _G[self..index..'Count']
        if (count) then
            count:ClearAllPoints()
            count:SetPoint('TOPRIGHT', button, 1, 0)
            count:SetFont('Fonts\\ARIALN.ttf', 14, 'THINOUTLINE')
            count:SetShadowOffset(0, 0)
            count:SetDrawLayer('OVERLAY')
        end
		
		local border = _G[self..index..'Border']
        if (border) then
			local r, g, b = border:GetVertexColor()
			border:SetTexture(textureBorder)
			border:SetPoint("TOPRIGHT", button, 1, 1)
            border:SetPoint("BOTTOMLEFT", button, -1, -1)
			border:SetVertexColor(r, g, b)
			border:SetTexCoord(0, 1, 0, 1)
       end
	   
		if button and not border then
			if not button.texture then
				button.texture = button:CreateTexture("$parentOverlay", "ARTWORK")
                button.texture:SetParent(button)
                button.texture:SetTexture(textureBorder)
                button.texture:SetPoint("TOPRIGHT", button, 1, 1)
                button.texture:SetPoint("BOTTOMLEFT", button, -1, -1)
                button.texture:SetVertexColor(0, 0, 0)
			end	
		end
	end	
end)