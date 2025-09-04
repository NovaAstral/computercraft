local colint = peripheral.find("colonyIntegrator")
local mon = peripheral.find("monitor")

function GetBuildings()
    while true do
        os.sleep(0.1)
        if(mon == nil) then return end

        mon.clear()
        mon.setCursorPos(1,1)

        local buildings = colint.getBuildings()

        for k,v in ipairs(buildings) do
            if(v.name == "com.minecolonies.building.builder") then
                mon.setTextColor(colors.red)
                mon.write("Colony Builders Hut Orders")
                mon.setCursorPos(1,1)

                res = colint.getBuilderResources(v.location)

                if(res[1] == nil) then
                    mon.setTextColor(colors.green)
                    mon.setCursorPos(1,3)
                    mon.write("No Work Orders")
                end

                for k,v in pairs(res) do
                    if(v ~= nil) then
                        mon.setTextColor(colors.orange)
                        if(v.status == "NEED_MORE" or v.status == "DONT_HAVE" and v.delivering == 0) then
                            mon.write("["..v.displayName.."]".." Need: ".."["..v.needed.."] ") -- item name
                            curx, cury = mon.getCursorPos()
                            mon.setCursorPos(1,cury+1)
                        end
                    end
                end
            end
        end
    end
end

if(mon == nil) then
    printError("Monitor not found.")
    os.sleep(10)
    os.reboot()
else
    print("Monitor found.")
    mon.setCursorPos(1,1)
    mon.clear()
    mon.setTextScale(0.5)
end

if(colint == nil) then
    printError("Colony Integrator not found.")
    os.sleep(10)
    os.reboot()
else
    print("Colony Integrator found.")
    os.sleep(0.1)
    GetBuildings()
end