local A, L = ...

local function CreatePetStyle(self, unit)
	self:SetSize(widthSmall, heightSmall + heightPower)
	L.F.createUnit(self)
	L.F.createPowerBar(self)
	L.F.Name(self, nil)
	--self.Health:SetPoint('BOTTOM', self, 0, 0)
end

oUF:RegisterStyle('oUF_NardenPet', CreatePetStyle)
oUF:SetActiveStyle('oUF_NardenPet')
oUF:Spawn('pet', 'oUF_NardenPet'):SetPoint(unpack(petPosition))