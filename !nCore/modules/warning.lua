RaidWarningFrame:ClearAllPoints()
--RaidWarningFrame:SetPoint("TOP", UIParent, "TOP", 0, -50)
RaidWarningFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 150)
--RaidWarningFrame:SetPoint("CENTER", UIParent, "CENTER", 0, 260)
RaidWarningFrame:SetScale(1)

RaidWarningFrameSlot2:ClearAllPoints()
RaidWarningFrameSlot2:SetPoint("TOP", RaidWarningFrameSlot1, "BOTTOM", 0, -3)

RaidBossEmoteFrameSlot2:ClearAllPoints()
RaidBossEmoteFrameSlot2:SetPoint("TOP", RaidBossEmoteFrameSlot1, "BOTTOM", 0, -3)