local lfs = require "lfs"
local LOS = {}
function LOS.IsDir(name)
        if type(name)~="string" then return false end
        local cd = lfs.currentdir()
        local is = lfs.chdir(name) and true or false
        lfs.chdir(cd)
        return is
end
function LOS.CurrentPath()
        local str = debug.getinfo(2, "S").source:sub(2)
        return str:match("(.*/)")
end

function LOS.MakeDirectory(dirname)
        local Folder = os.execute("mkdir " .. dirname)
end

function LOS.Find(Table, Value)
        for index,data in pairs(Table) do 
                if data == Value then 
                        return index
                end
        end
        return nil 
end

return LOS