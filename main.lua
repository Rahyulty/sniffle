SniffleBase = require "Modules.sniffle"
local lfs = require "lfs"
SniffleBase.CreateDataTree("Tree", lfs.currentdir())


SniffleBase:CreateDataBase("LoginInfo", "Tree")
