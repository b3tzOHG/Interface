
local _, nMinimap = ...

local isGuildGroup = isGuildGroup

local function HideDifficultyFrame()
    GuildInstanceDifficulty:EnableMouse(false)
    GuildInstanceDifficulty:SetAlpha(0)

    MiniMapInstanceDifficulty:EnableMouse(false)
    MiniMapInstanceDifficulty:SetAlpha(0)
end

function GetDifficultyText()
    local inInstance, instancetype = IsInInstance()
    local _, _, difficultyIndex, _, _, _, _, _, instanceGroupSize = GetInstanceInfo()

    local instanceText = ''
    local guildStyle
    local mythicStyle = '|cffff0000M|r'
    local heroStyle = '|cffff00ffH|r'
    local lookingForRaidStyle = '|cffffffffLFR|r'
    local timewalkerStyle = '|cffffffffTW|r'

    if (isGuildGroup or GuildInstanceDifficulty:IsShown()) then
        guildStyle = '|cffffff00G|r'
    else
        guildStyle = ''
    end

    local DIFFICULTY_DUNGEON_MYTHIC = 23      
	local DIFFICULTY_PRIMARYRAID_MYTHIC = 16
    local DIFFICULTY_DUNGEON_TIMEWALKER = 24  
	local DIFFICULTY_DUNGEON_HEROIC = 2
	local DIFFICULTY_PRIMARYRAID_HEROIC = 15
	local DIFFICULTY_RAID10_HEROIC = 5
	local DIFFICULTY_RAID25_HEROIC = 6
	local DIFFICULTY_DUNGEON_CHALLENGE = 8
	local DIFFICULTY_PRIMARYRAID_LFR = 17
    local DIFFICULTY_RAID_LFR = 17

    local isMythicIndex = {
        [DIFFICULTY_PRIMARYRAID_MYTHIC] = true,
        [DIFFICULTY_DUNGEON_MYTHIC] = true,
    }

    local isHeroicIndex = {
        [DIFFICULTY_DUNGEON_HEROIC] = true,
        [DIFFICULTY_PRIMARYRAID_HEROIC] = true,
        [DIFFICULTY_RAID10_HEROIC] = true,
        [DIFFICULTY_RAID25_HEROIC] = true,
        [DIFFICULTY_DUNGEON_CHALLENGE] = true
    }

    local isLookingForRaidIndex = {
        [DIFFICULTY_PRIMARYRAID_LFR] = true,
        [DIFFICULTY_RAID_LFR] = true
    }

    local isTimewalkerIndex = {
        [DIFFICULTY_DUNGEON_TIMEWALKER] = true
    }

    if (inInstance) then
        instanceText = instanceGroupSize..guildStyle

        if (isMythicIndex[difficultyIndex]) then
            instanceText = instanceText..mythicStyle
        end

        if (isHeroicIndex[difficultyIndex]) then
            instanceText = instanceText..heroStyle
        end

        if (isLookingForRaidIndex[difficultyIndex]) then
            instanceText = lookingForRaidStyle
        end

        if (isTimewalkerIndex[difficultyIndex]) then
            instanceText = timewalkerStyle
        end
    end

    return instanceText
end

local f = Minimap
f.InstanceText = f:CreateFontString(nil, 'OVERLAY')
f.InstanceText:SetFont('Fonts\\ARIALN.ttf', 16, 'OUTLINE')
f.InstanceText:SetPoint('TOP', Minimap, 0, -3.5)
f.InstanceText:SetTextColor(1, 1, 1)
f.InstanceText:Show()

--[[
MiniMapInstanceDifficulty:UnregisterAllEvents()
MiniMapInstanceDifficulty:Hide()
MiniMapInstanceDifficulty:ClearAllPoints()
MiniMapInstanceDifficulty:SetPoint('TOPLEFT', Minimap, 1, 5)
MiniMapInstanceDifficulty:SetScale(0.9)

1 	Normal 	party 	
2 	Heroic 	party 	isHeroic
3 	10 Player 	raid 	toggleDifficultyID: 5
4 	25 Player 	raid 	toggleDifficultyID: 6
5 	10 Player (Heroic) 	raid 	isHeroic, toggleDifficultyID: 3
6 	25 Player (Heroic) 	raid 	isHeroic, toggleDifficultyID: 4
7 	Looking For Raid 	raid 	(Legacy LFRs; prior to SoO)
8 	Mythic Keystone 	party 	isHeroic, isChallengeMode
9 	40 Player 	raid 	
11 	Heroic Scenario 	scenario 	isHeroic
12 	Normal Scenario 	scenario 	
14 	Normal 	raid 	
15 	Heroic 	raid 	displayHeroic
16 	Mythic 	raid 	isHeroic, displayMythic
17 	Looking For Raid 	raid 	
18 	Event 	raid 	
19 	Event 	party 	
20 	Event Scenario 	scenario 	
23 	Mythic 	party 	isHeroic, displayMythic
24 	Timewalking 	party 	
25 	World PvP Scenario 	scenario 	
29 	PvEvP Scenario 	pvp 	
30 	Event 	scenario 	
32 	World PvP Scenario 	scenario 	
33 	Timewalking 	raid 	
34 	PvP 	pvp 	
38 	Normal 	scenario 	
39 	Heroic 	scenario 	displayHeroic
40 	Mythic 	scenario 	displayMythic
45 	PvP 	scenario 	displayHeroic
147 	Normal 	scenario 	(Warfronts)
148 	20 Player 	raid 	Classic WoW 20mans (ZG, AQ20)
149 	Heroic 	scenario 	displayHeroic (Warfronts)
151 	Looking For Raid 	raid 	(Timewalking)
152 	Visions of N'Zoth 	scenario 	
153 	Teeming Island 	scenario 	displayHeroic 

GuildInstanceDifficulty:UnregisterAllEvents()
GuildInstanceDifficulty:Hide()
GuildInstanceDifficulty:Show()
GuildInstanceDifficulty:ClearAllPoints()
GuildInstanceDifficulty:SetPoint('TOPLEFT', Minimap, 1, 5)
GuildInstanceDifficulty:SetScale(0.9)
--]]

hooksecurefunc(GuildInstanceDifficulty, 'Show', function()
    isGuildGroup = true
    HideDifficultyFrame()
end)

hooksecurefunc(GuildInstanceDifficulty, 'Hide', function()
    isGuildGroup = false
end)

hooksecurefunc(MiniMapInstanceDifficulty, 'Show', function()
    HideDifficultyFrame()
end)

GuildInstanceDifficulty:HookScript('OnEvent', function(self)
    if (self:IsShown()) then
        isGuildGroup = true
    else
        isGuildGroup = false
    end

    Minimap.InstanceText:SetText(GetDifficultyText())
end)

MiniMapInstanceDifficulty:HookScript('OnEvent', function(self)
    Minimap.InstanceText:SetText(GetDifficultyText())
end)

    Minimap.InstanceText:SetAlpha(0)

    Minimap:HookScript('OnEnter', function(self)
        securecall('UIFrameFadeIn', self.InstanceText, 0.235, 0, 1)
    end)

    Minimap:HookScript('OnLeave', function(self)
        securecall('UIFrameFadeOut', self.InstanceText, 0.235, 1, 0)
    end)
