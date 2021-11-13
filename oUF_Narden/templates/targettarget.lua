local A, L = ...

local function CreateTargetTargetStyle(self, unit)
	self:SetSize(widthSmall, heightSmall + heightPower)
	L.F.createUnit(self)
	L.F.createPowerBar(self)
	L.F.Name(self, nil)
	L.F.createUnitFader(self)
	--self.Health:SetPoint('BOTTOM', self, 0, 0)
end

oUF:RegisterStyle('oUF_NardenTargetTarget', CreateTargetTargetStyle)
oUF:SetActiveStyle('oUF_NardenTargetTarget')
oUF:Spawn('targettarget', 'oUF_NardenTargetTarget'):SetPoint(unpack(targettargetPosition))