SlashCmdList['CHAT'] = function ()
	FCF_ResetChatWindows()
	FCF_SetWindowName(ChatFrame1, 'G,S,W')
	FCF_SetLocked(ChatFrame1, 1)
	
	
	FCF_DockFrame(ChatFrame2)
	FCF_SetWindowName(ChatFrame2, 'Log')
	FCF_SetLocked(ChatFrame2, 1)

	FCF_OpenNewWindow(ChatFrame3)
	FCF_SetWindowName(ChatFrame3, 'Trade')
	FCF_DockFrame(ChatFrame3)
	FCF_SetLocked(ChatFrame3, 1)

	-- FCF_OpenNewWindow(ChatFrame4)
	-- FCF_SetWindowName(ChatFrame4, 'Details')
	-- FCF_DockFrame(ChatFrame4)
	-- FCF_SetLocked(ChatFrame4, 1)
	
	ChatFrame1:ClearAllPoints()
	ChatFrame1:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", 33, 16)
	ChatFrame1:SetSize(500, 185)
	ChatFrame1:SetUserPlaced(true)
	FCF_SavePositionAndDimensions(ChatFrame1)
		
	ChatFrame_RemoveAllMessageGroups(ChatFrame1)
	ChatFrame_AddChannel(ChatFrame1, GENERAL)
	ChatFrame_RemoveChannel(ChatFrame1, TRADE)
	ChatFrame_RemoveChannel(ChatFrame1, DEFENSE)	
	ChatFrame_AddMessageGroup(ChatFrame1, "SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD")
	ChatFrame_AddMessageGroup(ChatFrame1, "OFFICER")
	ChatFrame_AddMessageGroup(ChatFrame1, "GUILD_ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_SAY")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_YELL")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_EMOTE")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONSTER_BOSS_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY")
	ChatFrame_AddMessageGroup(ChatFrame1, "PARTY_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "RAID_WARNING")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT")
	ChatFrame_AddMessageGroup(ChatFrame1, "INSTANCE_CHAT_LEADER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_HORDE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_ALLIANCE")
	ChatFrame_AddMessageGroup(ChatFrame1, "BG_NEUTRAL")
	ChatFrame_AddMessageGroup(ChatFrame1, "SYSTEM")
	ChatFrame_AddMessageGroup(ChatFrame1, "ERRORS")
	ChatFrame_AddMessageGroup(ChatFrame1, "AFK")
	ChatFrame_AddMessageGroup(ChatFrame1, "DND")
	ChatFrame_AddMessageGroup(ChatFrame1, "IGNORED")
	ChatFrame_AddMessageGroup(ChatFrame1, "ACHIEVEMENT")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_WHISPER")
	ChatFrame_AddMessageGroup(ChatFrame1, "BN_CONVERSATION")
	ChatFrame_AddMessageGroup(ChatFrame1, "CHANNEL")
	
	ChatFrame_AddMessageGroup(ChatFrame1, "COMBAT_XP_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame1, "COMBAT_HONOR_GAIN")
	ChatFrame_AddMessageGroup(ChatFrame1, "COMBAT_FACTION_CHANGE")
	ChatFrame_AddMessageGroup(ChatFrame1, "LOOT")
	ChatFrame_AddMessageGroup(ChatFrame1, "MONEY")
	ChatFrame_AddMessageGroup(ChatFrame1, "CURRENCY")
	ChatFrame_AddMessageGroup(ChatFrame1, "SKILL-UPS")	
	
	ChatFrame_RemoveAllMessageGroups(ChatFrame3)
	ChatFrame_RemoveChannel(ChatFrame3, GENERAL)
	ChatFrame_AddChannel(ChatFrame3, TRADE)
	ChatFrame_RemoveChannel(ChatFrame3, DEFENSE)
	
	ChatFrame_RemoveAllMessageGroups(ChatFrame4)
	
	ToggleChatColorNamesByClassGroup(true, "SAY")
	ToggleChatColorNamesByClassGroup(true, "EMOTE")
	ToggleChatColorNamesByClassGroup(true, "YELL")
	ToggleChatColorNamesByClassGroup(true, "GUILD")
	ToggleChatColorNamesByClassGroup(true, "OFFICER")
	ToggleChatColorNamesByClassGroup(true, "GUILD_ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "ACHIEVEMENT")
	ToggleChatColorNamesByClassGroup(true, "WHISPER")
	ToggleChatColorNamesByClassGroup(true, "PARTY")
	ToggleChatColorNamesByClassGroup(true, "PARTY_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID")
	ToggleChatColorNamesByClassGroup(true, "RAID_LEADER")
	ToggleChatColorNamesByClassGroup(true, "RAID_WARNING")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND")
	ToggleChatColorNamesByClassGroup(true, "BATTLEGROUND_LEADER")	
	ToggleChatColorNamesByClassGroup(true, "CHANNEL1")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL2")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL3")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL4")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL5")
	ToggleChatColorNamesByClassGroup(true, "CHANNEL6")
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT")
	ToggleChatColorNamesByClassGroup(true, "INSTANCE_CHAT_LEADER")
	
	ChangeChatColor("CHANNEL1", 161/255, 160/255, 166/255)
	ChangeChatColor("CHANNEL2", 230/255, 166/255, 66/255)
	ChangeChatColor("CHANNEL5", 31/255, 191/255, 105/255)
	ReloadUI()
end
SLASH_CHAT1 ='/install'

SlashCmdList['BAGS'] = function ()
	SetInsertItemsLeftToRight(false)
	SetSortBagsRightToLeft(false)
	ReloadUI()
end
SLASH_BAGS1 = '/bags'

SlashCmdList['NAMES'] = function ()
	SetCVar("UnitNameGuildTitle", 0)
	SetCVar("UnitNamePlayerPVPTitle", 0)
	SetCVar("UnitNamePlayerGuild", 0)
	ReloadUI()
end
SLASH_NAMES1 ='/namesnarden'

SlashCmdList['SETTINGS'] = function ()
	SetInsertItemsLeftToRight(false)
	SetSortBagsRightToLeft(false)
	
	-- >> General CVar
	SetCVar("cameraDistanceMaxZoomFactor", 2.6)
	SetCVar("cameraSmoothStyle", 0)
	SetCVar("UnitNameGuildTitle", 0)
	SetCVar("UnitNamePlayerPVPTitle", 0)
	SetCVar("UnitNamePlayerGuild", 0)
	SetCVar("mapFade", 1)	
	SetCVar("autoDismountFlying", 1)
	SetCVar("autoClearAFK", 1)
	SetCVar("autoLootDefault", 1)
	SetCVar("autoSelfCast", 1)
	SetCVar("interactOnLeftClick", 1)
	SetCVar("lootUnderMouse", 1)
	SetCVar("chatBubbles", 1)
	SetCVar("chatBubblesParty", 0)
	SetCVar("UnitNameOwn", 1)
	SetCVar("UnitNameEnemyPlayerName", 1)
	SetCVar("UnitNameFriendlyPlayerName", 1)
	SetCVar("UnitNameFriendlySpecialNPCName", 1)
	SetCVar("UnitNameHostleNPC", 1)
	SetCVar("UnitNameInteractiveNPC", 1)
	
	-- >> Social CVar
	SetCVar("profanityFilter", 0)
	SetCVar("spamFilter", 1)
	SetCVar("guildMemberNotify", 1)
	SetCVar("blockTrades", 0)
	SetCVar("blockChannelInvites", 0)
	SetCVar("showToastBroadcast", 1)
	SetCVar("autoAcceptQuickJoinRequests", 0)
	SetCVar("enableTwitter", 1)
				
	-- >> Chat CVar
	SetCVar("removeChatDelay", 1)
	SetCVar("chatMouseScroll", 1)	
	--SetCVar("chatStyle", 'im')
	--SetCVar("showTimestamps", "none")
	--SetCVar("whisperMode", "popout_and_inline")
	SetCVar("whisperMode", "inline")
	
	-- >> Combat CVar
	SetCVar("findYourselfMode", -1)
	SetCVar("findYourselfInRaidOnlyInCombat", 0)
	SetCVar("findYourselfInRaid", 0)
	SetCVar("findYourselfInBG", 0)
	SetCVar("findYourselfAnywhere", 0)
	SetCVar("findYourselfAnywhereOnlyInCombat", 0)
	
	SetCVar("doNotFlashLowHealthWarning", 0)
	SetCVar("deselectOnClick", 0)
	SetCVar("ActionButtonUseKeyDown", 1)
	SetCVar("SpellQueueWindow", 250)
	SetCVar("secureAbilityToggle", 1)
	SetCVar("lossOfControl", 1)
	SetCVar("stopAutoAttackOnTargetChange", 0)
	SetCVar("assistAttack", 0)

	-- >> Combat Text Self CVar
	SetCVar("enableFloatingCombatText", 0)
	SetCVar("enablePetBattleFloatingCombatText", 1)
	SetCVar("WorldTextScale", 0.8)
	SetCVar("floatingCombatTextAllSpellMechanics", 0)
	SetCVar("floatingCombatTextAuras", 0)
	SetCVar("floatingCombatTextCombatHealingAbsorbSelf", 1)
	SetCVar("floatingCombatTextCombatState", 1)
	SetCVar("floatingCombatTextComboPoints", 0)
	SetCVar("floatingCombatTextDamageReduction", 1)
	SetCVar("floatingCombatTextDodgeParryMiss", 1)
	SetCVar("floatingCombatTextEnergyGains", 0)
	SetCVar("floatingCombatTextFloatMode", 1)
	SetCVar("floatingCombatTextFriendlyHealers", 0)
	SetCVar("floatingCombatTextHonorGains", 0)
	SetCVar("floatingCombatTextLowManaHealth", 0)
	SetCVar("floatingCombatTextPeriodicEnergyGains", 0)
	SetCVar("floatingCombatTextReactives", 0)
	SetCVar("floatingCombatTextRepChanges", 0)
	
	-- >> Combat Text Other CVar
	SetCVar("floatingCombatTextCombatDamage", 0) --1
	SetCVar("floatingCombatTextCombatDamageAllAutos", 0)
	SetCVar("floatingCombatTextCombatLogPeriodicSpells", 0) --1
	SetCVar("floatingCombatTextPetMeleeDamage", 0)
	SetCVar("floatingCombatTextPetSpellDamage", 0)
	SetCVar("floatingCombatTextCombatHealing", 0) --1
	SetCVar("floatingCombatTextCombatHealingAbsorbTarget", 0)
	SetCVar("floatingCombatTextSpellMechanics", 0)
	SetCVar("floatingCombatTextSpellMechanicsOther", 0)
	SetCVar("floatingCombatTextCombatDamageDirectionalOffset", 0) --1
	SetCVar("floatingCombatTextCombatDamageDirectionalScale", 0) --1
	
	-- >> Nameplate CVar	
	SetCVar("nameplateShowSelf", 0)
	SetCVar("nameplateMotion", 0)
	SetCVar("nameplateOtherTopInset", 0.08) 
	SetCVar("nameplateOtherBottomInset", 0.1)
	--SetCVar("nameplateOverlapV", 1.1)
	SetCVar("nameplateOverlapV", 1.1)
	SetCVar("nameplateOverlapH", 0.8)
	SetCVar("nameplateShowAll", 1)	
	SetCVar("nameplateShowEnemies", 1)
	SetCVar("nameplateShowEnemyMinus", 1)
	SetCVar("nameplateOccludedAlphaMult", .3)
	SetCVar("nameplateMaxDistance", 45)
	ReloadUI()
end
SLASH_SETTINGS1 ='/settingsnarden'

