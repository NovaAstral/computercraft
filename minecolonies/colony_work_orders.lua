local colint = peripheral.find("colonyIntegrator")
local mon = peripheral.find("monitor")
local Menu = "main"

function GetBuildings()
    if(Menu == "main") then
        local buildings = colint.getBuildings()

        for k,v in ipairs(buildings) do
            curx, cury = mon.getCursorPos()
            print(v.name)
            mon.write(v.name)
            mon.setCursorPos(1,cury+1)
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