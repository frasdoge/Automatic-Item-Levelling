local function RarityUpOrDownScale(item)

    local rarity = NRD_ItemGetString(item, "ItemTypeReal")
    local rarityEnabled = next(Osi.DB_AIL_RarityActive:Get(rarity)) ~= nil
    
    
    if (rarityEnabled) then
        -- Ext.Print("Rarity Active")
        return true
    end

    -- Ext.Print("Rarity Inactive")

    local rarityDownscaling = GlobalGetFlag("AIL_RarityDownscale") == 1
    local itemLevelList = Osi.DB_AIL_ItemList:Get(item, nil)[1]

    if ((next(itemLevelList) ~= nil) and (rarityDownscaling)) then
        local oLevel = itemLevelList[2]
        ItemLevelUpTo(item, oLevel)
    end

    return false

end
Ext.NewQuery(RarityUpOrDownScale, "AIL_RarityUpOrDownScale", "[in](ITEMGUID)_Item")