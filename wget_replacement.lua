--i never finished this because i found out you can just dragdrop files into the computer... so it probably doesnt work

local function filewrite(url,filename)
    local httpget = http.get(url)
    local content = httpget.readAll()

    local file = fs.open(filename,"w")
    file.write(content)
    file.close()
end

function wgetnew(url,filename,overwrite)
    if(overwrite == false) then
        if(fs.exists(filename)) then -- For using this file on its own
            print("File "..filename.." Already exists, do you want to overwrite? y/n")
            local msg = read()

            if(read == "y" or read == "Y") then
                fs.delete(filename)
                filewrite(url,filename)
            elseif(read == "n" or read == "N") then
                os.reboot()
            else
                print("You must enter a Y or a N")
            end
        else
            filewrite(url,filename)
        end
    else -- For using this as a function somewhere else, no printy
        if(fs.exists(filename)) then
            fs.delete(filename)
        end

        filewrite(url,filename)
    end
end

while true do
    print("Write a url and a file name")
    local msg = read()
end