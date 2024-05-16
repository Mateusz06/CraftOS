local function fileExists(path)
    return fs.exists(path) and not fs.isDir(path)
end

local scriptPath = "chest_monitor.lua"

if fileExists(scriptPath) then
    shell.run(scriptPath)
    print("Chest monitor started successfully.")
else
    print("Error: chest_monitor.lua not found at the specified path:", scriptPath)
    print("Please ensure the file exists and the path is correct.")
end