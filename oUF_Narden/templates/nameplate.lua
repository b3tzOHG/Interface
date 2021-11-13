local A, L = ...

local cvars = {
    -- important, strongly recommend to set these to 1
    nameplateGlobalScale = 1,
    NamePlateHorizontalScale = 1,
    NamePlateVerticalScale = 1,
    -- optional, you may use any values
    nameplateLargerScale = 1,
    nameplateMaxScale = 1,
    nameplateMinScale = 1,
    nameplateSelectedScale = 1,
    nameplateSelfScale = 1,
	nameplateShowOnlyNames = 1, 

	nameplateMaxAlpha = 1,
	nameplateMaxAlphaDistance = 40,
	nameplateMinAlpha = 1,
	nameplateMinAlphaDistance = 0,
	nameplateSelectedAlpha = 1,
	
	nameplateShowFriendlyNPCs = 0, 
	--nameplateOtherTopInset = -1,
	--nameplateOtherBottomInset = -1,
	nameplateOtherTopInset = 0.08,
	nameplateOtherBottomInset = 0.1,
	
	nameplateOverlapH = 0.8,
	nameplateOverlapV = 1.1, 
}

local function CreateNameplateStyle(self, unit)
	self:SetSize(162, 25)
	self:SetPoint("CENTER", 0, 0)
	self:SetScale(768/1080)
	L.F.createBD(self, self)
	
	L.F.createHealthBar(self)	
	L.F.Healcomm(self)
	L.F.createRaidIcon(self)
	L.F.Name(self, 3)
	L.F.createCastbar(self)
	L.F.createCombatFeedbackText(self, 35)
	self.Health:SetPoint('BOTTOM', 0, 0)
	L.F.createUnitFader(self)
		
	local Auras = L.F.createAura(self, 5, 30, 162, 'RIGHT', 'UP')
	Auras:SetPoint('BOTTOMLEFT', self, 'TOPLEFT', 0, 3)
	Auras.initialAnchor = 'BOTTOMLEFT'
	Auras.numBuffs = 0
	Auras.onlyShowPlayer = true
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
end

local GetNamePlateForUnit = C_NamePlate.GetNamePlateForUnit
local previousTarget
 
local function OnTargetChanged()
    local parent = GetNamePlateForUnit('target')
    local currentTarget = parent and parent.unitFrame
 
    if currentTarget == previousTarget then return end
 
    if previousTarget then
        previousTarget.targetborder:SetBackdropBorderColor(0, 0, 0)
        previousTarget = nil
    end
 
    if currentTarget then
        currentTarget.targetborder:SetBackdropBorderColor(1, 1, 1)
        previousTarget = currentTarget
    end
end

oUF:RegisterStyle('oUF_NardenNameplates', CreateNameplateStyle)
oUF:SetActiveStyle('oUF_NardenNameplates')
oUF:SpawnNamePlates('oUF_NardenNameplates', OnTargetChanged, cvars)