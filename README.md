# mapper-cheatsheet.nvim - A Keybinding Cheatsheet for mapper.nvim

A simple floating window cheatsheet that displays your mapper.nvim keybindings. Made as an extension for mapper.nvim to help you remember your mappings!

⚠️ **Warning**: This is a work in progress. Requires mapper.nvim to function properly.

## Installation

### Lazy.nvim
```lua
{
    'DeciStudios/mapper-cheatsheet.nvim',
    dependencies = {
        'DeciStudios/mapper.nvim'
    },
}
```

### Packer.nvim
```lua
use {
    'DeciStudios/mapper-cheatsheet.nvim',
    requires = {'DeciStudios/mapper.nvim'},
}
```

### Vim-Plug
```vim
Plug 'DeciStudios/mapper.nvim'
Plug 'DeciStudios/mapper-cheatsheet.nvim'
```

## Usage

After installing, use `:MapperCheatsheet` to open the keybinding cheatsheet window. You can:
- View all your mapper.nvim keybindings organized by category and mode
- Press 'q' or 'Esc' to close the window
- Scroll through the list using normal Vim movements

If you want to open the cheatsheet in lua, use
```lua
require('mapper-cheatsheet').show_cheatsheet()
```

## Configuration

No configuration is needed, mapper.nvim automatically detects it and applies the keybinds.

## Why?

mapper.nvim is great for setting up keybindings, but sometimes you need a quick reference to remember what you set up. This plugin provides an easy way to view all your mappings in one place.

## Known Issues

- Formatting might look odd with very long keybindings or descriptions
- Window size calculations might not be perfect on all terminal sizes
- Probably other issues I haven't found yet

Feel free to contribute improvements if you'd like!

## License

MIT
