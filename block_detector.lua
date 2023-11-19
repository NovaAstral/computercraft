local reader = peripheral.find("blockReader")
local mon = peripheral.find("mon")

function ReadBlock()
    local blockdata = reader.getBlockData()
    local blockname = reader.getBlockName()

    mon.setTextColor(colors.magenta)
    mon.write("Reading data from: "..blockname)
    mon.setCursorPos(1,2)

    for k,v in ipairs(blockdata) do
        curx, cury = mon.getCursorPos()

        mon.write(v)
        mon.setCursorPos(1,cury+1)
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

if(reader == nil) then
    printError("Block Reader not found.")
    os.sleep(10)
    os.reboot()
else
    print("Colony Integrator found.")
    os.sleep(0.1)
    ReadBlock()
end