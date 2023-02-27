local encrypt = require("Encrypt")

local function GetFileContent(path)
    local file = io.open(path, "r")

    if file then
        local content = file:read("a")
        file:close()

        return content
    else
        print("> Error trying to open file")

        return ""
    end
end

local function AskForFile()
    io.write("> File path : ")
    local path = io.read()

    local content = GetFileContent(path)
    
    if content == "" then
        print("> File content not found")
    else
        local encryptedContent = Encrypt(content)

        local file = io.open("build/Result.txt", "w+")
    
        if file then
            print("> Saving file...")
    
            file:write(encryptedContent)
            file:close()
    
            print("\n> File saved")
        else
            print("> Error trying to save file!")
        end
    end
end

local mainTask = coroutine.create(AskForFile)
local result = coroutine.resume(mainTask)

if result == false then
    print("> Error trying to run code")
end