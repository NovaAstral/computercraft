mod = peripheral.find("modem")

if(mod ~= nil) then
    print("Ender Modem Found")
    redstone.setOutput("top",false)
else
    print("No Ender Modem found, restarting in 10 seconds.")
    os.sleep(10)
    os.reboot()
end

while true do
    if(port ~= nil and port.getStatus() == true) then
        if(port.getDamagePercent() >= 1) then
            port.scram()
            redstone.setOutput("top",true)

            printError("Reactor SCRAM'd due to taking damage!")
            print("Restart the computer before turning the reactor back on!")
        end

        if(port.getHeatedCoolantFilledPercentage() >= 10) then
            port.scram()
            redstone.setOutput("top",true)

            printError("Reactor SCRAM'd due to too much (>=10%) Heated Coolant being stored!")
            print("Restart the computer before turning the reactor back on!")
        end

        if(port.getWasteFilledPercentage() >= 10) then
            port.scram()
            redstone.setOutput("top",true)

            printError("Reactor SCRAM'd due to too much (>=10%) waste being stored!")
            print("Restart the computer before turning the reactor back on!")
        end

        if(port.getHeatingRate() >= port.getCoolant()["amount"] / 4) then
            port.scram()
            redstone.setOutput("top",true)

            printError("Reactor SCRAM'd due to coolant heating rate being a quarter (1/4) of the current coolant remaining")
            print("Restart the computer before turning the reactor back on!")
        end
    end

    sleep(0.1) --prevents 'too long without yielding'
end