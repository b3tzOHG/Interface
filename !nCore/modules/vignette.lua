
-- -- Forked from rVignette by zork - 2014

-- local addon = CreateFrame("Frame")
-- addon.vignettes = {}

-- local function OnEvent(self, event, atlas)
    -- if atlas and not self.vignettes[atlas] then
        -- local vignetteInfo = C_VignetteInfo.GetVignetteInfo(atlas)
        -- if not vignetteInfo then
            -- return
        -- end

        -- local _, _, _, x1, x2, y1, y2 = C_Texture.GetAtlasInfo(vignetteInfo.atlasName)

        -- local str = '|TInterface\\MINIMAP\\ObjectIconsAtlas:0:0:0:0:256:256:'..(x1*256)..':'..(x2*256)..':'..(y1*256)..':'..(y2*256)..'|t'
        -- RaidNotice_AddMessage(RaidWarningFrame, str..vignetteInfo.name..' spotted!', ChatTypeInfo['RAID_WARNING'])
        -- print(str..vignetteInfo.name, 'spotted!')
        -- self.vignettes[atlas] = true
    -- end
-- end

-- -- Listen for vignette event.
-- addon:RegisterEvent('VIGNETTE_MINIMAP_UPDATED')
-- addon:SetScript('OnEvent', OnEvent)

    local addon = CreateFrame("Frame")

    local function OnEvent(self, event, id)

        if event == "VIGNETTE_MINIMAP_UPDATED" then
            if not id then return end

            self.vignettes = self.vignettes or {}
            if self.vignettes[id] then return end

            local vignetteInfo = C_VignetteInfo.GetVignetteInfo(id)
            if not vignetteInfo then return end

            local atlasInfo = C_Texture.GetAtlasInfo(vignetteInfo.atlasName)
            local left = atlasInfo.leftTexCoord * 256
            local right = atlasInfo.rightTexCoord * 256
            local top = atlasInfo.topTexCoord * 256
            local bottom = atlasInfo.bottomTexCoord * 256

            local str = "|TInterface\\MINIMAP\\ObjectIconsAtlas:0:0:0:0:256:256:"..(left)..":"..(right)..":"..(top)..":"..(bottom).."|t"

            if vignetteInfo.name ~= "Garrison Cache" and vignetteInfo.name ~= "Full Garrison Cache" and vignetteInfo.name ~= nil then
                RaidNotice_AddMessage(RaidWarningFrame, str.." "..vignetteInfo.name.." spotted!", ChatTypeInfo["RAID_WARNING"])
                print(str.." "..vignetteInfo.name,"spotted!")
                self.vignettes[id] = true
            end
        end
    end

    -- Listen for vignette event.
    addon:RegisterEvent("VIGNETTE_MINIMAP_UPDATED")
    addon:SetScript("OnEvent", OnEvent)

