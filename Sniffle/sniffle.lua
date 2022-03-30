JSON = require "sniffle.JSON"
local Sniffle = {}



-- Creates a new database with a given name.
function Sniffle:Create(DataBaseName)
-- Creating the file
   local file, err = io.open("/workspace/sniffle/Tree/"..DataBaseName, "wb")
      if err then  return  err end
      local EmptyTable = JSON.encode({})
      file:write(EmptyTable)
      file:close()
end


function  Sniffle:Make()
   
end


return Sniffle