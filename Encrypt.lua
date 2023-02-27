function Encrypt(content)
    local encryptedContent = {}
    local encryptedString = ""

    local mainTask = coroutine.create(function()
        for x in content:gmatch("%a") do
            table.insert(encryptedContent, (string.byte(x) * string.len(content) * 2))
        end
    end)

    local result = coroutine.resume(mainTask)

    if result == true then
        for _, v in pairs(encryptedContent) do
            encryptedString = encryptedString .. tostring(v)
        end
    end

    return encryptedString
end
