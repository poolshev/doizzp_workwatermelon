RegisterNetEvent("watermelon:giveItem")
AddEventHandler("watermelon:giveItem", function()
    local src = source
    local user_id = vRP.getUserId(src)
    if user_id then
        vRP.giveInventoryItem(user_id, "watermelon", 1, true)
    end

    -- Se for QBCore, substitui pelo:
    -- local Player = QBCore.Functions.GetPlayer(src)
    -- Player.Functions.AddItem("watermelon", 1)
end)
