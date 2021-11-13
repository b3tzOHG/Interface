-- ChatTimestamps by Skizo
--

local CTS_MainFrame;

function ChatTimestamps_ChatFrame_AddMessage(self, msg, a1,a2,a3,a4,a5,a6,a7,a8,a9)
  return self:ChatTimestamps_Orig_AddMessage(ChatTimestamps_AddTimeStamp(msg),a1,a2,a3,a4,a5,a6,a7,a8,a9);
end

function ChatTimestamps_OnEvent()
             if not (ChatTimestampsSettings) then
               -- Default Settings
               ChatTimestampsSettings               = { };
               ChatTimestampsSettings.Format        = "[%H:%M]";
			   --ChatTimestampsSettings.Format = "|cFFFF0000[%H:%M:%s]|r"
             end

             ChatTimestamps_HookAllChatFrames();
end

function ChatTimestamps_OnLoad()
        CTS_MainFrame = CreateFrame("Frame", "ChatTimestampsFrame");
        CTS_MainFrame:SetScript("OnEvent", ChatTimestamps_OnEvent);
        CTS_MainFrame:RegisterEvent("VARIABLES_LOADED");
end 

function ChatTimestamps_HookAllChatFrames()
  for i=1,NUM_CHAT_WINDOWS do
    local cf = getglobal("ChatFrame"..i);
    cf.ChatTimestamps_Orig_AddMessage = cf.AddMessage;
    cf.AddMessage = ChatTimestamps_ChatFrame_AddMessage;
  end
end

function ChatTimestamps_AddTimeStamp(msg)
	if not (msg == nil) then
          local locFormat = ChatTimestampsSettings.Format;
          if (strfind(locFormat,"#H") ~= 1) then
            local ParsedTime = date("%H");
            if (strsub(ParsedTime,1,1) == "0") then ParsedTime = strsub(ParsedTime,2); end;
            locFormat = gsub(locFormat, "#H", ParsedTime);
          end
          if (strfind(locFormat,"#I") ~= 1) then
            local ParsedTime = date("%I");
            if (strsub(ParsedTime,1,1) == "0") then ParsedTime = strsub(ParsedTime,2); end;
            locFormat = gsub(locFormat, "#I", ParsedTime);
          end
		  
		msg =  '|c00d3d3d3'..date(locFormat)..'|r'.." "..msg;  -- TimeStamp Format
	end
	return msg;
end

ChatTimestamps_OnLoad();