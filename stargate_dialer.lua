if(Stargate == nil) then
    peripheral.find("basic_interface")

    if(Stargate ~= nil) then
        print("Basic Interface Connected")
        IntType = 1
        Menu = 1
    else
        Stargate = peripheral.find("crystal_interface")

        if(Stargate ~= nil) then
            print("Crystal Interface Connected")
            IntType = 2
            Menu = 1
        else
            Stargate = peripheral.find("advanced_crystal_interface")
            
            if(Stargate ~= nil) then
                print("Advanced Crystal Interface Connected")
                IntType = 3
                Menu = 1
            else
                print("No Interface Detected. Dialing Computer Offline.")
                os.sleep(10)
                os.reboot()
            end
        end
    end
end

local function split(str,sep)
    sep = sep or "-" or ""
    local ret = {}
    for token in str:gmatch("[^"..sep.."]+") do
        ret[#ret+1] = token
    end

    return ret
end

local function dial(tbl) --point of origin is 0
    if(#tbl == 6) then
        print("Dialing Intergalactic Address")

        os.sleep(1)
        engageSymbol(tbl[1])
        os.sleep(1)
        engageSymbol(tbl[2])
        os.sleep(1)
        engageSymbol(tbl[3])
        os.sleep(1)
        engageSymbol(tbl[4])
        os.sleep(1)
        engageSymbol(tbl[5])
        os.sleep(1)
        engageSymbol(tbl[6])
        os.sleep(1)
        engageSymbol(0)
    elseif(#tbl == 7) then
        print("Dialing Extragalactic Address")

        os.sleep(1)
        engageSymbol(tbl[1])
        os.sleep(1)
        engageSymbol(tbl[2])
        os.sleep(1)
        engageSymbol(tbl[3])
        os.sleep(1)
        engageSymbol(tbl[4])
        os.sleep(1)
        engageSymbol(tbl[5])
        os.sleep(1)
        engageSymbol(tbl[6])
        os.sleep(1)
        engageSymbol(tbl[7])
        os.sleep(1)
        engageSymbol(0)
    else
        print("Invalid Address!")
        return
    end
end

while Menu == 1 do
    print("Commands:")
    print("Disconnect / Close - Closes or Resets the Stargate")
    print("Dial - Dials the Stargate")
    --print("Time - Prints how long the Stargate has been open for")
    
    write("CMD> ")
    local cmd = read()

    local cmds = split(cmd," ")

    if(string.lower(cmds[1]) == "disconnect") then
        print("disconnect")
    elseif(string.lower(cmds[1]) == "close") then
        print("close")
    elseif(string.lower(cmds[1]) == "dial") then
        Menu = 2
        dial(cmds)
    end
end