local f = CreateFrame("Frame")
local lastStance = nil

-- Your weapon sets for each stance
local weaponSets = {
    [1] = { main = "Black Metal Axe", off = "Grunt Axe of Agility" },      -- Battle
    [2] = { main = "Black Metal Axe", off = "Burnished Shield" },          -- Defensive
    [3] = { main = "Black Metal Axe", off = "Grunt Axe of Agility" },      -- Berserker
}

local function tryEquipItem(name, slot)
    local equippedLink = GetInventoryItemLink("player", slot)
    if equippedLink and equippedLink:find(name, 1, true) then
        -- Already equipped
        return
    end

    -- Search bags
    for bag = 0, 4 do
        for slotIndex = 1, C_Container.GetContainerNumSlots(bag) do
            local itemInfo = C_Container.GetContainerItemInfo(bag, slotIndex)
            if itemInfo and itemInfo.hyperlink and itemInfo.hyperlink:find(name, 1, true) then
                ClearCursor()
                C_Container.PickupContainerItem(bag, slotIndex)
                EquipCursorItem(slot)
                return
            end
        end
    end
end

local function applyWeaponsForStance(stance)
    local set = weaponSets[stance]
    if set then
        print("Applying weapon set for stance:", stance)
        tryEquipItem(set.main, 16) -- Main hand
        tryEquipItem(set.off, 17)  -- Off hand
    else
        print("No weapon set defined for stance:", stance)
    end
end

f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("UPDATE_SHAPESHIFT_FORM")
f:SetScript("OnEvent", function()
    local stance = GetShapeshiftForm()
    if stance ~= lastStance and stance > 0 then
        lastStance = stance
        applyWeaponsForStance(stance)
    end
end)
