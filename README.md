# sniffle 
A beginner friendly way to start Databases with lua


- Version 0.0.4
- Status = Unfinished

## Update Log
- ***Added Request Async which can be used to make a request to the module to insert data to a specifc database***

- Added Request Async + ID Creation
- Bugs Fixed

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

You may use Sniffle to integrate data in a variety of ways. Manually inserting it into the file is the first option, and using the sniffle module is the second.


When implementing manually, you must be cautious. We use '[]' instead of "{}" since it's a string and sniffle handles tables.

Something like this would be a nice example of manual implementation.

Let's pretend we're organizing our login information. We'll use a table with tables inside of it to store user info because Sniffle utilizes tables.

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

This is really sensitive, therefore it's preferable to using the sniffle module, which guarantees 100 percent (or 99.9%, lol) correctness all of the time.

```SniffleBase:RequestAsync```

This instructs the module to implement data that may be blocked or failed as a result of traffic (which is unlikely to occur) or faults.

Arguments
- Under - What is it data tree is under (dir name)
 
 - Name - DatabaseName 

 - Value - what we are inserting in 

 
```lua
SniffleBase:RequestAsync("Tree", "LoginInfo", {"coolfoo","foocool"})
```

Any erros yielded by ```RequestAsync``` will break anything but will insetad ignore the request (Activating SniffleHelper will allow you to see what the error is)

when you got to your text file you should see the argument #3 inserted into your table!

# Comprehension 
 - Coming Soon

# Extras

something common in most databases are ID that are strings or numbers. Sniffle Allows you to easily create those from a certain length. 

```lua
print(SniffleBase.CreateID("String",50))

--[[
OutPut 

HBVMedXMsqHjqsockOTtwLrQbRzULxwAdCHVchHinkcBvByFEc
]]
```
