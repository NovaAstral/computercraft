local colint = peripheral.find("colonyIntegrator")
local mon = peripheral.find("monitor")
local Menu = "main"

function GetBuildings()
    if(Menu == "main") then
        local buildings = colint.getBuildings()

        for k,v in ipairs(buildings) do
            if(v.name == "com.minecolonies.building.builder") then
                curx, cury = mon.getCursorPos()
                delivering,item,needed,name,available,status = colint.getBuilderResources(v.location)

                mon.write(delivering)
                mon.setCursorPos(1,cury+1)

                mon.write(item)
                mon.setCursorPos(1,cury+2)

                mon.write(needed)
                mon.setCursorPos(1,cury+3)

                mon.write(name)
                mon.setCursorPos(1,cury+4)

                mon.write(available)
                mon.setCursorPos(1,cury+5)

                mon.write(status)
                mon.setCursorPos(1,cury+6)
            end
            
            --curx, cury = mon.getCursorPos()
            --print(v.name)
            --mon.write(v.name)
            --mon.setCursorPos(1,cury+1)
        end
    end

    if(Menu == "ababab") then
        print("not main")
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