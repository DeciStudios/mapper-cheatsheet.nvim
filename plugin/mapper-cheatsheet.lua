local cheatsheet = require('mapper-cheatsheet')
vim.api.nvim_create_user_command('DeciCheatsheet', function()
    cheatsheet.show_cheatsheet()
end, {})
