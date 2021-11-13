local A, L = ...

local function CreateRaidStyle(self, unit)
	L.F.createUnit(self)
	L.F.createPowerBar(self)
	L.F.Name(self, 2)
	L.F.CreateIndicators(self, self)
	L.F.createInfoIconParty(self)
	
	self.RaidTargetIndicator:SetSize(24, 24)
	self.RaidTargetIndicator:SetPoint('LEFT', 3, 0)
	
	local SummonIndicator = self:CreateTexture(nil, 'OVERLAY')
    SummonIndicator:SetSize(32, 32)
    SummonIndicator:SetPoint('CENTER', self)
    self.SummonIndicator = SummonIndicator
	
	local ResurrectIndicator = self:CreateTexture(nil, 'OVERLAY')
    ResurrectIndicator:SetSize(22, 22)
    ResurrectIndicator:SetPoint('CENTER', self)
	self.ResurrectIndicator = ResurrectIndicator
	
	local PhaseIndicator = self:CreateTexture(nil, 'OVERLAY')
    PhaseIndicator:SetSize(22, 22)
    PhaseIndicator:SetPoint('CENTER', self)
	self.PhaseIndicator = PhaseIndicator
	
	local Threat = CreateFrame('Frame', nil, self, 'BackdropTemplate')
		Threat:SetPoint('TOPRIGHT', 1, 1)
		Threat:SetPoint('BOTTOMLEFT', -1, -1)
		Threat:SetFrameStrata('LOW')
		Threat:SetBackdrop({
			bgFile = 'Interface\\ChatFrame\\ChatFrameBackground',
			edgeFile = 'Interface\\ChatFrame\\ChatFrameBackground',
			edgeSize = 1,
			insets = {top = 1, bottom = 1, left = 1, right = 1},
		})
		Threat:SetBackdropColor(0, 0, 0, 0)
		Threat:SetBackdropBorderColor(0, 0, 0, 0)
	Threat.Override = L.F.UpdateThreat
	self.ThreatIndicator = Threat
	
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
	
	local Debuffs = L.F.createAura(self, 2, 26, 55, 'RIGHT', 'UP')
	Debuffs:SetPoint('TOP', self, 'TOP', 0, 2)
	Debuffs.initialAnchor = 'TOPLEFT'
	Debuffs.num = 2
	Debuffs.CustomFilter = L.F.RaidDebuffFilter
	self.Debuffs = Debuffs
				
	local range = {
		insideAlpha = 1, 
		outsideAlpha = .6, 
	}
	self.Range = range 
end

oUF:RegisterStyle('oUF_NardenParty', CreateRaidStyle)
oUF:SetActiveStyle('oUF_NardenParty')
oUF:SpawnHeader('oUF_NardenParty', nil, 'party', 
		'showParty', true, 
		'showPlayer', true, 
		'showSolo' , false,
		'yoffset', -2, 
		'maxColumns', 5, 
		'unitsperColumn', 1, 
		'columnSpacing', 4, 
		'columnAnchorPoint', 'LEFT',
		'oUF-initialConfigFunction', ([[
			self:SetHeight(%d)
			self:SetWidth(%d)
		]]):format(heightBig, widthSmall)
	):SetPoint(unpack(raidPosition))
		
oUF:RegisterStyle('oUF_NardenRaid', CreateRaidStyle)
oUF:SetActiveStyle('oUF_NardenRaid')
oUF:SpawnHeader('oUF_NardenRaid', nil, 'raid', 
		'showParty', false,
		'showRaid', true,
		'showSolo', false, 
		'xoffset', 4,
		'yOffset', -4,
		'point', 'LEFT', 
		'groupFilter', '1, 2, 3, 4',
		'groupingOrder', '1, 2, 3, 4',
		'groupBy', 'GROUP',
		'maxColumns', 4,
		'unitsPerColumn', 5,
		'columnSpacing', 4,
		'columnAnchorPoint', 'TOP',
		'oUF-initialConfigFunction', ([[
				self:SetHeight(%d)
				self:SetWidth(%d)
		]]):format(heightBig, widthSmall)
	):SetPoint(unpack(raidPosition))

oUF:RegisterStyle('oUF_NardenRaid25', CreateRaidStyle)
oUF:SetActiveStyle('oUF_NardenRaid25')
oUF:SpawnHeader('oUF_NardenRaid25', nil, 'raid', 
		'showParty', false,
		'showRaid', true,
		'showSolo', false, 
		'xoffset', 4,
		'yOffset', -4,
		'point', 'LEFT', 
		'groupFilter', '1, 2, 3, 4, 5', 
		'groupingOrder', '1, 2, 3, 4, 5',
		'groupBy', 'GROUP',
		'maxColumns', 5,
		'unitsPerColumn', 5,
		'columnSpacing', 4,
		'columnAnchorPoint', 'TOP',
		'oUF-initialConfigFunction', ([[
				self:SetHeight(%d)
				self:SetWidth(%d)
		]]):format(heightBig, widthSmall)
	):SetPoint(unpack(raidPosition))

oUF:RegisterStyle('oUF_NardenRaid40', CreateRaidStyle)
oUF:SetActiveStyle('oUF_NardenRaid40')
oUF:SpawnHeader('oUF_NardenRaid40', nil, 'raid', 
		'showParty', false,
		'showRaid', true,
		'showSolo', false, 
		'xoffset', 4,
		'yOffset', -4,
		'point', 'TOP', 
		'groupFilter', '1, 2, 3, 4, 5, 6, 7, 8', 
		'groupingOrder', '1, 2, 3, 4, 5, 6, 7, 8',
		'groupBy', 'GROUP',
		'maxColumns', 8,
		'unitsPerColumn', 5,
		'columnSpacing', 4,
		'columnAnchorPoint', 'LEFT',
		'oUF-initialConfigFunction', ([[
				self:SetHeight(%d)
				self:SetWidth(%d)
		]]):format(heightBig, widthSmall)
	):SetPoint(unpack(raidPosition))

local SpawnPoint = CreateFrame('Frame')
SpawnPoint:RegisterEvent("PLAYER_ENTERING_WORLD")
SpawnPoint:RegisterEvent("GROUP_ROSTER_UPDATE")
SpawnPoint:RegisterEvent("PLAYER_SPECIALIZATION_CHANGED")
SpawnPoint:RegisterEvent("PLAYER_DIFFICULTY_CHANGED")
SpawnPoint:SetScript("OnEvent", function(self, event)
	if InCombatLockdown() then
		self:RegisterEvent("PLAYER_REGEN_ENABLED")
		return
	elseif event == "PLAYER_REGEN_ENABLED" then
		self:UnregisterEvent("PLAYER_REGEN_ENABLED")
	end
	
local num = GetNumGroupMembers()	
local difficulty =  GetRaidDifficultyID()
	
	-- -->> Organize Raidsize 
	if difficulty == 16 or (num < 21) then 
		oUF_NardenRaid:SetAttribute('showRaid', true)
		oUF_NardenRaid25:SetAttribute('showRaid', false)
		oUF_NardenRaid40:SetAttribute('showRaid', false)
	elseif num < 26 then	
		oUF_NardenRaid:SetAttribute('showRaid', false)
		oUF_NardenRaid25:SetAttribute('showRaid', true)
		oUF_NardenRaid40:SetAttribute('showRaid', false)
	
	else 
		oUF_NardenRaid:SetAttribute('showRaid', false)
		oUF_NardenRaid25:SetAttribute('showRaid', false)
		oUF_NardenRaid40:SetAttribute('showRaid', true)
	end
end)



