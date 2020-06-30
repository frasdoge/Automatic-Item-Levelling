local function RarityUpOrDownScale(item, durability)

    local rarity = NRD_ItemGetString(item, "ItemTypeReal")
    local rarityEnabled = Osi.DB_AIL_RarityActive:Get(rarity)[1] ~= nil
    
    if (rarityEnabled) then
        return true
    end

    local rarityDownscaling = GlobalGetFlag("AIL_RarityDownscale") == 1
    local itemLevelList = Osi.DB_AIL_ItemList:Get(item, nil)[1]
    local oLevel = itemLevelList[2]

    if ((oLevel ~= nil) and (rarityDownscaling)) then
        ItemLevelUpTo(item, oLevel)
        ItemSetDurability(item, durability)
    end

    return false

end
Ext.NewQuery(RarityUpOrDownScale, "AIL_RarityUpOrDownScale", "[in](ITEMGUID)_Item, [in](INTEGER)_Durability")