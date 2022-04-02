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

When working with sniffle we have to make a tree folder where we can put all of our data. You can do this manually or do this via the sniffle LEOS module

### LEOS : Lua Extended OS


```lua
LEOS = require "sniffle.Modules.LEOS"

-- Can do  
LEOS:MakeDirectory("Tree")
-- But..
-- This is recomended
LEOS:MakeDirectory(LEOS.CurrentPath().."Tree")
-- You can customize the path to your liking but its recomended to make a variable ex.
local TreePath = /workspace/sniffle/

LEOS:MakeDirectory(TreePath.."Tree")
```

it is also noted than when you do call the function 

```lua
LEOS.CurrentPath()
```

It gives the path where the file your calling it from, So if you call it from main.lua and main.lua is just a file in your workspace it will return 

```bash
/workspace/sniffle/
```

Or if you are calling it from a folder in the workspace it will give the directory of where the folder is, so it is recommended when making a folder the file your calling it from is in the workspace

If you call the the make directory function and the file exist it will return an error ( This will be fixed in later updates as we plan on using make directory as a safety function incase your folder gets deleted for whatever reason)







