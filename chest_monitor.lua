local monitor = peripheral.find("monitor")
local chest = peripheral.find("minecraft:chest")

local function stripPrefix(itemName)
    return itemName:match(":(.+)") or itemName
end

local function toTitleCase(itemName)
    local titleCased = itemName:gsub("_", " "):gsub("(%a)(%w*)", function(first, rest)
        return first:upper() .. rest:lower()
    end)
    return titleCased
end

local function getCleanName(itemName)
    local strippedName = stripPrefix(itemName)
    return toTitleCase(strippedName)
end

local function displayChestContents()
    local items = chest.list()
    monitor.clear()
    local monitorWidth, monitorHeight = monitor.getSize()
    local textHeight = #items * 3

    local verticalOffset = math.floor((monitorHeight - textHeight) / 2)
    local line = verticalOffset + 1

    for slot, item in pairs(items) do
        local cleanName = getCleanName(item.name)
        local textLength = #cleanName
        local posX = math.floor((monitorWidth - textLength) / 2) + 1

        monitor.setCursorPos(posX, line)
        monitor.write(cleanName)

        local countText = item.count .. "x"
        local countLength = #countText
        local countPosX = math.floor((monitorWidth - countLength) / 2) + 1
        monitor.setCursorPos(countPosX, line + 1)
        monitor.setTextColor(colors.gray)
        monitor.write(countText)
        monitor.setTextColor(colors.white)
        line = line + 3
    end
end

while true do
    displayChestContents()
    os.sleep(5)
end