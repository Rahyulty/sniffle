local sniffle = { _version = 1 }
local json = require("Modules.JSON")
local luaFileSystem = require("lfs")

local CURRENT_DIR = luaFileSystem.currentdir()

local function directoryExist(name)
    assert(type(name) == "string", "internal error found, arg #1 of isDirectory is not a string")
    return luaFileSystem.chdir(name) and true or false
end

local function fileExist(filePath)
    assert(type(filePath) == "string", "internal error found, arg #1 of isFile is not a string")
    local attributes = luaFileSystem.attributes(filePath)
    return attributes and attributes.mode == "file"
end

local function createDirectory(name)
    luaFileSystem.mkdir(CURRENT_DIR .. "/" .. name)
end

local function hasInitialized()
    local dataDir = CURRENT_DIR .. "/Data"
    local baseDir = dataDir .. "/Base"
    local configFile = dataDir .. "/luaconfig.JSON"
    local dataFile = baseDir .. "/Data.JSON"

    return fileExist(configFile) and directoryExist(baseDir) and fileExist(dataFile)
end

function sniffle:initialize(initData, callback)
    if not directoryExist("Data") then
        createDirectory("Data")
        createDirectory("Data/Base")
        
        local configDefault = {
            script_lock = false,
            workspace = CURRENT_DIR
        }

        local dataPassed = initData or {}

        local configFile = io.open("Data/luaconfig.JSON", "w")
        configFile:write(json.encode(configDefault))
        configFile:close()

        local dataFile = io.open("Data/Base/Data.JSON", "w")
        dataFile:write(json.encode(dataPassed))
        dataFile:close()
    
    else
        print("Already Created")   
    end

    if hasInitialized() then
        -- do something
    end
end

function sniffle:Set(key, data)
    if hasInitialized() then
        local configFile = io.open(CURRENT_DIR .. "/Data/luaconfig.JSON", "r")
        local DataFile = io.open(CURRENT_DIR .. "/Data/Base/Data.JSON", "w")
        -- write something to DataFile
        DataFile:close()
    end
end

function sniffle:updateSettings(array)
    assert(type(array) == "table", "arg # 1 of settingsConfigure must be a table'")
    local defaultSettings = {
        script_lock = false,
        workspace = CURRENT_DIR
    }

    if hasInitialized() then
        for key, value in pairs(array) do
            if defaultSettings[key] ~= nil then
                defaultSettings[key] = array[key]
            end
        end

        local configFile = io.open(CURRENT_DIR .. "/Data/luaconfig.JSON", "w")
        configFile:write(json.encode(defaultSettings))
        configFile:close()
    else
        error("Settings not initialized")
    end
end

return sniffle
