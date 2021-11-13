local A, L = ...

local function CreateArenaStyle(self, unit)
	self:SetSize(widthBig, heightSmall + heightPower)
	L.F.createUnit(self)
	L.F.createPowerBar(self)
	L.F.createCastbar(self)
	L.F.HealthString(self)
	L.F.Name(self, 1)
	L.F.createUnitFader(self)
		
	local Auras = L.F.createAura(self, 3, 30, widthBig, 'RIGHT', 'UP')
		Auras:SetPoint('BOTTOMLEFT', self, 'TOPLEFT', 0, 3)
		Auras.initialAnchor = 'BOTTOMLEFT'
		Auras.gap = true
		Auras.CustomFilter = L.F.CustomAuraFilter
		self.Auras = Auras
		
	local targetborder = CreateFrame('Frame', nil, self, 'BackdropTemplate')
	targetborder:SetPoint('TOPRIGHT', 1, 1)
		targetborder:SetPoint('BOTTOMLEFT', -1, -1)
		targetborder:SetFrameStrata('LOW')
		targetborder:SetBackdrop({
			bgFile = 'Interface\\ChatFrame\\ChatFrameBackground',
			edgeFile = 'Interface\\ChatFrame\\ChatFrameBackground',
			edgeSize = 1,
			insets = {top = 1, bottom = 1, left = 1, right = 1},
		})
		targetborder:SetBackdropColor(0, 0, 0, 0)
		targetborder:SetBackdropBorderColor(0, 0, 0, 0)
	self.targetborder = targetborder
	self:RegisterEvent('PLAYER_TARGET_CHANGED', L.F.UpdateTarget, true)
end

oUF:RegisterStyle('oUF_NardenArena', CreateArenaStyle)
oUF:Factory(function(self)
oUF:SetActiveStyle('oUF_NardenArena')
	local arena = {}
	for i = 1, 5 do
		arena[i] = oUF:Spawn('arena' .. i, 'oUF_NardenArena' .. i)
		if (i == 1) then
			arena[i]:SetPoint(unpack(bossPosition))
		else
			arena[i]:SetPoint('BOTTOM', arena[i-1], 'TOP', 0, 55)
		end
	end
end)

-- Only for testing.
 
SlashCmdList["TESTARENA"] = function()
    oUF_NardenArena1:Show(); oUF_NardenArena1.Hide = function() end oUF_NardenArena1.unit = "player"
    oUF_NardenArena2:Show(); oUF_NardenArena2.Hide = function() end oUF_NardenArena2.unit = "player"
    oUF_NardenArena3:Show(); oUF_NardenArena3.Hide = function() end oUF_NardenArena3.unit = "player"
    oUF_NardenArena4:Show(); oUF_NardenArena4.Hide = function() end oUF_NardenArena4.unit = "player"
    oUF_NardenArena5:Show(); oUF_NardenArena5.Hide = function() end oUF_NardenArena5.unit = "player"
end
SLASH_TESTARENA1 = "/TestArena"