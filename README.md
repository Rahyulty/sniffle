# sniffle 
A beginner friendly way to start Databases with lua


- Version 0.0.2
- Status = Unfinished

## Update Log
- ***Added Request Async which can be used to make a request to the module to insert data to a specifc database***

- Added SniffleHelper, which allows for annotations on everything sniffle does for clarity.
- Added a TreeManager that will be in the workspace by default so that we may update our client's tree table in the module itself 

- Fixed MAJOR data loss bug + Cleaned up sniffle helper

# Main
- Basic Functions
    - [Setup](#Setup)
    - [Data Implementation Methods](#Implementation)




# **Setup**

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

The function...
```
SniffleBase.CreateDataTree()
```

not only initializes your directory, but it also serves as a backup in case your directory goes missing or the folder is unintentionally erased. If this occurs, it will recreate the folder (but will not completely restore all deleted or missing data) so that our code does not break.

You will also see a file names tree manager being created 

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

# Implementation 

Sniffle allows you to incorporate data in a variety of ways. The first method is to manually insert it into the file, and the second is to use the sniffle module.


Manually you have to be careful when implementing. Since its a string and sniffle handles tables we use '[]' insetad of '{}' 

A good example of manual implemenetation would be something like this 

Say we are structuring our login information. Since Sniffle uses tables then we will use a table with tables inside of it to store user data.

Say our format is this 

```lua
{
    {"Foo","FooPassword",10000001},
    {"Foo2","FooPassword2",10000002}
}
```

if we were to manual implemenet this into a txt file we would write it as this.
```
[["Foo","FooPassword",10000001],["Foo2","FooPassword2",10000002]]
```

This is very sensitive so it is better than we use the sniffle module so we can get 100% (or 99.9% lol) accuracy all the time

```SniffleBase:RequestAsync```

This makes a request to the module to implement data that can be blocked or failed due to traffic (Most likely will not happen) or errors.

Arguments
- Under - What is it data tree is under (dir name)
 
 - Name - DatabaseName 

 - Value - what we are inserting in 

 
