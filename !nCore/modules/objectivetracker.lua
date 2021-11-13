local height    = 450               -- overall height
local width     = 250               -- overall width
local otf       = ObjectiveTrackerFrame

hooksecurefunc(otf, 'SetPoint', function(self)
	if moving then return end
	moving = true
	self:SetMovable(true)
	self:SetUserPlaced(true)
	self:ClearAllPoints()
	self:SetPoint('TOPRIGHT', Minimap, 'BOTTOMRIGHT',  3, -166)
	self:SetHeight(height)
	--self:SetWidth(width)
	--self:SetParent(Minimap)
	self:SetScale(1)
	self:SetMovable(false)
	moving = nil
end)
