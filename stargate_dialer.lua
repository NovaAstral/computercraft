if(Stargate == nil) then
    Stargate = peripheral.find("basic_interface")

    if(Stargate ~= nil) then
        print("Basic Interface Connected")
        IntType = 1
        Menu = 1
        PrintCmds = true
        Dialing = false
    else
        Stargate = peripheral.find("crystal_interface")

        if(Stargate ~= nil) then
            print("Crystal Interface Connected")
            IntType = 2
            Menu = 1
            PrintCmds = true
            Dialing = false
        else
            Stargate = peripheral.find("advanced_crystal_interface")
            
            if(Stargate ~= nil) then
                print("Advanced Crystal Interface Connected")
                IntType = 3
                Menu = 1
                PrintCmds = true
                Dialing = false
            else
                print("No Interface Detected. Dialing Computer Offline.")
                os.sleep(10)
                os.reboot()
            end
        end
    end
end

local function split(str,sep)
    sep = sep or ""
    local ret = {}
    for token in str:gmatch("[^"..sep.."]+") do
        ret[#ret+1] = token
    end

    return ret
end

local function dial(tbl) --point of origin is 0
    if(#tbl == 7) then -- index 1 is 'dial'
        print("Dialing Intergalactic Address "..tbl[2].."-"..tbl[3].."-"..tbl[4].."-"..tbl[5].."-"..tbl[6].."-"..tbl[7].."-0")

        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[2]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[3]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[4]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[5]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[6]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[7]))
        os.sleep(0.5)
        Stargate.engageSymbol(0)
        os.sleep(2)
        Menu = 1
    elseif(#tbl == 8) then
        print("Dialing Extragalactic Address "..tbl[2].."-"..tbl[3].."-"..tbl[4].."-"..tbl[5].."-"..tbl[6].."-"..tbl[7].."-"..tbl[8].."-0")

        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[2]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[3]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[4]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[5]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[6]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[7]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[8]))
        os.sleep(0.5)
        Stargate.engageSymbol(0)
        os.sleep(2)
        Menu = 1
    elseif(#tbl == 9) then
        print("Dialing Universal Address "..tbl[2].."-"..tbl[3].."-"..tbl[4].."-"..tbl[5].."-"..tbl[6].."-"..tbl[7].."-"..tbl[8].."-"..tbl[9].."-0")
        Menu = 1
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[2]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[3]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[4]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[5]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[6]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[7]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[8]))
        os.sleep(0.5)
        Stargate.engageSymbol(tonumber(tbl[9]))
        os.sleep(0.5)
        Stargate.engageSymbol(0)
        os.sleep(2)
    else
        print("Invalid Address!")
        os.sleep(5)
        Menu = 1
    end
end

while true do
    os.sleep(0.05)

    if(Menu == 1) then --string.sub("dial 123",6) returns '123'
        if(PrintCmds == true) then
            print("Commands:")
            print("Disconnect / Close - Closes or Resets the Stargate")
            print("Time - Prints how long the Stargate has been open for")
            print("Dial <address> - Dials the Stargate")
            print("Rotate <0 / 1> <symbol> - Rotates the gate either anti-clockwise or clockwise to the symbol")
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

        if(string.lower(cmdtest[1]) == "disconnect" or string.lower(cmds[1]) == "close") then
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
        elseif(string.lower(cmdtest[1]) == "oc") then
            Stargate.openChevron()
        elseif(string.lower(cmdtest[1]) == "cc") then
            Stargate.closeChevron()
        elseif(string.lower(cmdtest[1]) == "ec") then
            Stargate.encodeChevron()
        elseif(string.lower(cmdtest[1]) == "dial") then --make it check your current gates group for the address, dialing full 9chev might always connect
            Menu = 2
            if(cmdtest[2] == "abydos") then -- {"","","","","",""}
                addrtbl = {"26","6","14","31","11","29","0"}
            elseif(cmdtest[2] == "earth") then
                addrtbl = {"27","25","4","35","10","28","0"}
            elseif(cmdtest[2] == "atlantis" or cmdtest[2] == "lantea") then
                addrtbl = {"18","20","1","15","14","7","19","0"}
            elseif(cmdtest[2] == "ruki") then
                addrtbl = {"17","15","16","1","4","11","10","30","0"}
            elseif(cmdtest[2] == "nova") then
                addrtbl = {"17","16","35","23","32","8","31","1","0"}
            else
                addrtbl = cmds
                table.remove(addrtbl,1)
                table.insert(addrtbl,"0")
            end

            SymbolNum = 1

            if(tonumber(addrtbl[1]) >= 20) then
                RingRot = 1 --clockwise
            else
                RingRot = 0 --anti-clockwise
            end

            Dialing = true
            Rotating = false --make it rotate by telling it its not rotating
        elseif(string.lower(cmdtest[1]) == "dial2") then --fast dialing / atlantis dialing
            if(cmdtest[2] == "abydos") then --dial({"0","","","","","",""})
                dial({"0","26","6","14","31","11","29"}) --starting with 0 is because it expects a table of atleast 7 because of the 'dial' command
                Menu = 2
            elseif(cmdtest[2] == "earth") then
                dial({"0","27","25","4","35","10","28"})
                Menu = 2
            elseif(cmdtest[2] == "atlantis" or cmdtest[2] == "lantea") then
                dial({"0","18","20","1","15","14","7","19"})
                Menu = 2
            elseif(cmdtest[2] == "ruki") then
                dial({"0","17","15","16","1","4","11","10","30"})
                Menu = 2
            elseif(cmdtest[2] == "nova") then
                dial({"0","17","16","35","23","32","8","31","1"})
                Menu = 2
            else
                Menu = 2
                dial(cmds)
            end
        else
            print("Invalid Command")
        end
    end

    if(Dialing == true) then
        if(Rotating == false) then
            Rotating = true
            if(RingRot == 1) then
                Stargate.rotateClockwise(tonumber(addrtbl[SymbolNum]))
                RingRot = 0
            else
                Stargate.rotateAntiClockwise(tonumber(addrtbl[SymbolNum]))
                RingRot = 1
            end
        end

        if(Stargate.isCurrentSymbol(tonumber(addrtbl[SymbolNum])) == true) then
            Dialing = false

            Stargate.openChevron()
            os.sleep(0.8)
            Stargate.encodeChevron()
            os.sleep(0.5)
            Stargate.closeChevron()
            os.sleep(0.2)

            SymbolNum = SymbolNum+1

            if(SymbolNum == #addrtbl+1) then
                Dialing = false
                Menu = 1
            else
                Dialing = true
                Rotating = false
            end
        end
    end
end