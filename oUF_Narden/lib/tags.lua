local addonName, addon = ...

-- > ColorZ
-- oUF.colors.reaction = {
	-- [1] = { 0.87, 0.37, 0.37 }, -- Hated
	-- [2] = { 0.87, 0.37, 0.37 }, -- Hostile
	-- [3] = { 0.87, 0.37, 0.37 }, -- Unfriendly
	-- [4] = { 0.85, 0.77, 0.36 }, -- Neutral
	-- [5] = { 0.29, 0.67, 0.30 }, -- Friendly
	-- [6] = { 0.29, 0.67, 0.30 }, -- Honored
	-- [7] = { 0.29, 0.67, 0.30 }, -- Revered
	-- [8] = { 0.29, 0.67, 0.30 }, -- Exalted
-- }

-- oUF.colors.power = {
	-- ["MANA"]              = {0.31, 0.45, 0.63},
	-- ["INSANITY"]          = {0.40, 0.00, 0.80},
	-- ["MAELSTROM"]         = {0.00, 0.50, 1.00},
	-- ["LUNAR_POWER"]       = {0.93, 0.51, 0.93},
	-- ["HOLY_POWER"]        = {0.95, 0.90, 0.60},
	-- ["RAGE"]              = {0.69, 0.31, 0.31},
	-- ["FOCUS"]             = {0.71, 0.43, 0.27},
	-- ["ENERGY"]            = {0.65, 0.63, 0.35},
	-- ["CHI"]               = {0.71, 1.00, 0.92},
	-- ["RUNES"]             = {0.55, 0.57, 0.61},
	-- ["SOUL_SHARDS"]       = {0.50, 0.32, 0.55},
	-- ["FURY"]              = {0.78, 0.26, 0.99},
	-- ["PAIN"]              = {1.00, 0.61, 0.00},
	-- ["RUNIC_POWER"]       = {0.00, 0.82, 1.00},
	-- ["AMMOSLOT"]          = {0.80, 0.60, 0.00},
	-- ["FUEL"]              = {0.00, 0.55, 0.50},
	-- ["POWER_TYPE_STEAM"]  = {0.55, 0.57, 0.61},
	-- ["POWER_TYPE_PYRITE"] = {0.60, 0.09, 0.17},
	-- ["ALTPOWER"]          = {0.00, 1.00, 1.00},
	-- ["ANIMA"]             = {0.83, 0.83, 0.83},
-- }

--> Short Names
utf8sub = function(string, index)
    local bytes = string:len()
    if (bytes <= index) then
        return string
    else
        local length, currentIndex = 0, 1

        while currentIndex <= bytes do
            length = length + 1
            local char = string:byte(currentIndex)

            if (char > 240) then
                currentIndex = currentIndex + 4
            elseif (char > 225) then
                currentIndex = currentIndex + 3
            elseif (char > 192) then
                currentIndex = currentIndex + 2
            else
                currentIndex = currentIndex + 1
            end

            if (length == index) then
                break
            end
        end

        if (length == index and currentIndex <= bytes) then
            return string:sub(1, currentIndex - 1)
        else
            return string
        end
    end
end

local ShortValue = function(val)
	if(val >= 1e6) then
		return format("%.2fm", val * 0.000001)
	elseif(val >= 1e4) then
		return format("%.1fk", val * 0.001)
	else
		return val
	end
end

-- > Unit Status

local function Status(unit)
	if(not UnitIsConnected(unit)) then
		return 'Off'
	--if (UnitIsGhost(unit)) then
	elseif(UnitIsGhost(unit)) then
		return 'Ghost'
	elseif(UnitIsDead(unit)) then
		return 'Dead'
	end
end
oUF.Tags.Events['narden:status'] = 'UNIT_HEALTH PLAYER_UPDATE_RESTING UNIT_CONNECTION'
oUF.Tags.Methods['narden:status'] = Status


oUF.Tags.Events['narden:PartyName'] = 'UNIT_NAME_UPDATE UNIT_HEALTH UNIT_CONNECTION'
oUF.Tags.Methods['narden:PartyName'] = function(unit)
	local status = Status(unit)
		if status then 
			return status
		end

	local name = UnitName(unit)
	return utf8sub(name, 4)

end
	
oUF.Tags.Events['narden:health'] = 'UNIT_MAXHEALTH'
oUF.Tags.Methods['narden:health'] = function(unit)
	local max = UnitHealthMax(unit)
	if(UnitHealth(unit) == max) then
		return max
	end
end


oUF.Tags.Events['narden:deficit'] = 'UNIT_HEALTH UNIT_MAXHEALTH'
oUF.Tags.Methods['narden:deficit'] = function(unit)
	if (Status(unit)) then return end
	
	local cur, max = UnitHealth(unit), UnitHealthMax(unit)
	if(cur ~= max) then
		return ('|cffff8080-%s|r'):format(ShortValue(max-cur))
	end
end

oUF.Tags.Events['narden:percent'] = 'UNIT_HEALTH UNIT_MAXHEALTH'
oUF.Tags.Methods['narden:percent'] = function(unit)
	if(Status(unit)) then return end
	
	return('%d|cff0090ff%%|r'):format(UnitHealth(unit)/UnitHealthMax(unit)*100)
end


oUF.Tags.Events['narden:thealth'] = 'UNIT_HEALTH UNIT_MAXHEALTH'
oUF.Tags.Methods['narden:thealth'] = function(unit)
	if(Status(unit)) then return end
	
	if(UnitCanAttack('player', unit)) then
		return('%s (%s)'):format(ShortValue(UnitHealth(unit)), _TAGS['narden:percent'](unit))
	else
		local maxHealth = _TAGS['narden:health'](unit)
		if(maxHealth) then
			return ShortValue(maxHealth)
		else
			return ('%s |cff0090ff/|r %s'):format(ShortValue(UnitHealth(unit)), ShortValue(UnitHealthMax(unit)))
		end
	end
end

oUF.Tags.Events['powercolor'] = 'UNIT_DISPLAYPOWER'
oUF.Tags.Methods['powercolor'] = function(unit)
    --local _, powerType = UnitPowerType(unit)
    --return Hex(_COLORS.power[powerType] or _COLORS.power.MANA)
	
	 local reaction = UnitReaction(unit, 'player')
	 if(not UnitIsPlayer(unit) and reaction) then
		return Hex(_COLORS.reaction[reaction])
	 else	
		return _TAGS['raidcolor'](unit)
	 end
end

oUF.Tags.Events['narden:power'] = 'UNIT_POWER_UPDATE PLAYER_SPECIALIZATION_CHANGED'
oUF.Tags.Methods['narden:power'] = function(unit)
	local myclass = select(2, UnitClass("player"))
	local tree = GetSpecialization()
	local p = _TAGS['perpp'](unit)
	--
	if (myclass=='WARRIOR') or (myclass == 'PRIEST' and tree == 3) or (myclass =='SHAMAN' and tree == 1) or (myclass == 'DEATHKNIGHT') or (myclass == 'ROGUE') or (myclass == 'HUNTER') or (myclass == 'MONK') or (myclass == 'DEMONHUNTER') then
		if (p == 0) then 
			return
		else
			return p
		end
	else 
		return 
	end
end	

oUF.Tags.Events['narden:color'] = 'UNIT_FACTION'
oUF.Tags.Methods['narden:color'] = function(unit)
	local reaction = UnitReaction(unit, 'player')
	if(UnitIsTapDenied(unit) or not UnitIsConnected(unit)) then
			return '|cff999999'
	elseif(not UnitIsPlayer(unit) and reaction) then
		return Hex(_COLORS.reaction[reaction])
	else	
		return _TAGS['raidcolor'](unit)
	end
end

local function FindBuffById(spellId)
	for i = 1, 40 do
		local unitSpellId = select(10, UnitBuff("player", i))
		if not unitSpellId then
			return
		elseif spellId == unitSpellId then
			return UnitBuff("player", i)
		end
	end
end

local trackingList = {
	-- {spellID, tree}
	SHAMAN = {
		{53390, 1},
		--{974, 3},
	},
	PRIEST = {
		--{194249, 3},
	},
	MAGE = {
		{205473, 3},
	}, 
	PALADIN = {
		--{114250, 3}, -- retri flash
		--{297412, 3}, -- devout spirit - holy
	}, 
}

oUF.Tags.Events['narden:stacks'] = 'UNIT_AURA'
oUF.Tags.Methods['narden:stacks'] = function(unit)
	local myclass = select(2,UnitClass('player'))
	local count
			
	local buffs = {}
	
	if (trackingList[myclass]) then
		for key, value in pairs(trackingList[myclass]) do
			tinsert(buffs, value)
		end
	end
	
	if (buffs) then
		for key, spell in pairs(buffs) do 
			_, _, count = FindBuffById(spell[1])
		end
	end	
	return count
end