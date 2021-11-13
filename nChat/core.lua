-----------------------------
-- Variables
-----------------------------
DEFAULT_CHATFRAME_ALPHA = 0
local A, L = ...

local DefaultSetItemRef = SetItemRef

local cfg = {}

cfg.dropshadow = {}
cfg.dropshadow.offset = {1,-1}
cfg.dropshadow.color = {0,0,0,0.8}
cfg.editbox = {}
cfg.editbox.font = {STANDARD_TEXT_FONT, 16, 'THINOUTLINE'}
cfg.chat = {}
cfg.chat.font = {STANDARD_TEXT_FONT, 16, 'THINOUTLINE'}

-----------------------------
-- Functions
-----------------------------

--SkinChat
local function SkinChat(self)
  if not self then return end
  local name = self:GetName()
  --chat frame resizing
  self:SetClampRectInsets(0, 0, 0, 0)
  self:SetMaxResize(UIParent:GetWidth()/2, UIParent:GetHeight()/2)
  self:SetMinResize(100, 50)
  self:SetFont(unpack(cfg.chat.font))
  self:SetShadowOffset(unpack(cfg.dropshadow.offset))
  self:SetShadowColor(unpack(cfg.dropshadow.color))
  --chat fading
  self:SetFading(true)
  self:SetTimeVisible(20)
  self:SetSpacing(3)
  --hide button frame
  local bf = _G[name.."ButtonFrame"]
  bf:HookScript("OnShow", bf.Hide)
  bf:Hide()
  
  --editbox
  local eb = _G[name.."EditBox"]
  eb:SetAltArrowKeyMode(false)
  --textures
  _G[name.."EditBoxLeft"]:Hide()
  _G[name.."EditBoxMid"]:Hide()
  _G[name.."EditBoxRight"]:Hide()
  --reposition
  eb:ClearAllPoints()
  if name == "ChatFrame2" then
    eb:SetPoint("BOTTOM",self,"TOP",0,22+24) --CombatLogQuickButtonFrame_Custom:GetHeight()24
  else
    eb:SetPoint("BOTTOM",self,"TOP",0,22)
  end
  eb:SetPoint("LEFT",self,-5,0)
  eb:SetPoint("RIGHT",self,10,0)
  
  local tab = _G[name.."Tab"]
    local tabFs = tab:GetFontString()
    tabFs:SetFont(STANDARD_TEXT_FONT, 16, "THINOUTLINE")
    tabFs:SetShadowOffset(1,-1)
    tabFs:SetShadowColor(0,0,0,0.6)
    tabFs:SetTextColor(1, 1, 1)
    
      _G[name.."TabLeft"]:SetTexture(nil)
      _G[name.."TabMiddle"]:SetTexture(nil)
      _G[name.."TabRight"]:SetTexture(nil)
      _G[name.."TabSelectedLeft"]:SetTexture(nil)
      _G[name.."TabSelectedMiddle"]:SetTexture(nil)
      _G[name.."TabSelectedRight"]:SetTexture(nil)
      _G[name.."TabGlow"]:SetTexture(nil) --do not hide this texture, it will glow when a whisper hits a hidden chat
      _G[name.."TabHighlightLeft"]:SetTexture(nil)
      _G[name.."TabHighlightMiddle"]:SetTexture(nil)
      _G[name.."TabHighlightRight"]:SetTexture(nil)

    tab:SetAlpha(1)

  
end

--OpenTemporaryWindow
local function OpenTemporaryWindow()
  for _, name in next, CHAT_FRAMES do
    local frame = _G[name]
    if (frame.isTemporary) then
      SkinChat(frame)
    end
  end
end

--OnMOuseScroll
local function OnMOuseScroll(self,dir)
  if(dir > 0) then
    if(IsShiftKeyDown()) then self:ScrollToTop() else self:ScrollUp() end
  else
    if(IsShiftKeyDown()) then self:ScrollToBottom() else self:ScrollDown() end
  end
end

--we replace the default setitemref and use it to parse links for alt invite and url copy
function SetItemRef(link, ...)
  local type, value = link:match("(%a+):(.+)")
  if IsAltKeyDown() and type == "player" then
    InviteUnit(value:match("([^:]+)"))
  elseif (type == "url") then
    local eb = LAST_ACTIVE_CHAT_EDIT_BOX or ChatFrame1EditBox
    if not eb then return end
    eb:SetText(value)
    eb:SetFocus()
    eb:HighlightText()
    if not eb:IsShown() then eb:Show() end
  else
    return DefaultSetItemRef(link, ...)
  end
end

--AddMessage
local function AddMessage(self, text, ...)
  --channel replace (Trade and such)
  text = text:gsub('|h%[(%d+)%. .-%]|h', '|h%1.|h')
  --url search
  text = text:gsub('([wWhH][wWtT][wWtT][%.pP]%S+[^%p%s])', '|cffffffff|Hurl:%1|h[%1]|h|r')
  return self.DefaultAddMessage(self, text, ...)
end

-----------------------------
-- Stuff
-----------------------------

--editbox font
ChatFontNormal:SetFont(unpack(cfg.editbox.font))
ChatFontNormal:SetShadowOffset(unpack(cfg.dropshadow.offset))
ChatFontNormal:SetShadowColor(unpack(cfg.dropshadow.color))

--font size
CHAT_FONT_HEIGHTS = {10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20}

--tabs
CHAT_TAB_HIDE_DELAY = 1
CHAT_FRAME_TAB_NORMAL_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_NORMAL_NOMOUSE_ALPHA = 0
CHAT_FRAME_TAB_SELECTED_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_SELECTED_NOMOUSE_ALPHA = 0
CHAT_FRAME_TAB_ALERTING_MOUSEOVER_ALPHA = 1
CHAT_FRAME_TAB_ALERTING_NOMOUSE_ALPHA = 1
CHAT_FRAME_FADE_OUT_TIME = 0.25
CHAT_FRAME_FADE_TIME = 0.1

--channels
CHAT_WHISPER_GET              = "<< %s "
CHAT_WHISPER_INFORM_GET       = ">> %s "
CHAT_BN_WHISPER_GET           = "<< %s "
CHAT_BN_WHISPER_INFORM_GET    = ">> %s "
CHAT_YELL_GET                 = "%s "
CHAT_SAY_GET                  = "%s "
CHAT_BATTLEGROUND_GET         = "|Hchannel:Battleground|hBG.|h %s: "
CHAT_BATTLEGROUND_LEADER_GET  = "|Hchannel:Battleground|hBGL.|h %s: "
CHAT_GUILD_GET                = "|Hchannel:Guild|hG.|h %s: "
CHAT_OFFICER_GET              = "|Hchannel:Officer|hGO.|h %s: "
CHAT_PARTY_GET                = "|Hchannel:Party|hP.|h %s: "
CHAT_PARTY_LEADER_GET         = "|Hchannel:Party|hPL.|h %s: "
CHAT_PARTY_GUIDE_GET          = "|Hchannel:Party|hPG.|h %s: "
CHAT_RAID_GET                 = "|Hchannel:Raid|hR.|h %s: "
CHAT_RAID_LEADER_GET          = "|Hchannel:Raid|hRL.|h %s: "
CHAT_RAID_WARNING_GET         = "|Hchannel:RaidWarning|hRW.|h %s: "
CHAT_INSTANCE_CHAT_GET        = "|Hchannel:Battleground|hI.|h %s: "
CHAT_INSTANCE_CHAT_LEADER_GET = "|Hchannel:Battleground|hIL.|h %s: "
--CHAT_MONSTER_PARTY_GET       = CHAT_PARTY_GET
--CHAT_MONSTER_SAY_GET         = CHAT_SAY_GET
--CHAT_MONSTER_WHISPER_GET     = CHAT_WHISPER_GET
--CHAT_MONSTER_YELL_GET        = CHAT_YELL_GET
CHAT_FLAG_AFK = "<AFK> "
CHAT_FLAG_DND = "<DND> "
CHAT_FLAG_GM = "<[GM]> "

--remove the annoying guild loot messages by replacing them with the original ones
YOU_LOOT_MONEY_GUILD = YOU_LOOT_MONEY
LOOT_MONEY_SPLIT_GUILD = LOOT_MONEY_SPLIT

--don't cut the toastframe
BNToastFrame:SetClampedToScreen(true)
BNToastFrame:SetClampRectInsets(-15,15,15,-15)

--hide the menu button
ChatFrameMenuButton:HookScript("OnShow", ChatFrameMenuButton.Hide)
ChatFrameMenuButton:Hide()
ChatFrameChannelButton:HookScript('OnShow', ChatFrameMenuButton.Hide);
ChatFrameChannelButton:Hide();

ChatFrameToggleVoiceDeafenButton:HookScript("OnShow", ChatFrameToggleVoiceDeafenButton.Hide)
ChatFrameToggleVoiceDeafenButton:Hide()
ChatFrameToggleVoiceMuteButton:HookScript("OnShow", ChatFrameToggleVoiceMuteButton.Hide)
ChatFrameToggleVoiceMuteButton:Hide()

--hide the friend micro button
local button = QuickJoinToastButton or FriendsMicroButton
button:HookScript("OnShow", button.Hide)
button:Hide()

--skin chat
for i = 1, NUM_CHAT_WINDOWS do
  local chatframe = _G["ChatFrame"..i]
  SkinChat(chatframe)
  --adjust channel display
  if (i ~= 2) then
    chatframe.DefaultAddMessage = chatframe.AddMessage
    chatframe.AddMessage = AddMessage
  end
end

--scroll
FloatingChatFrame_OnMouseScroll = OnMOuseScroll

--temporary chat windows
hooksecurefunc("FCF_OpenTemporaryWindow", OpenTemporaryWindow)


 local f = CreateFrame("Frame")

f:RegisterEvent("CHAT_MSG_WHISPER")
f:RegisterEvent("CHAT_MSG_BN_WHISPER")
f:SetScript("OnEvent", function(self, event)
	PlaySoundFile("Interface\\AddOns\\nChat\\heart.mp3", "Master")
end)