local cbox = peripheral.find("chatBox")
local diskname = ""

if(cbox == nil) then
    print("Chatbox not found!")
    print("Restarting in 5 seconds...")
    os.sleep(5)
    os.reboot()
end

local message = {
    {
        text = "You have made a grave mistake",
        color = "dark_red",
        hoverEvent = {
            action = "show_text",
            contents = "Run.",
        }
    }
}

local msg = textutils.serialiseJSON(message)
cbox.sendFormattedMessage(msg)