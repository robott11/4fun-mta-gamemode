local spawnX, spawnY, spawnZ = 1959.55, -1714.46, 20

function joinHandler()
	spawnPlayer(source, spawnX, spawnY, spawnZ)
	fadeCamera(source, true)
	setCameraTarget(source, source)
	outputChatBox("Bem-vindo ao server 4FUN", source)
end

function createVehicleForPlayer(player, vehicleId)
    --GETS PLAYER POSITION
    local PlayerX, PlayerY, PlayerZ = getElementPosition(player)
    local PlayerRx, PlayerRy, PlayerRz = getElementRotation(player)

    --CREATES THE VEHICLE
    local vehicle = createVehicle(vehicleId, PlayerX, PlayerY, PlayerZ+1, PlayerRx, PlayerRy, PlayerRz)
    warpPedIntoVehicle(player, vehicle)

    return true
end

function createVehicleCommand(player, command, vehicleId)
    local vehicleId = tonumber(vehicleId)

    --VERIFY THE VEHICLE ID
    if (vehicleId == nil or (vehicleId > 611) or (vehicleId < 400)) then
        outputChatBox("Veiculo inválido", player)
        return false
    end

    createVehicleForPlayer(player, vehicleId)
    return true
end

addEventHandler("onPlayerJoin", getRootElement(), joinHandler)
addCommandHandler("v", createVehicleCommand)