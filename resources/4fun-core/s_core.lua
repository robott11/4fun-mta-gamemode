addEventHandler("onResourceStart", resourceRoot,
    function()
        outputServerLog("Starting up gamemodes resources")

        for i,v in pairs(getResources()) do
            if (getResourceName(v):find("4fun-")) then
                if (getResourceState(v) == "loaded") then
                    if (not startResource(v)) then
                        outputServerLog("Failed start up of " .. getResourceName(v) .. ". Please investigate.")
                    end
                end
            end
        end
    end
)