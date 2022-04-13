JSON = require "Modules.JSON"
LOS = require "Modules.LEOS"
LuaFileSystem = require "lfs"
local Sniffle = {}
local Say = print

Trees = {}

local GetPath = function(str,sep)
   sep=sep or'/'
   return str:match("(.*"..sep..")")
end

function Sniffle.CreateDataTree(TreeName, Path)
   if LOS.IsDir(TreeName) == false then 
      if  Path == nil then 
         Say("Dir not found creating Directory")
         print(LuaFileSystem.currentdir())
         LOS.MakeDirectory(TreeName)
      elseif Path ~= nil then 
         assert(type(Path) == "string", " Your path needs to be a string")
         LOS.MakeDirectory(Path.."/"..TreeName)
         table.insert( Trees, #Trees + 1 ,TreeName)

       end

      else
         table.insert( Trees, #Trees + 1 ,TreeName)
         print("[~001~]The file "..TreeName.." has already been created, CreateTree has not been run ")
   end
end


function Sniffle:CreateDataBase(DataBaseName, Under, PathofUnder)
   if LOS.Find(Trees, Under) then 
      if LOS.IsDir(Under) == true then 
         if PathofUnder == nil then 
            -- We Assume in workspace
            File = io.open(LuaFileSystem.currentdir().."/"..Under.."/"..DataBaseName, "w")
            File:write(JSON.encode({}))
            File:close()           
         else
            File = io.open(PathofUnder..DataBaseName, "w")
            File:write(JSON.encode({}))
            File:close()      
         end
      else
         self:CreateDataTree(Under)
         warn("Directory does not exist one has been created for you in your "..LuaFileSystem.currentdir())
      end
   end
end



return Sniffle