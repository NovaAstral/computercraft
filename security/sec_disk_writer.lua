local reader = peripheral.find("drive")
local diskname = ""
local name = ""
local lvl = ""

local DevPrint = false

settings.set("motd.enable",false)
settings.save()

if(reader == nil) then
    print("Floppy Disk Reader not found!")
    print("Restarting in 5 seconds...")
    os.sleep(5)
    os.reboot()
end

function devPrint(str)
    if(DevPrint == true) then
        print("n\ "..str)
    end
end

function DiskIns()
    while true do
        local event,side = os.pullEvent("disk")

        if(reader.isDiskPresent() == nil) then return end

        diskname = reader.getDiskLabel() or "Unnamed Disk"
        devPrint("Disk <"..diskname.."> Inserted into <"..side.."> side")

        if(reader.hasAudio()) then
            print("Playing Music: "..reader.getAudioTitle())
            reader.playAudio()
        else
            write("Enter Username\n>")
            local cmd = read()
 
            if(#cmd ~= 0) then
                local file = fs.open("disk/ply.txt","w")
                file.write(cmd)
                file.close()
                name = cmd

                write("Enter Access Level\n>")
                local cmd = read()

                if(#cmd ~= 0) then
                    local file = fs.open("disk/seclvl.txt","w")
                    file.write(cmd)
                    file.close()

                    lvl = cmd
                end

                reader.setDiskLabel(name.." | "..lvl)

                diskname = reader.getDiskLabel()

                local fswrite = "w"

                if(fs.isDir("dwriter/logs.txt")) then
                    fswrite = "a" --append instead of overwriting the file
                else
                    fswrite = "w" --create the file
                end

                local file = fs.open("secdoor/logs.txt",fswrite)
                file.write(os.date("%x").." "..textutils.formatTime(os.time("utc")).." Keycard <"..name.." | "..lvl.."> Created\n")
                file.close()

                os.sleep(0.1)

                reader.ejectDisk()
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