-- CREATE VEHICLE FOR PLAYER FUNCTION
function createVehicleForPlayer(player, vehicleId)
    -- GETS PLAYER POSITION
    local PlayerX, PlayerY, PlayerZ = getElementPosition(player)
    local PlayerRx, PlayerRy, PlayerRz = getElementRotation(player)

    -- CREATES THE VEHICLE
    local vehicle = createVehicle(vehicleId, PlayerX, PlayerY, PlayerZ+1, PlayerRx, PlayerRy, PlayerRz)
    warpPedIntoVehicle(player, vehicle)

    return true
end

-- CREATE VEHICLE COMMAND
addCommandHandler("v",
    function(player, command, vehicle, vehicle2, vehicle3)
        -- CONCATENATE THE ARGUMENTS
        local vehicleModel = table.concat({vehicle, vehicle2, vehicle3}, " ")
        vehicleModel = getVehicleModelFromName(vehicleModel)
        
        -- VERIFY IF THE VEHICLE NAME EXISTS
        if (vehicleModel) then
            createVehicleForPlayer(player, vehicleModel)
            return true
        end

        vehicleModel = tonumber(vehicle)

        -- VERIFY IF THE VEHICLE ID IS VALID
        if (vehicleModel == nil or (vehicleModel > 611) or (vehicleModel < 400)) then
            outputChatBox("| INFO | Veiculo inválido", player, 255, 0, 0)
            return false
        end

        -- CREATE THE VEHICLE
        createVehicleForPlayer(player, vehicleModel)
        return true
    end
)

-- KILL PLAYER COMMAND
addCommandHandler("kill",
    function(player, command)
        killPed(player)
        return true
    end
)