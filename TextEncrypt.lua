local encrypt = require("Encrypt")

local function AskForString()
    io.write("> Content : ")
    local content = io.read()
    
    content = Encrypt(content)
    print(content)
end

local mainTask = coroutine.create(AskForString)
local result = coroutine.resume(mainTask)

if result == false then
    print("> Error trying to run code")
end