Stargate = peripheral.find("basic_interface")

if(Stargate != nil) then
    print("Basic Interface Connected")
    IntType = 1
else
    Stargate = peripheral.find("crystal_interface")

    if(Stargate != nil) then
        print("Crystal Interface Connected")
        IntType = 2
    else
        Stargate = peripheral.find("advanced_crystal_interface")
        
        if(Stargate != nil) then
            print("Advanced Crystal Interface Connected")
            IntType = 3
        else
            print("No Interface Detected. Dialing Computer Offline.")
            os.sleep(10)
            os.reboot()
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

while Menu == 1 do
    print("Commands:")
    print("Disconnect / Close - Closes or Resets the Stargate")
    print("Dial - Dials the Stargate")
    --print("Time - Prints how long the Stargate has been open for")
    
    write("CMD> ")
    local cmd = read()

    local cmds = split(cmd," ")

    if(CMDS[1] == "disconnect") then
        print("disconnect")
    elseif(CMDS[1] == "close") then
        print("close")
    elseif(CMDS[1] == "dial") then
        print("dial")
    end
end