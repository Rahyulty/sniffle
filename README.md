# sniffle

A beginner friendly way to start Databases with lua


- Basic Functions
    - [Setup](##Setup)
    - 




## **Setup**

To start working with sniffle

```bash
git clone https://github.com/Rahyulty/sniffle
```

Update sniffle

```bash
git fetch https://github.com/Rahyulty/sniffle
```

LFS

```bash
luarocks install luafilesystem
```
When we first start working with sniffle, we must establish a data tree in which we will store all of our data. You may do this manually, but for safety checks, it is recommended that you utilize the ```SniffleBase.CreateDataTree``` method.



```lua
SniffleBase = require "Modules.sniffle"
local lfs = require "lfs"

-- You can do this (will put it in your workspace by default)...
SniffleBase.CreateDataTree("Tree")

-- You can use the lfs for something more constant
SniffleBase.CreateDataTree("Tree", lfs.currentdir())

-- or you can customize for a specific directory

local Path = "/workspace/foo/foo2/foo3"

SniffleBase.CreateDataTree("Tree", Path)
```

<<<<<<< HEAD
The function...
```
SniffleBase.CreateDataTree()
```
=======
Or if you are calling it from a folder in the workspace it will give the directory of where the folder is, so it is recommended when making a folder the file your calling it from is in the workspace

If you call the the make directory function and the file exist it will return an error ( This will be fixed in later updates as we plan on using make directory as a safety function incase your folder gets deleted for whatever reason)



>>>>>>> 123f9aee1085a019dcdf83e0175de8b9f816b054

not only initializes your directory, but it also serves as a backup in case your directory goes missing or the folder is unintentionally erased. If this occurs, it will recreate the folder (but will not completely restore all deleted or missing data) so that our code does not break.

Then we'll use the ```SniffleBase:CreateDataBase()``` method to construct a database. CreateDatabase is a strict function, so read on carefully.

Because finding dir paths in lua is difficult, and we recognize that your tree may not be immediately in the workspace, CreateBase accepts three arguments.
- DataBaseName
- Under ( What your tree is called)
- PathOfUnder (Path of your tree : Optional arg)

The first two arguments are required, while the third argument is optional. If the last argument is left empty(or nil), Sniffle will assume your tree is in the workspace.

```lua
-- Sniffle assumes your tree is in workspace 
SniffleBase:CreateDataBase("LoginInfo", "Tree")
-- Created the LoginInfo.Txt Fle in the "Tree"

local PathToTree = "/workspace/foo/foo2/"
-- Note always end it with / or sniffle will yield and error

-- Sniffle identifys that you have provided a path and will create the file in the dir given
SniffleBase:CreateDataBase("LoginInfo", "Tree",PathToTree)
```



