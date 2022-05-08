local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local long_heading = {
[[      ___           ___           ___           ___                       ___      ]],
[[     /\__\         /\  \         /\  \         /\__\          ___        /\__\     ]],
[[    /::|  |       /::\  \       /::\  \       /:/  /         /\  \      /::|  |    ]],
[[   /:|:|  |      /:/\:\  \     /:/\:\  \     /:/  /          \:\  \    /:|:|  |    ]],
[[  /:/|:|  |__   /::\~\:\  \   /:/  \:\  \   /:/__/  ___      /::\__\  /:/|:|__|__  ]],
[[ /:/ |:| /\__\ /:/\:\ \:\__\ /:/__/ \:\__\  |:|  | /\__\  __/:/\/__/ /:/ |::::\__\ ]],
[[ \/__|:|/:/  / \:\~\:\ \/__/ \:\  \ /:/  /  |:|  |/:/  / /\/:/  /    \/__/~~/:/  / ]],
[[     |:/:/  /   \:\ \:\__\    \:\  /:/  /   |:|__/:/  /  \::/__/           /:/  /  ]],
[[     |::/  /     \:\ \/__/     \:\/:/  /     \::::/__/    \:\__\          /:/  /   ]],
[[     /:/  /       \:\__\        \::/  /       ~~~~         \/__/         /:/  /    ]],
[[     \/__/         \/__/         \/__/                                   \/__/     ]],
}

local short_heading = {
[[  _  _ ___ _____   _____ __  __  ]],
[[ | \| | __/ _ \ \ / /_ _|  \/  | ]],
[[ | .` | _| (_) \ V / | || |\/| | ]],
[[ |_|\_|___\___/ \_/ |___|_|  |_| ]],
[[                                 ]],
}

if vim.o.columns > 85 then
    dashboard.section.header.val = long_heading
else
    dashboard.section.header.val = short_heading
end

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file"        , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file"       , ":Telescope find_files<CR>"),
    dashboard.button( "o", "  > Open project"    , ":Telescope projects<CR>"),
    -- dashboard.button( "r", "  > Recent"       , ":Telescope oldfiles<CR>"),
    dashboard.button( "i", "  > Inbox"           , ":edit ~/Dropbox/org/inbox.org<CR>"),
    dashboard.button( "t", "  > Todo"            , ":edit ~/Dropbox/org/todo.org<CR>"),
    -- dashboard.button( "s", "  > Settings"     , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button( "s", "  > Settings"        , ":e $MYVIMRC | :cd %:p:h<CR>"),
    dashboard.button( "u", "  > Update packages" , ":PackerSync<CR>"),
    dashboard.button( "q", "  > Quit NVIM"       , ":qa<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
