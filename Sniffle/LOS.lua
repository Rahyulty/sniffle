local LOS = {}

function LOS.CurrentPath()
        local str = debug.getinfo(2, "S").source:sub(2)
        return str:match("(.*/)")
end

function LOS:MakeDirectory(dirname)
    os.execute("mkdir " .. dirname)
end



return LOS