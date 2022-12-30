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

## Usage
Execute the `:YupHelp` command - You will be prompted to enter a help term. Confirmation will open the helpfile in a new `help` buffer in a floating window. 
