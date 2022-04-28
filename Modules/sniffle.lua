local Sniffle = { _version = "0.0.2"}
JSON = require "Modules.JSON"
local lfs = require "lfs"


local IsDir = function(name)
   if type(name)~="string" then return false end
   local cd = lfs.currentdir()
   local is = lfs.chdir(name) and true or false
   lfs.chdir(cd)
   return is   
end

function isFile(name)
   if type(name)~="string" then return false end
   if not IsDir(name) then
       return os.rename(name,name) and true or false
       -- note that the short evaluation is to
       -- return false instead of a possible nil
   end
   return false
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




local SniffleSay = print
local Annotations = false

local function SniffleHelper(value)
   if Annotations == true then 
   SniffleSay(value)
   else return end 
end

Trees = {}

local GetPath = function(str,sep)
   sep=sep or'/'
   return str:match("(.*"..sep..")")
end

function Sniffle.EnableSniffleHelper(val)
   if val then
      assert(type(val) == "boolean", "Arg #1 needs to be boolean instead got "..type(val))
      Annotations = val
      if val == true then 
         print("Enabled SniffleHelper")
      end
   end 
end

function Sniffle.CreateDataTree(TreeName, Path)
   if IsDir(TreeName) == false then 
      if  Path == nil then 
         warn("Path not found creating Directory in workspace")
         MakeDirectory(TreeName)
         File = io.open(lfs.currentdir().."/".."TreeManager", "w")
         table.insert( Trees, #Trees + 1 ,TreeName)
         local StringTable = JSON.encode(Trees)
         File:write(StringTable)
         File:close()
      elseif Path ~= nil then 
         assert(type(Path) == "string", " Your path needs to be a string")
         MakeDirectory(Path.."/"..TreeName)
         File = io.open(lfs.currentdir().."/".."TreeManager", "w")
         table.insert( Trees, #Trees + 1 ,TreeName)
         local StringTable = JSON.encode(Trees)
         File:write(StringTable)
         File:close()
       end


      else
         local File = io.open(lfs.currentdir().."/".."TreeManager",'r')
         local String = File:read('*all')
         local TableRaw = JSON.decode(String)
         Trees = TableRaw
         SniffleSay("[Sniffle Helper] The file "..TreeName.." has already been created already exist, no changes have been made")
   end
end


function Sniffle:CreateDataBase(DataBaseName, Under, PathofUnder)
   print(isFile(lfs.currentdir().."/"..Under.."/"..DataBaseName))
  if PathofUnder == nil then
   if isFile(lfs.currentdir().."/"..Under.."/"..DataBaseName) == false then 
      if Find(Trees, Under) then 
         if IsDir(Under) == true then 
               File = io.open(lfs.currentdir().."/"..Under.."/"..DataBaseName, "w")
               File:write(JSON.encode({}))
               File:close()      
            end
         else
            self:CreateDataTree(Under)
            SniffleSay("Directory does not exist one has been created for you in your "..lfs.currentdir())
  end
 end
   else
      if isFile(PathofUnder..DataBaseName) == false then 
         if Find(Trees, Under) then 
            if IsDir(Under) == true then 
                  File = io.open(PathofUnder..DataBaseName, "w")
                  File:write(JSON.encode({}))
                  File:close()      
               end
            else
               self:CreateDataTree(Under)
               SniffleSay("Directory does not exist one has been created for you in your "..lfs.currentdir())
            end
         end
      end
end



function Sniffle:RequestAsync(Under ,Name, value)
   if Name and value then 
      assert(type(Under) == "string", "Arg #1 should be a string insetad got "..type(Under))
      assert(type(Name) == "string", "Arg #2 should be a string insetad got "..type(Name))
         if IsDir(Under) == true then
            local File = io.open(lfs.currentdir().."/"..Under.."/"..Name, 'r')
               if File then 
                     local RawStringContent = File:read('*all')
                     local CookedTable = JSON.decode(RawStringContent)
                        if type(CookedTable) == "table" then 
                           if value then 
                              table.insert(CookedTable, #CookedTable + 1, value)
                              File:close()
                              local CookedString = JSON.encode(CookedTable)
                              local File2 = io.open(lfs.currentdir().."/"..Under.."/"..Name, 'w')
                              File2:write(CookedString)
                              File2:close()
                              SniffleSay("Request Succeded")
                           end
                        else
                           SniffleSay("REQUEST FAILED : Sniffle has not found a table inside of the file no changes has been made")
                        end
                  end
               end
            end
         end 
return Sniffle

