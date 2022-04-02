local LOS = {}

function Exist(file)
    local Sucess, error, code = os.rename(file, file)
    if not Sucess then 
        if code == 13 then 
            print("Code 13")
            return true 
        end
    end
    return Sucess, error
    
end

function IsDir(path)
    print(path)
    return Exist(path.."/")
end
function LOS.CurrentPath()
        local str = debug.getinfo(2, "S").source:sub(2)
        return str:match("(.*/)")
end

function LOS:MakeDirectory(dirname)

        local Folder = os.execute("mkdir " .. dirname)

end

function LOS.IsDir(path)
   return  IsDir(path)
end



return LOS