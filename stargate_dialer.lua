if(Stargate == nil) then
    Stargate = peripheral.find("basic_interface")

    if(Stargate ~= nil) then
        print("Basic Interface Connected")
        IntType = 1
        Menu = 1
        PrintCmds = true
    else
        Stargate = peripheral.find("crystal_interface")

        if(Stargate ~= nil) then
            print("Crystal Interface Connected")
            IntType = 2
            Menu = 1
            PrintCmds = true
        else
            Stargate = peripheral.find("advanced_crystal_interface")
            
            if(Stargate ~= nil) then
                print("Advanced Crystal Interface Connected")
                IntType = 3
                Menu = 1
                PrintCmds = true
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
    else
        print("Invalid Address!")
        print(#tbl)
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

            PrintCmds = false
        end
        
        write("CMD > ")
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
        elseif(string.lower(cmdtest[1]) == "dial") then
            if(cmdtest[2] == "abydos") then
                dial({"0","26","6","14","31","11","29"}) --starting with 0 is because it expects a table of atleast 7 because of the 'dial' command
                Menu = 2
            elseif(cmdtest[2] == "earth") then
                dial({"0","27","25","4","35","10","28"})
                Menu = 2
            elseif(cmdtest[3] == "atlantis" or cmdtest[3] == "lantea") then
                dial({"0","18","20","1","15","14","7","19"})
                Menu = 2
            else
                Menu = 2
                dial(cmds)
            end
        else
            print("Invalid Command")
        end
    end
end