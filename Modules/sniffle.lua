local Sniffle = { _version = "0.0.1"}
JSON = require "Modules.JSON"
local lfs = require "lfs"

local IsDir = function(name)
   if type(name)~="string" then return false end
   local cd = lfs.currentdir()
   local is = lfs.chdir(name) and true or false
   lfs.chdir(cd)
   return is   
end

local Find = function (Table, Value)
   for index,data in pairs(Table) do 
      if data == Value then 
              return index
      end
end
return nil 
end

local MakeDirectory = function (dirname)
   local Folder = os.execute("mkdir " .. dirname)
end




local Say = print

Trees = {}

local GetPath = function(str,sep)
   sep=sep or'/'
   return str:match("(.*"..sep..")")
end

function Sniffle.CreateDataTree(TreeName, Path)
   if IsDir(TreeName) == false then 
      if  Path == nil then 
         Say("Dir not found creating Directory")
         print(lfs.currentdir())
         MakeDirectory(TreeName)
      elseif Path ~= nil then 
         assert(type(Path) == "string", " Your path needs to be a string")
         MakeDirectory(Path.."/"..TreeName)
         table.insert( Trees, #Trees + 1 ,TreeName)

       end

      else
         table.insert( Trees, #Trees + 1 ,TreeName)
         print("[~001~]The file "..TreeName.." has already been created, CreateTree has not been run ")
   end
end


function Sniffle:CreateDataBase(DataBaseName, Under, PathofUnder)
   if Find(Trees, Under) then 
      if IsDir(Under) == true then 
         if PathofUnder == nil then 
            -- We Assume in workspace
            File = io.open(lfs.currentdir().."/"..Under.."/"..DataBaseName, "w")
            File:write(JSON.encode({}))
            File:close()           
         else
            File = io.open(PathofUnder..DataBaseName, "w")
            File:write(JSON.encode({}))
            File:close()      
         end
      else
         self:CreateDataTree(Under)
         warn("Directory does not exist one has been created for you in your "..lfs.currentdir())
      end
   end
end



return Sniffle

