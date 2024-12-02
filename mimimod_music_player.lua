if(Maestros == nil) then
    Maestros = {peripheral.find("mimi:mechanicalmaestro")}

    if(#Maestros ~= 6) then
        print("You need 6 Mechanical Maestros! Only "..#Maestros.." were found.")
    else
        Ma1 = Maestros[1]
        Ma2 = Maestros[2]
        Ma3 = Maestros[3]
        Ma4 = Maestros[4]
        Ma5 = Maestros[5]
        Ma6 = Maestros[6]

        print("Mechanical Maestros Found")
    end
end

if(Chests == nil) then
    Chests = {peripheral.find("minecraft:chest")}
    print(#Chests.." Chests found")

    for k,v in pairs(Chests) do
        local s1 = v.getItemDetail(1)
        if(s1 ~= nil and s1.name == "minecraft:paper") then
            
        end
    end
end