
local _, nMinimap = ...
--[[
local classColor = RAID_CLASS_COLORS[select(2, UnitClass('player'))]

TimeManagerClockTicker:SetFont('Fonts\\ARIALN.ttf', 15, 'OUTLINE')
TimeManagerClockTicker:SetShadowOffset(0, 0)
TimeManagerClockTicker:SetTextColor(classColor.r, classColor.g, classColor.b)
TimeManagerClockTicker:SetPoint('TOPRIGHT', TimeManagerClockButton, 0, 0)
]]--

TimeManagerClockButton:ClearAllPoints()
--TimeManagerClockButton:GetRegions():Hide()
TimeManagerClockButton:Hide()
--TimeManagerClockButton:SetWidth(40)
--TimeManagerClockButton:SetHeight(18)
--TimeManagerClockButton:SetPoint('BOTTOM', Minimap, 0, 2)

--TimeManagerAlarmFiredTexture:SetTexture(nil)
--[[
hooksecurefunc(TimeManagerAlarmFiredTexture, 'Show', function()
    TimeManagerClockTicker:SetTextColor(1, 0, 1)
end)

hooksecurefunc(TimeManagerAlarmFiredTexture, 'Hide', function()
    TimeManagerClockTicker:SetTextColor(classColor.r, classColor.g, classColor.b)
end)]]--