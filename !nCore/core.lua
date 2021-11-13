local createBD = function(parent, anchor, r, g, b, a)
		local frame = CreateFrame('Frame', nil, parent, 'BackdropTemplate')
		frame:SetFrameStrata('BACKGROUND')
		frame:SetPoint('TOPLEFT', anchor, 'TOPLEFT', -1, 1)
		frame:SetPoint('BOTTOMRIGHT', anchor, 'BOTTOMRIGHT', 1, -1)
		frame:SetBackdrop({
			edgeFile = 'Interface\\Buttons\\WHITE8x8', edgeSize = 1,
			bgFile = 'Interface\\ChatFrame\\ChatFrameBackground',})
		frame:SetBackdropColor(r, g, b, a)
		frame:SetBackdropBorderColor(0, 0, 0)
			
	return frame
end

-- UIScale Pixelperfect
local scaler = CreateFrame('Frame', nil, UIParent)
scaler:RegisterEvent('PLAYER_ENTERING_WORLD')
scaler:SetScript('OnEvent', function(self, event)
	SetCVar('useuiscale', 1)
    SetCVar('uiscale', 0.71)
    --local height = 1080
    --UIParent:SetScale(768 / height)
end)

-- ScreenshotQuality 
local f = CreateFrame('Frame')
f:RegisterEvent('PLAYER_LOGIN')
f:SetScript('OnEvent', function(_, event, ...)
    if (event == 'PLAYER_LOGIN') then
        SetCVar('ScreenshotQuality', 10)
		--SetCVar('useUiScale', 0)		
		end
end)

SlashCmdList['FRAMENAME'] = function()
    local name = GetMouseFocus():GetName()

    if (name) then
        DEFAULT_CHAT_FRAME:AddMessage('|cff00FF00   '..name)
    else
        DEFAULT_CHAT_FRAME:AddMessage('|cff00FF00This frame has no name!')
    end
end

SLASH_FRAMENAME1 = '/frame'

SlashCmdList['RELOADUI'] = function()
    ReloadUI()
end
SLASH_RELOADUI1 = '/rl'

-- credits to ALZA for most of these :>
local raid = {
	"AngryAssignments", 
    "BigWigs",
	"Details",
	"MeekoLootHelper", 
	"RCLootCouncil",
	"MRT",
}

local group = {
	"AngryKeystones",
	"BigWigs",
	"Details",
	"MethodDungeonTools", 
	"MythicDungeonTools",
}

local pvp = {	
	"Details",
	"Omnibar",
	"Diminish",
}

local solo = {
	"WorldQuestsList", 
	"GarrisonMissionManager",
	"OrderHallCommander", 
	"ExtraQuestButton",
	"Details",
	"QuickQuest",
	"CovenantMissionHelper",
	"TomCats",
	"BetterWorldQuests",
	"Rematch",
}

local trader = {
	"Auctionator", 
	"TradeSkillMaster", 
	"TheUndermineJournal", 
}

SlashCmdList["CHANGEADDONS"] = function(s)
    if(s and s=="raid") then
		for i in pairs(group) do 
			DisableAddOn(group[i])
		end
		for i in pairs(solo) do 
			DisableAddOn(solo[i])
		end
		for i in pairs(pvp) do
			DisableAddOn(pvp[i])
		end
		for i in pairs(trader) do
			DisableAddOn(trader[i])
		end
        for i in pairs(raid) do
            EnableAddOn(raid[i])
        end
        ReloadUI()
	elseif(s and s=="group") then
		for i in pairs(raid) do 
			DisableAddOn(raid[i])
		end
		for i in pairs(solo) do 
			DisableAddOn(solo[i])
		end
		for i in pairs(pvp) do
			DisableAddOn(pvp[i])
		end
		for i in pairs(trader) do
			DisableAddOn(trader[i])
		end
		for i in pairs(group) do 
			EnableAddOn(group[i])
		end
		ReloadUI()
    elseif(s and s=="solo") then
        for i in pairs(raid) do
            DisableAddOn(raid[i])
        end
		for i in pairs(group) do 
			DisableAddOn(group[i])
		end
		for i in pairs(pvp) do
			DisableAddOn(pvp[i])
		end
		for i in pairs(trader) do
			DisableAddOn(trader[i])
		end
		for i in pairs(solo) do 
			EnableAddOn(solo[i])
		end		
        ReloadUI()
	elseif(s and s=="pvp") then
        for i in pairs(raid) do
            DisableAddOn(raid[i])
        end
		for i in pairs(group) do 
			DisableAddOn(group[i])
		end
		for i in pairs(solo) do
			DisableAddOn(solo[i])
		end
		for i in pairs(trader) do
			DisableAddOn(trader[i])
		end
		for i in pairs(pvp) do 
			EnableAddOn(pvp[i])
		end		
        ReloadUI()
	elseif(s and s=="trader") then
        for i in pairs(raid) do
            DisableAddOn(raid[i])
        end
		for i in pairs(group) do 
			DisableAddOn(group[i])
		end
		for i in pairs(solo) do
			DisableAddOn(solo[i])
		end
		for i in pairs(pvp) do 
			DisableAddOn(pvp[i])
		end		
		for i in pairs(trader) do
			EnableAddOn(trader[i])
		end
        ReloadUI()	
    else
        print("|cffff99cc!Settings:|r Loading addon sets: /addons |cff00ffffset|r. Sets: raid, solo, pvp. Example: /addons |cff00ffffraid|r.")
        print("|cffff99cc!Settings:|r You can add or remove addons to sets by editing slash.lua file in !Settings addon folder.")
    end
end
SLASH_CHANGEADDONS1 = "/addons"

--[[from AutoJunkSeller by Madhavok of Bladefist]]
local f = CreateFrame("Frame")
f:RegisterEvent("MERCHANT_SHOW")
f:SetScript("OnEvent", function()
      local c = 0
      local sold = 0
      for bag=0,4 do
         for slot=1,GetContainerNumSlots(bag) do
            local l = GetContainerItemLink(bag, slot)
            if l then 
               local item,link,quality,a,b,cat,q,stack,c,icon,cost = GetItemInfo(l)
               if link then
                  --local p = select(11, GetItemInfo(l)*x)
                  if quality then
                     if quality == 0 then 
                        local ic,count,w,x,y,z,link2,stuff=GetContainerItemInfo(bag, slot)
                        local cu = GetMoney(); 
                        local coins = GetCoinTextureString(cost*count,"12")
                        UseContainerItem(bag, slot)
                        PickupMerchantItem()
                        sold = sold+cost*count
                     end
					
                  end
               end 
            end
         end
      end
      print("Total junk sold: "..GetCoinTextureString(sold,"12"))
      if c>0 then
         F.Print(L.merchantTrashSell.." "..F.FormatMoney(c)..".")
     end
end)

function SellGreys()
end

--[[ iRepair -- VARIABLES CAN BE CHANGED AS YOU WANT ]]--
local 	iRepair_Chatter 	= true
local 	iRepair_GRF		= true
local 	iRepair_ROGR		= false

--[[ AUTO REPAIR SERVICES ]]--
local iRepair = CreateFrame("Frame", "iRepair")
	iRepair:RegisterEvent("MERCHANT_SHOW")
	iRepair:SetScript("OnEvent", function()
	local cost = GetRepairAllCost()
	local function iRepair_Guild()
		if iRepair_Chatter then
			print(" Guild Bank Auto Repair for: ".. GetCoinTextureString(cost) )
		end
		RepairAllItems(1)
	end
	local function iRepair_Self()
		if iRepair_Chatter then
			print(" Auto Repair Service You payed: ".. GetCoinTextureString(cost) )
		end
		RepairAllItems()
	end
	if IsModifierKeyDown() then
		return
	elseif CanMerchantRepair() and cost ~= 0 then
		if iRepair_GRF and CanGuildBankRepair() and cost <= GetGuildBankMoney() and (cost <= GetGuildBankWithdrawMoney() or GetGuildBankWithdrawMoney() == -1) then
			if iRepair_ROGR and GetNumRaidMembers() ~= 0 then
				iRepair_Guild()
			elseif not iRepair_ROGR then
				iRepair_Guild()
			elseif cost <= GetMoney() then
				iRepair_Self()
			else
				print(" Not enough Guild Funds to Auto Repair, Please Try Manually.")
			end
		elseif cost <= GetMoney() then
			iRepair_Self()
		else
			print(" Darn you don't have enough cash to Auto Repair. You need "..GetCoinTextureString(cost).." total to repair." )
		end
	end
end)
