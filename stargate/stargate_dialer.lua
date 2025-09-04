---Custom Config---
Custom1Name = ""
Custom1Color = colors.lightBlue
Custom1TextCol = colors.pink
Custom1Adr = {"","","","","","","","","0"}

Custom2Name = ""
Custom2Color = colors.lightBlue
Custom2TextCol = colors.white
Custom2Adr = {"","","","","","","","","0"}

Custom3Name = ""
Custom3Color = colors.lightBlue
Custom3TextCol = colors.white
Custom3Adr = {"","","","","","","","","0"}

Custom4Name = ""
Custom4Color = colors.lightBlue
Custom4TextCol = colors.white
Custom4Adr = {"","","","","","","","","0"}

Custom5Name = ""
Custom5Color = colors.lightBlue
Custom5TextCol = colors.white
Custom5Adr = {"","","","","","","","","0"}
---End Custom Config---

DevPrint = false
FastDialSpeed = 0.5
--todo: remove the os.reboots from slow dialing, fix not being able to stop the gate from dialing
--todo2: add lower to commands so letter case doesnt matter
-- setenergy without a number crashes
function devPrint(str)
    if(DevPrint == true) then
        print("n\ "..str)
    end
end

function drawButton(x,y,str,col,textcol)
    if(DHDMon == nil) then return end

    devPrint("Draw Button "..x.." "..y.." "..str.." "..col.." "..textcol)

    DHDMon.setBackgroundColor(col)
    DHDMon.setCursorPos(x,y)
    DHDMon.setTextColor(textcol)
    DHDMon.write(str)
    DHDMon.setBackgroundColor(colors.black)
    DHDMon.setTextColor(colors.white)
    DHDMon.setCursorPos(1,1)
end

function pressButton(x,y,str,presscol,defaultcol,textcol)
    devPrint("Press Button "..x.." "..y.." "..str.." "..presscol.." "..defaultcol.." "..textcol)

    DHDMon.setBackgroundColor(presscol)
    DHDMon.setCursorPos(x,y)
    DHDMon.setTextColor(textcol)
    DHDMon.write(str)
    os.sleep(0.2)
    DHDMon.setBackgroundColor(defaultcol)
    DHDMon.setCursorPos(x,y)
    DHDMon.setTextColor(textcol)
    DHDMon.write(str)
    DHDMon.setBackgroundColor(colors.black)
    DHDMon.setTextColor(colors.white)
    DHDMon.setCursorPos(1,1)
end

function pressToggleButton(x,y,str,on)
    devPrint("Press Toggle Button "..x.." "..y.." "..str.." "..tostring(on))
    if(on == true) then
        DHDMon.setBackgroundColor(colors.green)
        DHDMon.setCursorPos(x,y)
        DHDMon.write(str)
        DHDMon.setBackgroundColor(colors.black)
        DHDMon.setCursorPos(1,1)
    else
        DHDMon.setBackgroundColor(colors.red)
        DHDMon.setCursorPos(x,y)
        DHDMon.write(str)
        DHDMon.setBackgroundColor(colors.black)
        DHDMon.setCursorPos(1,1)
    end
end

function MonitorMainMenu()
    if(DHDMon == nil) then return end

    devPrint("Monitor Main Menu")

    DHDMon.clear()

    drawButton(2,1,"Earth",colors.brown,colors.white)
    drawButton(2,3,"Nether",colors.red,colors.white)
    drawButton(2,5,"End",colors.yellow,colors.gray)
    drawButton(2,7,"Abydos",colors.yellow,colors.gray)
    drawButton(2,9,"Chulak",colors.green,colors.white)

    drawButton(10,1,"Tenebrae",colors.gray,colors.white)
    drawButton(10,3,"Unitas",colors.yellow,colors.gray)
    drawButton(10,5,"Rima",colors.gray,colors.white)
    drawButton(10,7,"Lantea",colors.lightBlue,colors.gray)
    drawButton(10,9,"Athos",colors.lightBlue,colors.gray)

    Row1Y = 11
    Row2Y = 13
    Row3Y = 15
    Row4Y = 17

    drawButton(6,Row1Y,"1",colors.blue,colors.white)
    drawButton(8,Row1Y,"2",colors.blue,colors.white)
    drawButton(10,Row1Y,"3",colors.blue,colors.white)
    drawButton(12,Row1Y,"4",colors.blue,colors.white)
    drawButton(14,Row1Y,"5",colors.blue,colors.white)
    drawButton(16,Row1Y,"6",colors.blue,colors.white)
    drawButton(18,Row1Y,"7",colors.blue,colors.white)
    drawButton(20,Row1Y,"8",colors.blue,colors.white)
    drawButton(22,Row1Y,"9",colors.blue,colors.white)
    drawButton(24,Row1Y,"10",colors.blue,colors.white)

    drawButton(1,Row2Y,"11",colors.blue,colors.white)
    drawButton(4,Row2Y,"12",colors.blue,colors.white)
    drawButton(7,Row2Y,"13",colors.blue,colors.white)
    drawButton(10,Row2Y,"14",colors.blue,colors.white)
    drawButton(13,Row2Y,"15",colors.blue,colors.white)
    drawButton(16,Row2Y,"16",colors.blue,colors.white)
    drawButton(19,Row2Y,"17",colors.blue,colors.white)
    drawButton(22,Row2Y,"18",colors.blue,colors.white)
    drawButton(25,Row2Y,"19",colors.blue,colors.white)
    drawButton(28,Row2Y,"20",colors.blue,colors.white)

    drawButton(1,Row3Y,"21",colors.blue,colors.white)
    drawButton(4,Row3Y,"22",colors.blue,colors.white)
    drawButton(7,Row3Y,"23",colors.blue,colors.white)
    drawButton(10,Row3Y,"24",colors.blue,colors.white)
    drawButton(13,Row3Y,"25",colors.blue,colors.white)
    drawButton(16,Row3Y,"26",colors.blue,colors.white)
    drawButton(19,Row3Y,"27",colors.blue,colors.white)
    drawButton(22,Row3Y,"28",colors.blue,colors.white)
    drawButton(25,Row3Y,"29",colors.blue,colors.white)
    drawButton(28,Row3Y,"30",colors.blue,colors.white)

    drawButton(4,Row4Y,"31",colors.blue,colors.white)
    drawButton(7,Row4Y,"32",colors.blue,colors.white)
    drawButton(10,Row4Y,"33",colors.blue,colors.white)
    drawButton(13,Row4Y,"34",colors.blue,colors.white)
    drawButton(16,Row4Y,"35",colors.blue,colors.white)
    drawButton(19,Row4Y,"36",colors.blue,colors.white)
    drawButton(22,Row4Y,"37",colors.blue,colors.white)
    drawButton(25,Row4Y,"38",colors.blue,colors.white)

    drawButton(13,Row4Y+2,"DIAL",colors.blue,colors.white)

    if(Interface > 1) then
        if(FastMode == false) then
            drawButton(1,11,"FAST",colors.red,colors.white)
        else
            drawButton(1,11,"FAST",colors.green,colors.white)
        end
    end

    if(IrisActive == true) then 
        drawButton(26,Row4Y+2,"IRIS",colors.green,colors.white) --closed
    else
        drawButton(26,Row4Y+2,"IRIS",colors.red,colors.white) --open
    end

    drawButton(23,Row4Y+2,"SI",colors.blue,colors.white) --stop iris anim

    drawButton(19,1,Custom1Name,Custom1Color,Custom1TextCol)
    drawButton(19,3,Custom2Name,Custom2Color,Custom2TextCol)
    drawButton(19,5,Custom3Name,Custom3Color,Custom3TextCol)
    drawButton(19,7,Custom4Name,Custom4Color,Custom4TextCol)
    drawButton(19,9,Custom5Name,Custom5Color,Custom5TextCol)

    drawButton(1,19,"Close",colors.blue,colors.white)
end

if(Stargate == nil) then  
    if(peripheral.find("advanced_crystal_interface") ~= nil) then
		Stargate = peripheral.find("advanced_crystal_interface")
        Interface = 3
	
        print("Advanced Crystal Interface Connected")
        Menu = 1
        PrintCmds = true
    elseif(peripheral.find("crystal_interface") ~= nil) then
		Stargate = peripheral.find("crystal_interface")
        Interface = 2

		print("Crystal Interface Connected")
		Menu = 1
		PrintCmds = true
	elseif(peripheral.find("basic_interface") ~= nil) then
		Stargate = peripheral.find("basic_interface")
        Interface = 1

		print("Basic Interface Connected")
		Menu = 1
		PrintCmds = true
	else
        print("No Interface Detected. Dialing Computer Offline.")
        os.sleep(10)
        os.reboot()
    end

    if(Stargate ~= nil) then
        if(Stargate.getIrisProgressPercentage() == 0) then
            IrisActive = false
        elseif(Stargate.getIrisProgressPercentage() == 100) then
            IrisActive = true
        else
            printError("The Iris is opening or closing, cannot start the Dialing Computer. Rebooting in 2 seconds.")
            IrisActive = false

            os.sleep(2)
            os.reboot()
        end
    end
end

if(DHDMon == nil or EventMon == nil) then
    local monitors = {peripheral.find("monitor")}

    if(#monitors == 1) then
        local x,y = monitors[1].getSize()

        if(x == 29 and y == 19) then
            DHDMon = monitors[1]
        else
            print("Monitor is the wrong size to be the DHD, setting it to the Event Monitor")
            EventMon = monitors[1]

            EventMon.clear()
            EventMon.setTextScale(0.5)
        end
    else
        for k,v in pairs(monitors) do
            local x,y = v.getSize()

            if(x == 29 and y == 19) then
                DHDMon = v
            else
                EventMon = v
                
                EventMon.clear()
                EventMon.setTextScale(0.5)
            end
        end
    end

    if(DHDMon == nil) then
        print("No 3x3 DHD Monitor detected. Only commands will be available.")
    else
        print("DHD Monitor of the correct size detected.")
        FastMode = false
        DHDMon.clear()
        MonitorMainMenu()
    end
end

function split(str,sep)
    sep = sep or ""
    local ret = {}
    for token in str:gmatch("[^"..sep.."]+") do
        ret[#ret+1] = token
    end

    return ret
end

function isMilkyGate()
    if(Stargate.getStargateType() == "sgjourney:milky_way_stargate" or Stargate.getStargateType() == "sgjourney:milky_way_promo" or Stargate.getStargateType() == "sgjourney:milky_way_sg-1" or Stargate.getStargateType() == "sgjourney:classic_milky_way" or Stargate.getStargateType() == "sgjourney:milky_way_movie") then
        devPrint("isMilkyGate true")
        return true
    else
        devPrint("isMilkyGate false")
        return false
    end
end

function encodeChev(symbol)
    if(isMilkyGate() == false or FastMode == true) then
        if(tonumber(symbol) ~= nil) then
            Stargate.engageSymbol(tonumber(symbol))
        end
    else
        if(tonumber(symbol) ~= nil) then
            if(Stargate.getChevronsEngaged() % 2 == 0) then
                Stargate.rotateClockwise(symbol)
            else
                Stargate.rotateAntiClockwise(symbol)
            end

            while not Stargate.isCurrentSymbol(symbol) do
                sleep(0)
            end
    
            Stargate.openChevron()
            os.sleep(0.8)
            Stargate.encodeChevron()
            os.sleep(0.5)
            Stargate.closeChevron()
        end
    end
end

function slowdial(adr)
    local len = #adr
    local start = Stargate.getChevronsEngaged()+1

    for chev = start,len,1 do
        local symbol = tonumber(adr[chev])

        if(chev % 2 == 0) then
            Stargate.rotateClockwise(symbol)
        else
            Stargate.rotateAntiClockwise(symbol)
        end

        while not Stargate.isCurrentSymbol(symbol) do
            sleep(0)
        end

        Stargate.openChevron()
        os.sleep(0.6)
        Stargate.encodeChevron()
        os.sleep(0.4)
        Stargate.closeChevron()
        os.sleep(1)
    end
end

function dial(tbl) --point of origin is 0
    if(#tbl == 7) then
        print("\nDialing Intergalactic Address "..tbl[1].."-"..tbl[2].."-"..tbl[3].."-"..tbl[4].."-"..tbl[5].."-"..tbl[6].."-"..tbl[7])

        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[1]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[2]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[3]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[4]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[5]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[6]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[7]))
        os.sleep(2)
        Menu = 1
    elseif(#tbl == 8) then
        print("\nDialing Extragalactic Address "..tbl[1].."-"..tbl[2].."-"..tbl[3].."-"..tbl[4].."-"..tbl[5].."-"..tbl[6].."-"..tbl[7].."-"..tbl[8])

        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[1]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[2]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[3]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[4]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[5]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[6]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[7]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[8]))
        os.sleep(2)
        Menu = 1
    elseif(#tbl == 9) then
        print("\nDialing Universal Address "..tbl[1].."-"..tbl[2].."-"..tbl[3].."-"..tbl[4].."-"..tbl[5].."-"..tbl[6].."-"..tbl[7].."-"..tbl[8].."-"..tbl[9])
        Menu = 1
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[1]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[2]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[3]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[4]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[5]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[6]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[7]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[8]))
        os.sleep(FastDialSpeed)
        Stargate.engageSymbol(tonumber(tbl[9]))
        os.sleep(2)
    else
        print("Invalid Address!")
        os.sleep(5)
        Menu = 1
    end
end

function dial2(adr)
    if(isMilkyGate() == false or FastMode == true) then
        dial(adr)
    else
        Menu = 2
        slowdial(adr)
    end
end

function textcmds()
    while true do
        if(Menu == 1) then --string.sub("dial 123",6) returns '123'
            if(PrintCmds == true) then
                term.setTextColor(colors.orange)
                    print("Commands:")

                term.setTextColor(colors.lime)
                    print(">Disconnect / Close")
                term.setTextColor(colors.orange)
                    print("    Closes or Resets the Stargate")

                term.setTextColor(colors.lime)
                    print(">Time")
                term.setTextColor(colors.orange)
                    print("    Prints how long the Stargate has been open for")

                term.setTextColor(colors.lime)
                    print(">Dial <address>")
                term.setTextColor(colors.orange)
                    print("    Dials the Stargate to the given address, or 'abydos', 'earth', or 'atlantis' / 'lantea'")

                term.setTextColor(colors.lime)
                    print(">Rotate <0 / 1> <symbol>")
                term.setTextColor(colors.orange)
                    print("    Rotates the gate either clockwise(1) or counter-clockwise(0) to the given symbol")

                if(Interface > 1) then
                    term.setTextColor(colors.lime)
                        print(">Fast")
                    term.setTextColor(colors.orange)
                        print("    Toggle Fast Dialing")
                end

                --[[
                term.setTextColor(colors.lime)
                    print(">OC / OpenChev")
                term.setTextColor(colors.orange)
                    print("    Opens the top chevron")

                term.setTextColor(colors.lime)
                    print(">CC / CloseChev")
                term.setTextColor(colors.orange)
                    print("    Closes the top chevron")

                term.setTextColor(colors.lime)
                    print(">EC / EngChev")
                term.setTextColor(colors.orange)
                    print("    Engages the top chevron")

                term.setTextColor(colors.lime)
                    print(">DevPrint")
                term.setTextColor(colors.orange)
                    print("    Toggles developer printing")
                ]]--

                term.setTextColor(colors.lime)
                    print(">Power")
                term.setTextColor(colors.orange)
                    print("    Prints the Stargates current power level")

                term.setTextColor(colors.lime)
                    print(">SetEnergy")
                term.setTextColor(colors.orange)
                    print("    Sets the max energy the Stargate can store")
                term.setTextColor(colors.white)

                PrintCmds = false
            end
            
            write("CMD>")
            local cmd = read()
            local cmdtest = split(cmd," ")

            if(#cmdtest == 2) then
                cmds = split(cmd,"-")
            else
                cmds = split(cmd," ")
            end

            if(#cmd ~= 0) then
                if(string.lower(cmdtest[1]) == "disconnect" or string.lower(cmdtest[1]) == "close") then
                    print("Closing Stargate")
                    Stargate.disconnectStargate()
                elseif(string.lower(cmdtest[1]) == "time") then
                    print("The Stargate has been open for "..Stargate.getOpenTime() / 20 .." seconds.")
                elseif(string.lower(cmdtest[1]) == "rotate") then
                    if(cmdtest[2] == "1") then
                        Stargate.rotateClockwise(tonumber(cmdtest[3]))
                    else
                        Stargate.rotateAntiClockwise(tonumber(cmdtest[3]))
                    end
                elseif(string.lower(cmdtest[1]) == "oc" or string.lower(cmdtest[1]) == "openchev") then
                    Stargate.openChevron()
                elseif(string.lower(cmdtest[1]) == "cc" or string.lower(cmdtest[1]) == "closechev") then
                    Stargate.closeChevron()
                elseif(string.lower(cmdtest[1]) == "ec" or string.lower(cmdtest[1]) == "engchev") then
                    Stargate.encodeChevron()
                elseif(string.lower(cmdtest[1]) == "fast") then
                    if(Interface == 1) then
                        print("You are using a Basic Interface, which cannot use Fast Mode!")
                    else
                        FastMode = not FastMode
                        print("Fast Mode is set to "..tostring(FastMode))
                        MonitorMainMenu()
                    end
                elseif(string.lower(cmdtest[1]) == "devprint") then
                    DevPrint = not DevPrint
                    print("Devprint "..tostring(DevPrint))
                elseif(string.lower(cmdtest[1]) == "dial") then --dialing full 9chev always connects
                    Menu = 2
                    if(cmdtest[2] == "abydos") then -- {"","","","","",""}
                        addrtbl = {"26","6","14","31","11","29","0"}
                    elseif(cmdtest[2] == "earth") then
                        --addrtbl = {"1","35","4","31","15","30","32","0"}
						addrtbl = {"27","25","4","35","10","28","0"}
                    elseif(cmdtest[2] == "atlantis" or cmdtest[2] == "lantea") then
                        addrtbl = {"18","20","1","15","14","7","19","0"}
					elseif(cmdtest[2] == "rima") then
						--addrtbl = {"1","31","21","8","19","2","9","0"}
						addrtbl = {"33","20","10","22","3","17","0"}
					elseif(cmdtest[2] == "unitas") then
						--addrtbl = {"1","12","34","24","15","8","17","0"}
						addrtbl = {"2","27","8","34","24","15","0"}
					elseif(cmdtest[2] == "othala") then
						addrtbl = {"10","26","22","15","32","2","8","0"}
						--addrtbl = {"1","6","13","3","35","8","0"}
					elseif(cmdtest[2] == "athos") then
						--addrtbl = {"18","21","14","24","1","26","28","0"}
						addrtbl = {"21","14","24","1","26","28","0"}
                    else
                        addrtbl = cmds
                        table.remove(addrtbl,1)
                        table.insert(addrtbl,"0")
                    end

                    dial2(addrtbl)
                elseif(string.lower(cmdtest[1]) == "power") then
                    term.setTextColor(colors.lime)
                    print(Stargate.getStargateEnergy(),"RF")
                    term.setTextColor(colors.white)
                elseif(string.lower(cmdtest[1]) == "setenergy") then
                    Stargate.setEnergyTarget(tonumber(cmdtest[2]))
                    term.setTextColor(colors.orange)
                        print("Energy Target set to "..cmdtest[2])
                    term.setTextColor(colors.white)
                elseif(string.lower(cmdtest[1]) == "dialspeed") then
                    FastDialSpeed = tonumber(cmdtest[2])
                    print("Fast Dial Speed set to "..cmdtest[2])
                else
                    print("Invalid Command")
                end
            else
                print("Invalid Command")
            end
        end

        os.sleep(0.2)
    end
end

function monitorfunc()
    while true do
        local event, side, x, y = os.pullEvent("monitor_touch")
        if(DHDMon == nil) then return end

        local monx,mony = peripheral.call(side,"getSize")
        if(monx == 29 and mony == 19) then --dhdmon is 29/19 res
            if(x >= 2 and x <= 6 and y == 1) then
                pressButton(2,1,"Earth",colors.orange,colors.brown,colors.white)
                if(true) then --there's no function to get the fucking system
					dial2({"1","35","4","31","15","30","32","0"})
                else
                    dial2({"27","25","4","35","10","28","0"})
                end
            elseif(x >= 2 and x <= 7 and y == 3) then
                pressButton(2,3,"Nether",colors.orange,colors.red,colors.white)
                if(true) then
                    dial2({"27","23","4","34","12","28","0"})
                else
                    dial2({"1","35","6","31","15","28","32","0"})
                end
            elseif(x >= 2 and x <= 4 and y == 5) then
                pressButton(2,5,"End",colors.orange,colors.yellow,colors.gray)
                if(true) then
					dial2({"13","24","2","19","3","30","0"})
                elseif(true) then
                    dial2({"14","30","6","13","17","23","0"})
                else
                    dial2({"18","24","8","16","7","35","30","0"})
                end
            elseif(x >= 2 and x <= 7 and y == 7) then
                pressButton(2,7,"Abydos",colors.orange,colors.yellow,colors.gray)
                if(true) then
                    dial2({"26","6","14","31","11","29","0"})
                else
                    dial2({"1","17","2","34","26","9","33","0"})
                end
            elseif(x >= 2 and x <= 7 and y == 9) then
                pressButton(2,9,"Chulak",colors.orange,colors.green,colors.white)
                if(true) then
                    dial2({"8","1","22","14","36","19","0"})
                else
                    dial2({"1","9","14","21","17","3","29","0"})
                end
            elseif(x >= 10 and x <= 17 and y == 1) then
                pressButton(10,1,"Tenebrae",colors.orange,colors.gray,colors.white)
                if(true) then
                    dial2({"18","7","3","36","25","15","0"})
                else
                    dial2({"1","34","12","18","7","31","6","0"})
                end
            elseif(x >= 10 and x <= 17 and y == 3) then
                pressButton(10,3,"Unitas",colors.yellow,colors.gray,colors.white)
                if(true) then
                    dial2({"2","27","8","34","24","15","0"})
                else
                    dial2({"1","12","34","24","15","8","17","0"})
                end
            elseif(x >= 10 and x <= 17 and y == 5) then
                pressButton(10,5,"Rima",colors.orange,colors.gray,colors.white)
                if(true) then
                    dial2({"33","20","10","22","3","17","0"})
                else
                    dial2({"1","31","21","8","19","2","9","0"})
                end
            elseif(x >= 10 and x <= 15 and y == 7) then
                pressButton(10,7,"Lantea",colors.orange,colors.lightBlue,colors.gray)
                if(true) then
                    dial2({"18","20","1","15","14","7","19","0"})
                else
                    dial2({"29","5","17","34","6","12","0"})
                end
            elseif(x >= 10 and x <= 17 and y == 9) then
                pressButton(10,9,"Athos",colors.orange,colors.gray,colors.white)
                if(true) then
                    dial2({"21","14","24","1","26","28","0"})
                else
                    dial2({"18","21","14","24","1","26","28","0"})
                end
            end

            if(x == 6 and y == Row1Y) then
                pressButton(6,Row1Y,"1",colors.orange,colors.blue,colors.white)
                encodeChev(1)
            elseif(x == 8 and y == Row1Y) then
                pressButton(8,Row1Y,"2",colors.orange,colors.blue,colors.white)
                encodeChev(2)
            elseif(x == 10 and y == Row1Y) then
                pressButton(10,Row1Y,"3",colors.orange,colors.blue,colors.white)
                encodeChev(3)
            elseif(x == 12 and y == Row1Y) then
                pressButton(12,Row1Y,"4",colors.orange,colors.blue,colors.white)
                encodeChev(4)
            elseif(x == 14 and y == Row1Y) then
                pressButton(14,Row1Y,"5",colors.orange,colors.blue,colors.white)
                encodeChev(5)
            elseif(x == 16 and y == Row1Y) then
                pressButton(16,Row1Y,"6",colors.orange,colors.blue,colors.white)
                encodeChev(6)
            elseif(x == 18 and y == Row1Y) then
                pressButton(18,Row1Y,"7",colors.orange,colors.blue,colors.white)
                encodeChev(7)
            elseif(x == 20 and y == Row1Y) then
                pressButton(20,Row1Y,"8",colors.orange,colors.blue,colors.white)
                encodeChev(8)
            elseif(x == 22 and y == Row1Y) then
                pressButton(22,Row1Y,"9",colors.orange,colors.blue,colors.white)
                encodeChev(9)
            elseif(x >= 24 and x <= 25  and y == Row1Y) then
                pressButton(24,Row1Y,"10",colors.orange,colors.blue,colors.white)
                encodeChev(10)
            end

            if(x >= 1 and x <= 2 and y == Row2Y) then
                pressButton(1,Row2Y,"11",colors.orange,colors.blue,colors.white)
                encodeChev(11)
            elseif(x >= 4 and x <= 5 and y == Row2Y) then
                pressButton(4,Row2Y,"12",colors.orange,colors.blue,colors.white)
                encodeChev(12)
            elseif(x >= 7 and x <= 8 and y == Row2Y) then
                pressButton(7,Row2Y,"13",colors.orange,colors.blue,colors.white)
                encodeChev(13)
            elseif(x >= 10 and x <= 11 and y == Row2Y) then
                pressButton(10,Row2Y,"14",colors.orange,colors.blue,colors.white)
                encodeChev(14)
            elseif(x >= 13 and x <= 14 and y == Row2Y) then
                pressButton(13,Row2Y,"15",colors.orange,colors.blue,colors.white)
                encodeChev(15)
            elseif(x >= 16 and x <= 17 and y == Row2Y) then
                pressButton(16,Row2Y,"16",colors.orange,colors.blue,colors.white)
                encodeChev(16)
            elseif(x >= 19 and x <= 20 and y == Row2Y) then
                pressButton(19,Row2Y,"17",colors.orange,colors.blue,colors.white)
                encodeChev(17)
            elseif(x >= 22 and x <= 23 and y == Row2Y) then
                pressButton(22,Row2Y,"18",colors.orange,colors.blue,colors.white)
                encodeChev(18)
            elseif(x >= 25 and x <= 26 and y == Row2Y) then
                pressButton(25,Row2Y,"19",colors.orange,colors.blue,colors.white)
                encodeChev(19)
            elseif(x >= 28 and x <= 29 and y == Row2Y) then
                pressButton(28,Row2Y,"20",colors.orange,colors.blue,colors.white)
                encodeChev(20)
            end

            if(x >= 1 and x <= 2 and y == Row3Y) then
                pressButton(1,Row3Y,"21",colors.orange,colors.blue,colors.white)
                encodeChev(21)
            elseif(x >= 4 and x <= 5 and y == Row3Y) then
                pressButton(4,Row3Y,"22",colors.orange,colors.blue,colors.white)
                encodeChev(22)
            elseif(x >= 7 and x <= 8 and y == Row3Y) then
                pressButton(7,Row3Y,"23",colors.orange,colors.blue,colors.white)
                encodeChev(23)
            elseif(x >= 10 and x <= 11 and y == Row3Y) then
                pressButton(10,Row3Y,"24",colors.orange,colors.blue,colors.white)
                encodeChev(24)
            elseif(x >= 13 and x <= 14 and y == Row3Y) then
                pressButton(13,Row3Y,"25",colors.orange,colors.blue,colors.white)
                encodeChev(25)
            elseif(x >= 16 and x <= 17 and y == Row3Y) then
                pressButton(16,Row3Y,"26",colors.orange,colors.blue,colors.white)
                encodeChev(26)
            elseif(x >= 19 and x <= 20 and y == Row3Y) then
                pressButton(19,Row3Y,"27",colors.orange,colors.blue,colors.white)
                encodeChev(27)
            elseif(x >= 22 and x <= 23 and y == Row3Y) then
                pressButton(22,Row3Y,"28",colors.orange,colors.blue,colors.white)
                encodeChev(28)
            elseif(x >= 25 and x <= 26 and y == Row3Y) then
                pressButton(25,Row3Y,"29",colors.orange,colors.blue,colors.white)
                encodeChev(29)
            elseif(x >= 28 and x <= 29 and y == Row3Y) then
                pressButton(28,Row3Y,"30",colors.orange,colors.blue,colors.white)
                encodeChev(30)
            end

            if(x >= 4 and x <= 5 and y == Row4Y) then
                pressButton(4,Row4Y,"31",colors.orange,colors.blue,colors.white)
                encodeChev(31)
            elseif(x >= 7 and x <= 8 and y == Row4Y) then
                pressButton(7,Row4Y,"32",colors.orange,colors.blue,colors.white)
                encodeChev(32)
            elseif(x >= 10 and x <= 11 and y == Row4Y) then
                pressButton(10,Row4Y,"33",colors.orange,colors.blue,colors.white)
                encodeChev(33)
            elseif(x >= 13 and x <= 14 and y == Row4Y) then
                pressButton(13,Row4Y,"34",colors.orange,colors.blue,colors.white)
                encodeChev(34)
            elseif(x >= 16 and x <= 17 and y == Row4Y) then
                pressButton(16,Row4Y,"35",colors.orange,colors.blue,colors.white)
                encodeChev(35)
            elseif(x >= 19 and x <= 20 and y == Row4Y) then
                pressButton(19,Row4Y,"36",colors.orange,colors.blue,colors.white)
                encodeChev(36)
            elseif(x >= 22 and x <= 23 and y == Row4Y) then
                pressButton(22,Row4Y,"37",colors.orange,colors.blue,colors.white)
                encodeChev(37)
            elseif(x >= 25 and x <= 26 and y == Row4Y) then
                pressButton(25,Row4Y,"38",colors.orange,colors.blue,colors.white)
                encodeChev(38)
            elseif(x >= 13 and x <= 16 and y == Row4Y+2) then
                pressButton(13,Row4Y+2,"DIAL",colors.orange,colors.blue,colors.white)
                encodeChev(0)
            end

            if(Interface > 1 and x >= 1 and x <= 4 and y == 11) then --fast mode
                pressToggleButton(1,11,"FAST",not FastMode)

                FastMode = not FastMode
            elseif(x >= 1 and x <= 5 and y == 19) then --close
                pressButton(1,19,"Close",colors.orange,colors.blue,colors.white)
                Stargate.disconnectStargate()
            end

            if(x >= 26 and x <= 30 and y == Row4Y+2) then --iris control
                pressToggleButton(26,Row4Y+2,"IRIS",IrisActive)
                
                IrisActive = not IrisActive

                if(IrisActive == true) then
                    Stargate.openIris()
                else
                    Stargate.closeIris()
                end
            end

            if(x >= 23 and x <= 24 and y == Row4Y+2) then --stop iris anim
                pressButton(23,Row4Y+2,"SI",colors.orange,colors.blue,colors.white)

                Stargate.stopIris()
            end

            if(x >= 19 and x <= 19+#Custom1Name and y == 1) then
                pressButton(19,1,Custom1Name,colors.orange,Custom1Color,Custom1TextCol)
                dial2(Custom1Adr)
            elseif(x >= 19 and x <= 19+#Custom2Name and y == 3) then
                pressButton(19,3,Custom2Name,colors.orange,Custom2Color,Custom2TextCol)
                dial2(Custom2Adr)
            elseif(x >= 19 and x <= 19+#Custom3Name and y == 5) then
                pressButton(19,5,Custom3Name,colors.orange,Custom3Color,Custom3TextCol)
                dial2(Custom3Adr)
            elseif(x >= 19 and x <= 19+#Custom4Name and y == 7) then
                pressButton(19,7,Custom4Name,colors.orange,Custom4Color,Custom4TextCol)
                dial2(Custom4Adr)
            elseif(x >= 19 and x <= 19+#Custom5Name and y == 9) then
                pressButton(19,9,Custom5Name,colors.orange,Custom5Color,Custom5TextCol)
                dial2(Custom5Adr)
            end
        end
    end
end

function incomingEvent()
    while true do
        local event,adr = os.pullEvent("stargate_incoming_wormhole")
        
        if(EventMon ~= nil) then
            EventMon.setCursorPos(1,1)
            EventMon.setTextColor(colors.orange)
                EventMon.write("Incoming Wormhole from address:")
            EventMon.setTextColor(colors.lime)
            if(#adr == 6) then
                EventMon.write(adr[1].."-"..adr[2].."-"..adr[3].."-"..adr[4].."-"..adr[5].."-"..adr[6].."-".."0")
            elseif(#adr == 7) then
                EventMon.write(adr[1].."-"..adr[2].."-"..adr[3].."-"..adr[4].."-"..adr[5].."-"..adr[6].."-"..adr[7].."-".."0")
            elseif(#adr == 8) then
                EventMon.write(adr[1].."-"..adr[2].."-"..adr[3].."-"..adr[4].."-"..adr[5].."-"..adr[6].."-"..adr[7].."-"..adr[8].."-".."0")
            else
                print(#adr)
            end
            
            EventMon.setTextColor(colors.white)
            EventMon.scroll(-1)
        end
    end
end

function outgoingEvent()
    while true do
        local event,adr = os.pullEvent("stargate_outgoing_wormhole")
        if(EventMon ~= nil) then
            EventMon.setCursorPos(1,1)
            EventMon.setTextColor(colors.orange)
                EventMon.write("Outgoing Wormhole to address:")
            EventMon.setTextColor(colors.lime)

            if(#adr == 6) then
                EventMon.write(adr[1].."-"..adr[2].."-"..adr[3].."-"..adr[4].."-"..adr[5].."-"..adr[6].."-".."0")
            elseif(#adr == 7) then
                EventMon.write(adr[1].."-"..adr[2].."-"..adr[3].."-"..adr[4].."-"..adr[5].."-"..adr[6].."-"..adr[7].."-".."0")
            else
                EventMon.write(adr[1].."-"..adr[2].."-"..adr[3].."-"..adr[4].."-"..adr[5].."-"..adr[6].."-"..adr[7].."-"..adr[8].."-".."0")
            end

            EventMon.setTextColor(colors.white)
            EventMon.scroll(-1)
        end
    end
end

function errorEvent()
    while true do
        local event,code,msg = os.pullEvent("stargate_reset")
        
        if(EventMon ~= nil) then
            os.sleep(0.2)
            EventMon.setCursorPos(1,1)
            EventMon.setTextColor(colors.orange)

            if(code == 1) then --wiki is wrong on what the codes are, so some of these emight be wrong
                EventMon.write("Symbol Encoded")
            elseif(code == 2) then
                EventMon.write("Systemwide Connection Established")
            elseif(code == 3) then
                EventMon.write("Interstallar Connection Established")
            elseif(code == 4) then
                EventMon.write("Intergalactic Connection Established")
            elseif(code == 5) then
                EventMon.write("Success Code 5 - "..msg)
            elseif(code == 6) then
                EventMon.write("Success Code 6 - "..msg)
            elseif(code == 7) then
                EventMon.write("Stargate has been ")
                EventMon.setTextColor(colors.red)
                EventMon.write("Shutdown")
            elseif(code == 8) then
                EventMon.write("Stargate has been ")
                    EventMon.setTextColor(colors.red)
                EventMon.write("Shutdown")
                    EventMon.setTextColor(colors.orange)
                EventMon.write(" by the Point of Origin")
            elseif(code == 9) then
                EventMon.write("Stargate has been ")
                    EventMon.setTextColor(colors.red)
                    EventMon.write("Shutdown")
                    EventMon.setTextColor(colors.orange)
                EventMon.write(" by the Network")
            elseif(code == 10) then
                EventMon.write("Stargate has been ")
                    EventMon.setTextColor(colors.red)
                    EventMon.write("Shutdown")
                    EventMon.setTextColor(colors.orange)
                EventMon.write(" by the Autoclose Program")
            elseif(code == 11) then
                EventMon.write("Chevron Raised")
            elseif(code == -1) then --error codes--
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Unknown Error")
                EventMon.setTextColor(colors.orange)
            elseif(code == -2) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Symbol is already in address")
                EventMon.setTextColor(colors.orange)
            elseif(code == -3) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Symbol out of bounds")
                EventMon.setTextColor(colors.orange)
            elseif(code == -4) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Cannot encode symbol while gate is active")
                EventMon.setTextColor(colors.orange)
            elseif(code == -5) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Incomplete Address")
                EventMon.setTextColor(colors.orange)
            elseif(code == -6) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Invalid Address")
                EventMon.setTextColor(colors.orange)
            elseif(code == -7) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Not enough Power "..Stargate.getEnergy().."RF")
                EventMon.setTextColor(colors.orange)
            elseif(code == -8) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Dialing Stargate Obstructed")
                EventMon.setTextColor(colors.orange)
            elseif(code == -9) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Destination Stargate Obstructed")
                EventMon.setTextColor(colors.orange)
            elseif(code == -10) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("You can't dial your own phone number")
                EventMon.setTextColor(colors.orange)
            elseif(code == -11) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Cannot dial the same system")
                EventMon.setTextColor(colors.orange)
            elseif(code == -12) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Stargate is already Active")
                EventMon.setTextColor(colors.orange)
            elseif(code == -13) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Invalid Galaxy")
                EventMon.setTextColor(colors.orange)
            elseif(code == -14) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("System does not have any Dimensions")
                EventMon.setTextColor(colors.orange)
            elseif(code == -15) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("System does not have any Stargates")
                EventMon.setTextColor(colors.orange)
            elseif(code == -16) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Destination is Restricted")
                EventMon.setTextColor(colors.orange)
            elseif(code == -17) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Invalid 8 Chevron Address")
                EventMon.setTextColor(colors.orange)
            elseif(code == -18) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Invalid systemwide Connection")
                EventMon.setTextColor(colors.orange)
            elseif(code == -19) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Destination is Whitelisted")
                EventMon.setTextColor(colors.orange)
            elseif(code == -20) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Dialing Stargate is Whitelisted")
                EventMon.setTextColor(colors.orange)
            elseif(code == -21) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                    EventMon.write("Destination is Blacklisted")
                EventMon.setTextColor(colors.orange)
            elseif(code == -22) then
                EventMon.setTextColor(colors.red)
                    EventMon.write("Error: ")
                EventMon.setTextColor(colors.red)
                EventMon.write("Dialing Stargate is Blacklisted")
                    EventMon.setTextColor(colors.orange)
            else
                    EventMon.write("Stargate Reset: ")
                EventMon.setTextColor(colors.lime)
                    EventMon.write(code.." "..msg)
                EventMon.setTextColor(colors.white)
            end

            if(DevPrint == true) then
                EventMon.setTextColor(colors.lime)
                    EventMon.write(code.." "..msg)
                EventMon.setTextColor(colors.white)
            end

            EventMon.scroll(-1)
            EventMon.setTextColor(colors.white)
        end
    end
end

function irisHitEvent()
    while true do
        if(EventMon ~= nil) then
            local event,name,uuid = os.pullEvent("iris_thud")

            os.sleep(0.2)
            EventMon.setCursorPos(1,1)
            EventMon.setTextColor(colors.orange)

            EventMon.write("A <")
            EventMon.setTextColor(colors.lime)
            EventMon.write(name)
            EventMon.setTextColor(colors.orange)
            EventMon.write("> <")
            EventMon.setTextColor(colors.lime)
            EventMon.write(uuid)
            EventMon.setTextColor(colors.orange)
            EventMon.write("> Hit the Iris")

            EventMon.scroll(-1)
            EventMon.setTextColor(colors.white)
        end

        os.sleep(0.2)
    end
end


parallel.waitForAny(textcmds,monitorfunc,incomingEvent,outgoingEvent,errorEvent,irisHitEvent) --eventmonfunc