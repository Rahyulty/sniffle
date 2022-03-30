JSON = require "Modules.JSON"
LOS = require "Modules.LOS"
local Sniffle = {}



-- Creates a new database with a given name, you will need the LOS module for this to run properly as LOS manages our paths
function Sniffle:Create(DataBaseName, path)
-- Creating the file
   local file, err = io.open(path..DataBaseName, "wb")
      if err then  return  err end

      local EmptyTable = JSON.encode({})
      file:write(EmptyTable)
      file:close()

   end


function  Sniffle:Make()
   
end


return Sniffle