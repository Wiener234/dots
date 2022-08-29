-- [[ keys.lua ]
local map = vim.api.nvim_set_keymap

-- remap the key used to leave insert mode
map('i', 'jk', '<Esc>', {})

-- remap the key used to leace visual mode
map('v', 'jk', '<Esc>', {})

-- Toggle nvim-tree
map('n', 'n', [[:NvimTreeToggle<CR>]], {})

-- open terminal horizontal
map('n', 'm', [[:below 10sp term://bash<CR>]], {})

-- move between windows
map('n', 'ö', '<C-w>', {})

-- exit terminal insert mode
map('t', 'jk', [[<C-\><C-n>]], {})

-- Toggle Colorizer
map('n', 'ä', [[:ColorizerToggle<CR>]], {})

-- add ToDo
map('n', 'ta', [[:ToDoTxtCapture<CR>]], {})

-- Toggle ToDo
map('n', 'ts', [[:ToDoTxtTasksToggle<CR>]], {})

-- Bufferline next
map('n', '<S-l>', [[:BufferLineCycleNext<CR>]], {noremap=true, silent=true})

-- Bufferline prev
map('n', '<S-h>', [[:BufferLineCyclePrev<CR>]], {noremap=true, silent=true})

