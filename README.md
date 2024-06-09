### Sniffle Lua Library

Sniffle is a Lua library designed to provide convenient file system management functionalities and configuration handling. It simplifies tasks related to directory creation, file manipulation, and configuration management in Lua scripts.

#### Features

- **Directory Management**: Easily create directories and check for their existence.
- **File Operations**: Check if files exist, create new files, and manipulate file contents.
- **Configuration Handling**: Manage configuration files in JSON format, allowing easy retrieval and modification of settings.
- **Initialization**: Initialize the Sniffle environment, ensuring the required directory structure and configuration files are in place.

#### Usage

1. **Initialization**:
   ```lua
   local sniffle = require("sniffle")

   -- Initialize Sniffle environment with optional initial data
   sniffle:initialize({ initialData = {} })
   ```

2. **Directory Management**:
   ```lua
   -- Check if a directory exists
   local exists = sniffle.directoryExist("Data")

   -- Create a new directory
   sniffle.createDirectory("NewDirectory")
   ```

3. **File Operations**:
   ```lua
   -- Check if a file exists
   local exists = sniffle.fileExist("file.txt")

   -- Write data to a file
   sniffle.Set("key", "value")
   ```

4. **Configuration Handling**:
   ```lua
   -- Update settings in the configuration file
   sniffle.updateSettings({ script_lock = true })
   ```

#### Examples

1. **Create a New Directory**:
   ```lua
   sniffle.createDirectory("NewDirectory")
   ```

2. **Check if a File Exists**:
   ```lua
   local exists = sniffle.fileExist("file.txt")
   ```

3. **Update Configuration Settings**:
   ```lua
   sniffle.updateSettings({ script_lock = true })
   ```

#### Notes

- Ensure proper error handling for file and directory operations.
- JSON library (`Modules.JSON`) is required for configuration handling.

#### Compatibility

Sniffle is compatible with Lua environments supporting the `lfs` library for file system operations.

#### Version Information

- **Sniffle Version**: 1.0
- **JSON Library Version**: 1.0

#### License

Sniffle is distributed under the MIT License. See the `LICENSE` file for details.

#### Authors

- Raehan Ramlal (@Rahyulty)

For more information and updates, visit the [official repository](https://github.com/Rahyulty/sniffle).