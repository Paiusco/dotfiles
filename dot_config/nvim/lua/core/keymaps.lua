vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- Clear highlights on search when pressing <Esc> in normal mode

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Keybinds to make split navigation easier.
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- save file
vim.keymap.set('n', '<C-s>', ':w <CR>', { desc = "save file" })

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = "Next buffer" })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = "Previous buffer" })

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = "Scroll down and center" })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = "Scroll up and center" })

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', { desc = "Find next and center" })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Find previous and center" })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { desc = "Indent back and stay in visual mode" })
vim.keymap.set('v', '>', '>gv', { desc = "Indent forward and stay in visual mode" })

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', { desc = "Paste but doesn't overwrite register" })
