local colint = peripheral.find("colonyIntegrator")

if(colint == nil) then
    printError("Colony Integrator not found.")
    os.sleep(10)
    os.reboot()
else
    print("Colony Integrator found.")
end

local Menu = "main"

while true do
    if(Menu == "main") then
        print("main")
    end

    if(Menu == "ababab") then
        print("not main")
    end
end