local A, L = ...

local function CreateBossStyle(self, unit)
	self:SetSize(widthBig, heightSmall + heightPower)
	L.F.createUnit(self)
	L.F.createPowerBar(self)
	L.F.createCastbar(self)
	L.F.HealthString(self)
	L.F.Name(self, 1)
	L.F.createUnitFader(self)
	
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
	
	local Auras = L.F.createAura(self, 3, 30, widthBig, 'RIGHT', 'UP')
		Auras:SetPoint('BOTTOMLEFT', self, 'TOPLEFT', 0, 3)
		Auras.initialAnchor = 'BOTTOMLEFT'
		Auras.gap = true
		--Auras.onlyShowPlayer = true
		Auras.CustomFilter = L.F.CustomAuraFilter
		self.Auras = Auras
		
	local altp = CreateFrame('StatusBar', nil, self)
		altp:SetStatusBarTexture(HAL_K)
		altp:SetHeight(heightPower)
		altp:SetWidth(widthBig)
		L.F.createBD(altp, altp)
	altp:SetPoint('TOP', self, 'BOTTOM', 0, -1)
	self.AlternativePower = altp
end

oUF:RegisterStyle('oUF_NardenBoss', CreateBossStyle)
oUF:Factory(function(self)
oUF:SetActiveStyle('oUF_NardenBoss')
	local boss = {}
	for i = 1, MAX_BOSS_FRAMES do
		boss[i] = oUF:Spawn('boss' .. i, 'oUF_NardenBoss' .. i)
		if (i == 1) then
			boss[i]:SetPoint(unpack(bossPosition))
		else
			boss[i]:SetPoint('BOTTOM', boss[i-1], 'TOP', 0, 55)
		end
	end
end)

-- -- Only for testing.
 
SlashCmdList["TESTBOSS"] = function()
    oUF_NardenBoss1:Show(); oUF_NardenBoss1.Hide = function() end oUF_NardenBoss1.unit = "player"
    oUF_NardenBoss2:Show(); oUF_NardenBoss2.Hide = function() end oUF_NardenBoss2.unit = "player"
    oUF_NardenBoss3:Show(); oUF_NardenBoss3.Hide = function() end oUF_NardenBoss3.unit = "player"
    oUF_NardenBoss4:Show(); oUF_NardenBoss4.Hide = function() end oUF_NardenBoss4.unit = "player"
	oUF_NardenBoss5:Show(); oUF_NardenBoss5.Hide = function() end oUF_NardenBoss5.unit = "player"
end
SLASH_TESTBOSS1 = "/TestBoss"