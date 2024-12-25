---Custom Config---
Custom1Name = "Nova"
Custom1Color = colors.pink
Custom1TextCol = colors.white
Custom1Adr = {"17","16","35","23","32","8","31","1","0"}

Custom2Name = "Ruki"
Custom2Color = colors.pink
Custom2TextCol = colors.white
Custom2Adr = {"17","15","16","1","4","11","10","30","0"}

Custom3Name = ""
Custom3Color = colors.blue
Custom3TextCol = colors.white
Custom3Adr = {"","","","","","","","",""}

Custom4Name = ""
Custom4Color = colors.blue
Custom4TextCol = colors.white
Custom4Adr = {"","","","","","","","",""}

Custom5Name = ""
Custom5Color = colors.blue
Custom5TextCol = colors.white
Custom5Adr = {"","","","","","","","",""}
---End Custom Config---

function drawButton(x,y,str,col,textcol)
    mon.setBackgroundColor(col)
    mon.setCursorPos(x,y)
    mon.setTextColor(textcol)
    mon.write(str)
    mon.setBackgroundColor(colors.black)
    mon.setTextColor(colors.white)
    mon.setCursorPos(1,1)
end

function pressButton(x,y,str,presscol,defaultcol,textcol)
    mon.setBackgroundColor(presscol)
    mon.setCursorPos(x,y)
    mon.setTextColor(textcol)
    mon.write(str)
    os.sleep(0.2)
    mon.setBackgroundColor(defaultcol)
    mon.setCursorPos(x,y)
    mon.setTextColor(textcol)
    mon.write(str)
    mon.setBackgroundColor(colors.black)
    mon.setTextColor(colors.white)
    mon.setCursorPos(1,1)
end

function pressToggleButton(x,y,str,on)
    if(on == true) then
        mon.setBackgroundColor(colors.green)
        mon.setCursorPos(x,y)
        mon.write(str)
        mon.setBackgroundColor(colors.black)
        mon.setCursorPos(1,1)
    else
        mon.setBackgroundColor(colors.red)
        mon.setCursorPos(x,y)
        mon.write(str)
        mon.setBackgroundColor(colors.black)
        mon.setCursorPos(1,1)
    end
end

function MonitorMainMenu()
    mon.clear()

    drawButton(2,1,"Earth",colors.brown,colors.white)
    drawButton(2,3,"Nether",colors.red,colors.white)
    drawButton(2,5,"End",colors.yellow,colors.gray)
    drawButton(2,7,"Abydos",colors.yellow,colors.gray)
    drawButton(2,9,"Chulak",colors.green,colors.white)

    drawButton(10,1,"Tenebrae",colors.gray,colors.white)
    drawButton(10,3,"Lantea",colors.lightBlue,colors.white)

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

    if(FastMode == false) then
        drawButton(1,11,"FAST",colors.red,colors.white)
    else
        drawButton(1,11,"FAST",colors.green,colors.white)
    end

    drawButton(19,1,Custom1Name,Custom1Color,Custom1TextCol)
    drawButton(19,3,Custom2Name,Custom2Color,Custom2TextCol)
    drawButton(19,5,Custom3Name,Custom3Color,Custom3TextCol)
    drawButton(19,7,Custom4Name,Custom4Color,Custom4TextCol)
    drawButton(19,9,Custom5Name,Custom5Color,Custom5TextCol)
end

if(mon == nil) then
    mon = peripheral.find("monitor")
    MonMenu = 1

    if(mon == nil) then
        print("No monitor detected. Only commands will be available.")
    else
        FastMode = false
        mon.clear()
        MonitorMainMenu()
    end
end

while true do
    os.sleep(0.05)
    local event, side, x, y = os.pullEvent("monitor_touch")
    MonitorMainMenu()
    mon.setCursorPos(1,1)
    mon.write(x..","..y)

    if(x >= 2 and x <= 6 and y == 1) then
        pressButton(2,1,"Earth",colors.orange,colors.brown,colors.white)
    elseif(x >= 2 and x <= 7 and y == 3) then
        pressButton(2,3,"Nether",colors.orange,colors.red,colors.white)
    elseif(x >= 2 and x <= 4 and y == 5) then
        pressButton(2,5,"End",colors.orange,colors.yellow,colors.gray)
    elseif(x >= 2 and x <= 7 and y == 7) then
        pressButton(2,7,"Abydos",colors.orange,colors.yellow,colors.gray)
    elseif(x >= 2 and x <= 7 and y == 9) then
        pressButton(2,9,"Chulak",colors.orange,colors.green,colors.white)
    elseif(x >= 10 and x <= 17 and y == 1) then
        pressButton(10,1,"Tenebrae",colors.orange,colors.gray,colors.white)
    elseif(x >= 10 and x <= 15 and y == 3) then
        pressButton(10,3,"Lantea",colors.orange,colors.lightBlue,colors.white)
    end


    if(x == 6 and y == Row1Y) then
        pressButton(6,Row1Y,"1",colors.orange,colors.blue,colors.white)
    elseif(x == 8 and y == Row1Y) then
        pressButton(8,Row1Y,"2",colors.orange,colors.blue,colors.white)
    elseif(x == 10 and y == Row1Y) then
        pressButton(10,Row1Y,"3",colors.orange,colors.blue,colors.white)
    elseif(x == 12 and y == Row1Y) then
        pressButton(12,Row1Y,"4",colors.orange,colors.blue,colors.white)
    elseif(x == 14 and y == Row1Y) then
        pressButton(14,Row1Y,"5",colors.orange,colors.blue,colors.white)
    elseif(x == 16 and y == Row1Y) then
        pressButton(16,Row1Y,"6",colors.orange,colors.blue,colors.white)
    elseif(x == 18 and y == Row1Y) then
        pressButton(18,Row1Y,"7",colors.orange,colors.blue,colors.white)
    elseif(x == 20 and y == Row1Y) then
        pressButton(20,Row1Y,"8",colors.orange,colors.blue,colors.white)
    elseif(x == 22 and y == Row1Y) then
        pressButton(22,Row1Y,"9",colors.orange,colors.blue,colors.white)
    elseif(x >= 24 and x <= 25  and y == Row1Y) then
        pressButton(24,Row1Y,"10",colors.orange,colors.blue,colors.white)
    end

    if(x >= 1 and x <= 2 and y == Row2Y) then
        pressButton(1,Row2Y,"11",colors.orange,colors.blue,colors.white)
    elseif(x >= 4 and x <= 5 and y == Row2Y) then
        pressButton(4,Row2Y,"12",colors.orange,colors.blue,colors.white)
    elseif(x >= 7 and x <= 8 and y == Row2Y) then
        pressButton(7,Row2Y,"13",colors.orange,colors.blue,colors.white)
    elseif(x >= 10 and x <= 11 and y == Row2Y) then
        pressButton(10,Row2Y,"14",colors.orange,colors.blue,colors.white)
    elseif(x >= 13 and x <= 14 and y == Row2Y) then
        pressButton(13,Row2Y,"15",colors.orange,colors.blue,colors.white)
    elseif(x >= 16 and x <= 17 and y == Row2Y) then
        pressButton(16,Row2Y,"16",colors.orange,colors.blue,colors.white)
    elseif(x >= 19 and x <= 20 and y == Row2Y) then
        pressButton(19,Row2Y,"17",colors.orange,colors.blue,colors.white)
    elseif(x >= 22 and x <= 23 and y == Row2Y) then
        pressButton(22,Row2Y,"18",colors.orange,colors.blue,colors.white)
    elseif(x >= 25 and x <= 26 and y == Row2Y) then
        pressButton(25,Row2Y,"19",colors.orange,colors.blue,colors.white)
    elseif(x >= 28 and x <= 29 and y == Row2Y) then
        pressButton(28,Row2Y,"20",colors.orange,colors.blue,colors.white)
    end

    if(x >= 1 and x <= 2 and y == Row3Y) then
        pressButton(1,Row3Y,"21",colors.orange,colors.blue,colors.white)
    elseif(x >= 4 and x <= 5 and y == Row3Y) then
        pressButton(4,Row3Y,"22",colors.orange,colors.blue,colors.white)
    elseif(x >= 7 and x <= 8 and y == Row3Y) then
        pressButton(7,Row3Y,"23",colors.orange,colors.blue,colors.white)
    elseif(x >= 10 and x <= 11 and y == Row3Y) then
        pressButton(10,Row3Y,"24",colors.orange,colors.blue,colors.white)
    elseif(x >= 13 and x <= 14 and y == Row3Y) then
        pressButton(13,Row3Y,"25",colors.orange,colors.blue,colors.white)
    elseif(x >= 16 and x <= 17 and y == Row3Y) then
        pressButton(16,Row3Y,"26",colors.orange,colors.blue,colors.white)
    elseif(x >= 19 and x <= 20 and y == Row3Y) then
        pressButton(19,Row3Y,"27",colors.orange,colors.blue,colors.white)
    elseif(x >= 22 and x <= 23 and y == Row3Y) then
        pressButton(22,Row3Y,"28",colors.orange,colors.blue,colors.white)
    elseif(x >= 25 and x <= 26 and y == Row3Y) then
        pressButton(25,Row3Y,"29",colors.orange,colors.blue,colors.white)
    elseif(x >= 28 and x <= 29 and y == Row3Y) then
        pressButton(28,Row3Y,"30",colors.orange,colors.blue,colors.white)
    end

    if(x >= 4 and x <= 5 and y == Row4Y) then
        pressButton(4,Row4Y,"31",colors.orange,colors.blue,colors.white)
    elseif(x >= 7 and x <= 8 and y == Row4Y) then
        pressButton(7,Row4Y,"32",colors.orange,colors.blue,colors.white)
    elseif(x >= 10 and x <= 11 and y == Row4Y) then
        pressButton(10,Row4Y,"33",colors.orange,colors.blue,colors.white)
    elseif(x >= 13 and x <= 14 and y == Row4Y) then
        pressButton(13,Row4Y,"34",colors.orange,colors.blue,colors.white)
    elseif(x >= 16 and x <= 17 and y == Row4Y) then
        pressButton(16,Row4Y,"35",colors.orange,colors.blue,colors.white)
    elseif(x >= 19 and x <= 20 and y == Row4Y) then
        pressButton(19,Row4Y,"36",colors.orange,colors.blue,colors.white)
    elseif(x >= 22 and x <= 23 and y == Row4Y) then
        pressButton(22,Row4Y,"37",colors.orange,colors.blue,colors.white)
    elseif(x >= 25 and x <= 26 and y == Row4Y) then
        pressButton(25,Row4Y,"38",colors.orange,colors.blue,colors.white)
    elseif(x >= 13 and x <= 16 and y == Row4Y+2) then
        pressButton(13,Row4Y+2,"DIAL",colors.orange,colors.blue,colors.white)
    end

    if(x >= 1 and x <= 4 and y == 11) then
        pressToggleButton(1,11,"FAST",not FastMode)

        FastMode = not FastMode
    end

    if(x >= 19 and x <= 19+#Custom1Name and y == 1) then
        pressButton(19,1,Custom1Name,colors.orange,Custom1Color,Custom1TextCol)
    elseif(x >= 19 and x <= 19+#Custom2Name and y == 3) then
        pressButton(19,3,Custom2Name,colors.orange,Custom2Color,Custom2TextCol)
    elseif(x >= 19 and x <= 19+#Custom3Name and y == 5) then
        pressButton(19,5,Custom3Name,colors.orange,Custom3Color,Custom3TextCol)
    elseif(x >= 19 and x <= 19+#Custom4Name and y == 7) then
        pressButton(19,7,Custom4Name,colors.orange,Custom4Color,Custom4TextCol)
    elseif(x >= 19 and x <= 19+#Custom5Name and y == 9) then
        pressButton(19,9,Custom5Name,colors.orange,Custom5Color,Custom5TextCol)
    end
end