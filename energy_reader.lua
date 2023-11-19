local power = peripheral.wrap("back")
local mon = peripheral.find("monitor")

function ReadPower()
    local curpower = power.getEnergy()
    local maxpower = power.getEnergyCapacity()

    if(curpower == nil) then
        mon.setTextColor(colors.red)
        mon.write("No Power detected in the block.")
    else
        curx, cury = mon.getCursorPos()

        mon.setTextColor(colors.magenta)
        mon.write("Reading Power Data")
        mon.setCursorPos(1,2)

        mon.setTextColor(colors.orange)
        mon.write("Max Storage Capacity: "..maxpower)
        mon.setCursorPos(1,3)

        mon.write("Current Power: "..curpower)
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

if(power == nil) then
    printError("Back Peripheral not found. Please connect a power block to the back of the computer")
    os.sleep(10)
    os.reboot()
else
    print("Back Peripheral found.")
    os.sleep(0.1)
    ReadPower()
end