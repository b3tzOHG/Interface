local lvlMode = false

local function SetPosition(frame, ...)
    if type(frame) == 'string' then
        UIPARENT_MANAGED_FRAME_POSITIONS[frame] = nil
        frame = _G[frame]
    end
    if type(frame) == 'table' and type(frame.IsObjectType) == 'function' and frame:IsObjectType('Frame') then
        local name = frame:GetName()
        if name then
            UIPARENT_MANAGED_FRAME_POSITIONS[name] = nil
        end
        frame:SetMovable(true)
        frame:SetUserPlaced(true)
        frame:SetDontSavePosition(true)
        frame.ignoreFramePositionManager = true
        if ... then
            frame:ClearAllPoints()
            frame:SetPoint(...)
        end
        frame:SetMovable(false)
    end
end

--MawBuffsBelowMinimapFrame.Container:ClearAllPoints()
--MawBuffsBelowMinimapFrame.Container:SetPoint('LEFT', UIParent, 'LEFT')


local frame = CreateFrame("Frame")
local HiddenFrame = CreateFrame('Frame', nil)
HiddenFrame:Hide()
local MicroButtonArray = {
	"CharacterMicroButton",
	"SpellbookMicroButton",
	"TalentMicroButton",
	"AchievementMicroButton",
	"QuestLogMicroButton",
	"GuildMicroButton",
	"LFDMicroButton",
	"CollectionsMicroButton",
	"EJMicroButton",
	"StoreMicroButton",
	"MainMenuMicroButton"
}

frame:RegisterEvent("ADDON_LOADED")

local function SetFramesAlpha(alpha)
	MainMenuBar:SetAlpha(alpha)
	StatusTrackingBarManager:SetAlpha(0)
	MicroButtonAndBagsBar:SetAlpha(0)
	MultiBarLeft:SetAlpha(0)
	MultiBarRight:SetAlpha(0)
	--ExtraActionButton1:SetAlpha(1)
	
	for _, MicroButton in pairs (MicroButtonArray) do
	
		_G[MicroButton]:SetAlpha(0)
	end
end

local function HideActionBarBG()
	MainMenuBarArtFrameBackground:Hide()
	ActionBarUpButton:Hide()
	ActionBarDownButton:Hide()
	MainMenuBarArtFrame.PageNumber:Hide()
end

local function HideMenuBG()
	MicroButtonAndBagsBar.MicroBagBar:Hide()
end

local function HideBags()
	MicroButtonAndBagsBar:Hide()
end

local function HideMenu()
	for _, MicroButton in pairs(MicroButtonArray) do

		_G[MicroButton]:ClearAllPoints()
		_G[MicroButton]:SetPoint("LEFT", WorldFrame, "RIGHT", 0, 0)
		
		if MicroButton ~= "AchievementMicroButton" then -- Avoids errors with AchievementMicroButton_Update
			_G[MicroButton]:HookScript("OnShow", function() 
				_G[MicroButton]:Hide()
			end)
		end
	end

	-- TalentMicroButton:HookScript("OnShow", function() 
		-- TalentMicroButton:Hide()
	-- end)

	-- CharacterMicroButtonAlert:HookScript("OnShow", function() 
		-- CharacterMicroButtonAlert:Hide()
	-- end)
end

local function HideButtonText()
	
	local bars = {
		"Action",
		"MultiBarBottomLeft", 
		"MultiBarBottomRight",
		"MultiBarLeft", 
		"MultiBarRight"
	}
	
	for _, bar in pairs(bars) do
		
		for i = 1, 12 do
			_G[bar.."Button"..i.."HotKey"].Show = function() end
			_G[bar.."Button"..i.."HotKey"]:Hide()
			_G[bar.."Button"..i.."Name"]:Hide()

		end
	end
end

if (UnitLevel('player') == MAX_PLAYER_LEVEL) or not lvlMode then 
	SetPosition(MainMenuBar, 'CENTER', 0, -3000)
	--SetPosition(ExtraActionButton1, 'BOTTOM', UIParent, 'BOTTOM', -350, 50)
	SetPosition(ExtraActionButton1, 'CENTER', UIParent, 'CENTER', -350, -50)
	-- SCRIPTS for MAX LEVEL--
	frame:SetScript("OnEvent", function(self, event, arg1)
		if event == "ADDON_LOADED" then
			SetFramesAlpha(0)
			MainMenuBarArtFrame.LeftEndCap:Hide()
			MainMenuBarArtFrame.RightEndCap:Hide()
			HideBags()
			HideMenu()
			HideActionBarBG()
			HideMenuBG()
			HideButtonText()
		end
	end)
end
if lvlMode then
	--SetPosition(MainMenuBar, 'BOTTOM', 0, 0)
	--SetPosition(MultiBarBottomLeft, 'BOTTOM', MainMenuBar, 'TOP', 0, 0)
	--SetPosition(MultiBarBottomRight, 'LEFT', MainMenuBar, 'RIGHT', 0, 0)
	SetPosition(ExtraActionButton1, 'BOTTOM', UIParent, 'BOTTOM', -350, 50)
	-- SCRIPTS for Leveling --
	frame:SetScript("OnEvent", function(self, event, arg1)
		if event == "ADDON_LOADED" then
			SetFramesAlpha(1)
			MainMenuBarArtFrame.LeftEndCap:Hide()
			MainMenuBarArtFrame.RightEndCap:Hide()
			HideBags()
			HideMenu()
			HideActionBarBG()
			HideMenuBG()
			HideButtonText()
		end
	end)
end