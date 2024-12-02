port = peripheral.find("BigReactors-Reactor")
PwrMax = 10000000 --the max energy your reactor can store

if(port ~= nil) then
    print("Reactor Port Found")
else
    print("No Reactor Port Found")
end

while true do
    if(port ~= nil and port.getConnected() == true) then
        if(port.getEnergyStored() / PwrMax * 100 <= 75) then
            port.setActive(true)
        end

        if(port.getEnergyStored() / PwrMax * 100 >= 90) then
            port.setActive(false)
        end

        if(port.getFuelAmount() <= 600 and redstone.getInput("right") == false) then
            redstone.setOutput("right",true)
        elseif(port.getFuelAmount() > 600 and redstone.getInput("right") == true) then
            redstone.setOutput("right",false)
        end

        if(port.getWasteAmount() >= 3000 and redstone.getInput("left") == false) then
            redstone.setOutput("left",true)
        elseif(port.getWasteAmount() <= 100 and redstone.getInput("left") == true) then
            redstone.setOutput("left",false)
        end
    end

    sleep(0.1) --prevents 'too long without yielding'
end