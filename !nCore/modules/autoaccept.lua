local realm = "-"..tostring(GetRealmName());

InviteAccept = {};

local frame = CreateFrame("Frame", "InviteAcceptFrame", UIParent);
frame:SetScript("OnEvent", function(...) InviteAccept:OnEvent(...) end);
frame:RegisterEvent("PARTY_INVITE_REQUEST");

function InviteAccept:OnEvent(self, event, sender)
	if (event == "PARTY_INVITE_REQUEST") then
		InviteAccept:OnInvite(sender..realm);
	end
end

function InviteAccept:OnInvite(sender)
    --GuildRoster();
    local n, d;
    for i = 1, (select(3, GetNumGuildMembers()) or 1) do
        n = select(1, GetGuildRosterInfo(i)) or "";
        if (sender == n) then
            AcceptGroup();
            for j = 1, STATICPOPUP_NUMDIALOGS or 1 do
                d = _G["StaticPopup"..j];
                if (d.which == "PARTY_INVITE") then
                    d.inviteAccepted = 1;
                    break;
                end
            end
            StaticPopup_Hide("PARTY_INVITE")
            break;
        end
    end
end
