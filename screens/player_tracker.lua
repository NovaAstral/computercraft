local det = peripheral.find("playerDetector") --complete bullshit peripheral From Advanced Peripherals
local mon = peripheral.find("monitor")

function GetPlys()
    if(mon == nil) then
        printError("Monitor not found.")
    else
        mon.setCursorPos(1,1)
        mon.clear()
        mon.setTextScale(0.5)
    end

    if(det == nil) then
        printError("Player Detector not found.")
        os.sleep(5)
        os.reboot()
    end

    local plys = det.getOnlinePlayers()

    mon.setTextColor(colors.green)
    mon.write("Players:")
    mon.setCursorPos(1,2)

    for k,v in ipairs(plys) do
        curx, cury = mon.getCursorPos()
        mon.setCursorPos(1,cury+1)

        local plyinfo = det.getPlayerPos(v)
        local dim = plyinfo.dimension
        local x = plyinfo.x
        local y = plyinfo.y
        local z = plyinfo.z

        if(v == "Nova_Astral" or v == "HyperRuki") then
            mon.setTextColor(colors.pink)
        elseif(v == "wildfire158") then
            mon.setTextColor(colors.red)
        elseif(v == "spycatcher9653" or v == "Lady_azure3") then
            mon.setTextColor(colors.purple)
        else
            mon.setTextColor(colors.lime)
        end
		
		if(v ~= nil and dim ~= nil) then
			mon.write(v..": Pos: <"..x.." "..y.." "..z.."> Dim: <"..dim..">")
		end
    end

    os.sleep(5)
    GetPlys()
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

if(det == nil) then
    printError("Player Tracker not found.")
    os.sleep(10)
    os.reboot()
else
    print("Player Detector found, time for fucking bullshit")
    os.sleep(0.1)
    GetPlys()
end