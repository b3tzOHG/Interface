local A, L = ...

local function CreatePlayerStyle(self, unit)
	self:SetSize(widthBig, heightSmall + heightPower)
	L.F.createUnit(self)
	L.F.createPowerBar(self)
	L.F.PowerString(self)
	L.F.createCastbar(self)
	L.F.createPlayerThings(self)
	L.F.createCombatFeedbackText(self, 90)
	L.F.createPowerPrediction(self)
	
	self.GCD = CreateFrame('Frame', nil, self)
	self.GCD:SetPoint('LEFT', self.Castbar, 'LEFT')
	self.GCD:SetPoint('RIGHT', self.Castbar, 'RIGHT')
	self.GCD:SetHeight(20)
	
	self.GCD.Spark = self.GCD:CreateTexture(nil, "OVERLAY")
	self.GCD.Spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
	self.GCD.Spark:SetBlendMode("ADD")
	self.GCD.Spark:SetSize(20, 20)
	self.GCD.Spark:SetPoint('LEFT', self.Castbar, 'LEFT', 0, 0)
end

oUF:RegisterStyle('oUF_NardenPlayer', CreatePlayerStyle)
oUF:SetActiveStyle('oUF_NardenPlayer')
oUF:Spawn('player', 'oUF_NardenPlayer'):SetPoint(unpack(playerPosition))
