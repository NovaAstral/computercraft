local reader = peripheral.find("blockReader")

print(reader.getBlockName())
--print(reader.getBlockData())

tbl = reader.getBlockData()

for k,v in pairs(reader.getBlockData()) do
    --print("data: "..tostring(k).." "..tostring(v))

    if(tostring(k) == "Source") then --print create sign reader thing
        for k2,v2 in pairs(v) do
            if(k2 == "Label") then
                print("Label Data: "..v2)
            end
        end
    end
end