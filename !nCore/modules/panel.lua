local showTop = true
local showDown = true
local HAL_K = 'Interface\\TargetingFrame\\UI-StatusBar.blp'

if not showDown == true then return end
local classcolor = RAID_CLASS_COLORS[select(2, UnitClass("player"))]
	
local CreateBD = function (f, r, g, b, a)
		f:SetBackdrop({
				bgFile = "Interface\\AddOns\\oUF_Narden\\media\\HalA",
				edgeFile = "Interface\\ChatFrame\\ChatFrameBackground",
				edgeSize = 1,
						})
		f:SetBackdropColor(r, g, b, a)
		--f:SetBackdropColor(1/6, 1/6, 2/7, a or 0.7)
		f:SetBackdropBorderColor(0, 0, 0)
end
	
local createBorder = function(self)				-- create a 1px border around frames (on the outside)
		local bd = CreateFrame('Frame', nil, self)
		bd:SetPoint('TOPLEFT', self, 'TOPLEFT', -1, 1)
		bd:SetPoint('BOTTOMRIGHT', self, 'BOTTOMRIGHT', 1, -1)
		bd:SetFrameLevel(self:GetFrameLevel())
		CreateBD(bd)
		return bd
end

-- Pannelhöhe
--x = 14.46
x = 12
local width = 500
mult = 1

-- > panel bottom
local bar = CreateFrame("Frame", "panelbottom", UIParent, 'BackdropTemplate')
bar:SetFrameStrata("BACKGROUND")
bar:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", -1, -1)
bar:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 1, -1)
bar:SetHeight(x)
CreateBD(bar, 35/255, 35/255, 35/255, 0.3)

-- if (UnitLevel('player') == MAX_PLAYER_LEVEL) then
	-- local barleft = CreateFrame("Frame", "leftPannel", UIParent)
	-- barleft:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 32, 7)
	-- barleft:SetWidth(width)
	-- barleft:SetHeight(7)
	-- CreateBD(barleft, classcolor.r*mult, classcolor.g*mult, classcolor.b*mult, 1)
-- end

-- if not (UnitLevel('player') > 110) then
	-- local barright = CreateFrame("Frame", "rightPannel", UIParent)
	-- barright:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT",-32, 7)
	-- barright:SetWidth(width)
	-- barright:SetHeight(7)
	-- CreateBD(barright, classcolor.r, classcolor.g, classcolor.b, 1)
-- end
	local barleft = CreateFrame("Frame", "leftPannel", UIParent, 'BackdropTemplate')
	barleft:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 32, 7)
	barleft:SetWidth(width)
	barleft:SetHeight(7)
	CreateBD(barleft, classcolor.r*mult, classcolor.g*mult, classcolor.b*mult, 1)

	local barright = CreateFrame("Frame", "rightPannel", UIParent, 'BackdropTemplate')
	barright:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT",-32, 7)
	barright:SetWidth(width)
	barright:SetHeight(7)
	CreateBD(barright, classcolor.r, classcolor.g, classcolor.b, 1)

if not showTop == true then return end
-- > panel top
local bartop = CreateFrame('Frame', 'paneltop', UIParent, 'BackdropTemplate')
bartop:SetFrameStrata('BACKGROUND')
bartop:SetPoint('TOPLEFT', UIParent, 'TOPLEFT', -1, 1)
bartop:SetPoint('TOPRIGHT', UIParent, 'TOPRIGHT', 1, 1)
bartop:SetHeight(x-2)
CreateBD(bartop, 35/255, 35/255, 35/255, 0.7)

local topbarleft = CreateFrame("Frame", "paneltop", UIParent, 'BackdropTemplate')
topbarleft:SetPoint("TOPLEFT", UIParent, "TOPLEFT", 32, -5)
topbarleft:SetWidth(width)
topbarleft:SetHeight(7)
CreateBD(topbarleft, classcolor.r, classcolor.g, classcolor.b, 1)

local topbarright = CreateFrame("Frame", "paneltop", UIParent, 'BackdropTemplate')
topbarright:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -32, -5)
topbarright:SetWidth(width)
topbarright:SetHeight(7)
CreateBD(topbarright, classcolor.r, classcolor.g, classcolor.b, 1)
 