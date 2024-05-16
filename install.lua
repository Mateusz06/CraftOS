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

downloadFile(scriptURL, fileName)