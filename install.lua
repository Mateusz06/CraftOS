local scriptURL = 'https://raw.githubusercontent.com/Mateusz06/CraftOS/main/chest_monitor.lua'
local fileName = 'chest_monitor.lua'

local function downloadFile(url, path)
    local response = http.get(url)
    if response then
        local file = fs.open(path, 'w')
        file.write(response.readAll())
        file.close()
        response.close()
        print('Downloaded and saved to ' .. path)
    else
        print('Failed to download ' .. url)
    end
end

local function createAndRunStartupScript()
    local startupScript = [[
        local function fileExists(path)
            return fs.exists(path) and not fs.isDir(path)
        end

    local scriptPath = "]] .. fileName .. [["

    if fileExists(scriptPath) then
        shell.run(scriptPath)
        print("Chest monitor started successfully.")
    else
        print("Error: chest_monitor.lua not found at the specified path:", scriptPath)
        print("Please ensure the file exists and the path is correct.")
    end
]]

    local file = fs.open('startup.lua', 'w')
    file.write(startupScript)
    file.close()

    print('startup.lua created and configured.')

    shell.run('startup.lua')
end

downloadFile(scriptURL, fileName)

createAndRunStartupScript()