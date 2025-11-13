local spawnedPlants = {}
local isPicking = false

CreateThread(function()
    for jobName, jobData in pairs(Config.Jobs) do
        if jobData.collectProp then
            for _, coords in ipairs(jobData.collectCoords) do
                spawnProp(jobData.collectProp, coords)
            end
        end
    end
end)

function spawnProp(modelName, coords)
    local model = GetHashKey(modelName)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end

    local obj = CreateObject(model, coords[1], coords[2], coords[3] - 1.0, false, false, false)
    PlaceObjectOnGroundProperly(obj)
    FreezeEntityPosition(obj, true)
    table.insert(spawnedPlants, {object = obj, coords = coords, active = true})
end

-- Interação com a colheita
CreateThread(function()
    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        local pCoords = GetEntityCoords(ped)

        for index, plant in ipairs(spawnedPlants) do
            if plant.active then
                local dist = #(pCoords - vector3(plant.coords[1], plant.coords[2], plant.coords[3]))
                if dist < 1.5 then
                    sleep = 0
                    DrawText3D(plant.coords[1], plant.coords[2], plant.coords[3] + 0.3, "~g~[E]~w~ Colher Melancia")
                    if IsControlJustPressed(0, 38) and not isPicking then
                        pickPlant(index)
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

function pickPlant(index)
    isPicking = true
    local ped = PlayerPedId()

    local animDict = "amb@world_human_gardener_plant@male@base"
    local animName = "base"

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(0) end
    TaskPlayAnim(ped, animDict, animName, 3.0, 3.0, -1, 1, 0, false, false, false)

    Wait(Config.Jobs["PlantacaoMelancia"].collectDuration)
    ClearPedTasks(ped)

    DeleteObject(spawnedPlants[index].object)
    spawnedPlants[index].active = false

    TriggerServerEvent("watermelon:giveItem")

    SetTimeout(Config.Jobs["PlantacaoMelancia"].respawnTime * 1000, function()
        spawnProp(Config.Jobs["PlantacaoMelancia"].collectProp, spawnedPlants[index].coords)
        spawnedPlants[index].active = true
    end)

    isPicking = false
end

function DrawText3D(x, y, z, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x, y, z, 0)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end
