# yuphelp.nvim 

## About 
`yuphelp.nvim` is a dead-simple Lua plugin for neovim that allows for you help files to be opened in a [floating window](https://neovim.io/doc/user/api.html#api-floatwin) rather than the default behavior of a seperate buffer in a split window. 

## Installation
Using `Vim-Plug`:
```lua
Plug "Ben-Kincaid/yuphelp.nvim"
```

Using `packer`:
```lua
use "Ben-Kincaid/yuphelp.nvim"
```
## Setup
You must setup `yuphelp` in a lua file or a [lua heredoc](https://neovim.io/doc/user/lua.html).

```lua
-- Setup currently does not take any options
require("yuphelp").setup()
```
You are also free to use the provided `lookup` method to programatically open the floating help window for a given term:

```lua
local yuphelp = require("yuphelp")

-- `lookup` takes a term that you would like open the helpfile for
yuphelp.lookup("nvim_create_buf")
```

## Usage
Execute the `:YupHelp` command - You will be prompted to enter a help term. Confirmation will open the helpfile in a new `help` buffer in a floating window. 
