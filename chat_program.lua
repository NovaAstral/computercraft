local modem = peripheral.find("modem")

if(modem == nil) then
    print("Modem not found!")
    os.sleep(5)
    os.reboot()
end

local inwin = window.create(term.current(), 1, 1, 20, 5)
inwin.setBackgroundColour(colors.gray)
inwin.setTextColour(colours.white)
inwin.clear()
inwin.write("wintest")