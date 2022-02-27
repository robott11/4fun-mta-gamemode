local spawnX, spawnY, spawnZ = 1959.55, -1714.46, 20

addEventHandler("onPlayerJoin", getRootElement(),
	function()
		spawnPlayer(source, spawnX, spawnY, spawnZ)
		fadeCamera(source, true)
		setCameraTarget(source)

		outputChatBox("| JOIN | "..source:getName().." Entrou no server", root, 160, 160, 160)
	end
)

addEventHandler("onPlayerQuit", root,
	function(quitType)
		outputChatBox("| QUIT | "..getPlayerName(source).." Saiu do server ("..quitType..")", root, 160, 160, 160)
	end
)

addEventHandler("onPlayerWasted", root, 
	function(ammo, killer, killerWeapon, bodypart)
		-- if there was an attacker
		if (killer) then
			local killFeed

			if (getElementType(killer) == "player" ) then
				-- put the attacker, victim and weapon info in the string
				killFeed = getPlayerName(killer).." Matou "..getPlayerName(source).." ("..getWeaponNameFromID(weapon)..")"
			-- else, if it was a vehicle,
			elseif (getElementType(killer) == "vehicle") then
				-- we'll get the name from the attacker vehicle's driver
				killFeed = getPlayerName (getVehicleController(killer)).." Matou "..getPlayerName(source).." ("..getWeaponNameFromID(weapon)..")"
			end

			-- if the victim was shot in the head, append a special message
			if (bodypart == 9) then
				killFeed = killFeed.." (HEADSHOT!)"
			-- else, just append the bodypart name
			else
				killFeed = killFeed.." ("..getBodyPartName(bodypart)..")"
			end
			
			-- display the message
			outputChatBox(killFeed)
		end

		-- SPAWN PLAYER AFTER 5 SECS
		setTimer(spawnPlayer, 5000, 1, source, spawnX, spawnY, spawnZ)
	end
)