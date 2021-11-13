local A, L = ...

local function CreateTargetStyle(self, unit)
	self:SetSize(widthBig, heightSmall + heightPower)
	L.F.createUnit(self)
	L.F.createPowerBar(self)
	L.F.createCastbar(self)
	L.F.HealthString(self)
	L.F.Name(self, 1)
	L.F.createUnitFader(self)
			
	local Auras = L.F.createAura(self, 20, 30, widthBig, 'RIGHT', 'UP')
		Auras:SetPoint('BOTTOMLEFT', self, 'TOPLEFT', 0, 3)
		Auras.initialAnchor = 'BOTTOMLEFT'
		Auras.gap = true
		--Auras.spacing = 5
		Auras.CustomFilter = L.F.CustomAuraFilter
		self.Auras = Auras 
end

oUF:RegisterStyle('oUF_NardenTarget', CreateTargetStyle)
oUF:SetActiveStyle('oUF_NardenTarget')
oUF:Spawn('target', 'oUF_NardenTarget'):SetPoint(unpack(targetPosition))
		
		