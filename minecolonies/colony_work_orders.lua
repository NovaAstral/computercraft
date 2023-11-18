local colint = peripheral.find("colonyIntegrator")
local Menu = "main"

function GetBuildings()
    if(Menu == "main") then
        local buildings = colint.getBuildings()

        for k,v in ipairs(buildings) do
            print(v.name)
        end
    end

    if(Menu == "ababab") then
        print("not main")
    end
end

if(colint == nil) then
    printError("Colony Integrator not found.")
    os.sleep(10)
    os.reboot()
else
    print("Colony Integrator found.")
    GetBuildings()
end