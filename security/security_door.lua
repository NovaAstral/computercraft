local reader = peripheral.find("drive")
local diskname = ""
local sdname = ""
local sdlvl = 0
local DevPrint = false

settings.set("motd.enable",false)
settings.save()

function devPrint(str)
    if(DevPrint == true) then
        print("n\ "..str)
    end
end

if(reader == nil) then
    print("Floppy Disk Reader not found!")
    print("Restarting in 5 seconds...")
    os.sleep(5)
    os.reboot()
else
    if(fs.isDir("secdoor")) then

        local file = fs.open("secdoor/name.txt","r")
        sdname = tostring(file.readAll())
        file.close()

        local file = fs.open("secdoor/aclvl.txt","r")
        sdlvl = file.readAll()
        file.close()

        devPrint("Security Door <"..sdname.." | "..sdlvl.."> active.")
        print("Insert Keycard.")
    else
        textutils.slowWrite("Security Files not found... Initating setup.\nEnter Door Name\n>",40)
        local cmd = read()

        if(#cmd ~= 0) then
            local file = fs.open("secdoor/name.txt","w")
            file.write(tostring(cmd))
            file.close()

            sdname = cmd

            textutils.slowWrite("Enter Door Access Level\n>",40)
            local cmd = read()

            if(#cmd ~= 0) then
                local file = fs.open("secdoor/aclvl.txt","w")
                file.write(tostring(cmd))
                file.close()

                sdlvl = cmd

                print("Security Door setup with name <"..sdname.."> with an Access Level of <"..sdlvl..">")

                local fswrite = "w"

                if(fs.isDir("secdoor/logs.txt")) then
                    fswrite = "a" --append instead of overwriting the file
                else
                    fswrite = "w" --create the file
                end

                local file = fs.open("secdoor/logs.txt",fswrite)
                file.write(os.date("%x").." "..textutils.formatTime(os.time("utc")).." Security Door setup with name <"..sdname.."> with an Access Level of <"..sdlvl..">\n")
                file.close()

                os.sleep(5)
                os.reboot()
            end
        end
    end
end

function DiskIns()
    while true do
         local event,side = os.pullEvent("disk")

        if(reader.isDiskPresent() == nil) then return end

        diskname = reader.getDiskLabel() or ""
        devPrint("Disk <"..diskname.."> Inserted.")

        if(reader.hasAudio()) then
            print("Playing Music: "..reader.getAudioTitle())
            reader.playAudio()
        else
            local file = fs.open("disk/ply.txt","r")
            local dname = tostring(file.readAll())
            file.close()

            local file = fs.open("disk/seclvl.txt","r")
            local dlvl = file.readAll()
            file.close()

            if(tonumber(dlvl) >= tonumber(sdlvl)) then
                print("Access Granted, "..tostring(dname))

                local file = fs.open("secdoor/logs.txt","a")
                file.write(os.date("%x").." "..textutils.formatTime(os.time("utc")).." Keycard <"..dname.." | "..dlvl.."> granted access to Door <"..sdname.." | "..sdlvl..">\n")
                file.close()

                reader.ejectDisk()

                redstone.setOutput("left",true)

                os.sleep(5)
                redstone.setOutput("left",false)
                os.reboot()
            else
                print(dname..", Your access level of <"..dlvl.."> is not high enough to open this door.")

                local file = fs.open("secdoor/logs.txt","a")
                file.write(os.date("%x").." "..textutils.formatTime(os.time("utc")).." INVALID Keycard <"..dname.." | "..dlvl.."> tried to access Door <"..sdname.." | "..sdlvl..">\n")
                file.close()

                reader.ejectDisk()

                redstone.setOutput("bottom",true)
                os.sleep(1.3)
                redstone.setOutput("bottom",false)

                os.sleep(5)
                os.reboot()
            end
        end
    end
end

function DiskEject()
    while true do
        local event,side = os.pullEvent("disk_eject")

        devPrint("Disk <"..diskname.."> Ejected.")

        reader.stopAudio()
    end
end

parallel.waitForAny(DiskIns,DiskEject)