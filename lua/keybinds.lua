local wk = require("which-key")
--general
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { silent = true, desc = "Move Selection down a line" })
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', { silent = true, desc = "Move Selection up a line" })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true })
vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })
vim.keymap.set('x', '<leader>p', '\"_dP', { silent = true })
vim.keymap.set('n', 'j', 'gj', { silent = true })
vim.keymap.set('n', 'k', 'gk', { silent = true })
--toggle capslock/escape
vim.keymap.set('x', '<leader>ce', "!xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape")
vim.keymap.set('x', '<leader>co', "!xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock")
local Snacks = require("snacks")
vim.keymap.set('n', '<leader>k', function()
    Snacks.explorer.open();
end, { desc = "Open Explorer" })
--telescope
vim.keymap.set('n', '<leader>fo', function()
    Snacks.picker.smart();
end, { desc = "Find Files" })
vim.keymap.set('n', '<leader>ff', function()
    Snacks.picker.grep();
end, { desc = "Live Grep" })
vim.keymap.set('n', '<leader>fb', function()
    Snacks.picker.buffers();
end, { desc = "Switch Buffers" })
vim.keymap.set('n', '<f5>', '<cmd>RunCode<cr>')
--lsp
vim.keymap.set('n', '<leader>ln', vim.lsp.buf.hover, { desc = "Open Docs" })
vim.keymap.set('n', '<leader>lm', vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, { desc = "Hover Diagnostics" })
--dap
local dap = require('dap')
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, {desc="Toggle Break Point"})
vim.keymap.set('n', '<leader>dc', dap.continue, {desc="Continue"})
vim.keymap.set('n', '<f6>', dap.continue, {})
vim.keymap.set('n', '<f10>', dap.step_over, {})
vim.keymap.set('n', '<f11>', dap.step_into, {})
vim.keymap.set('n', '<f12>', dap.step_out, {})
--trouble
vim.keymap.set('n', '<leader>tn', "<cmd>Trouble diagnostics next auto_jump=true<CR>", {})
vim.keymap.set('n', '<leader>tp', "<cmd>Trouble diagnostics prev auto_jump=true<CR>", {})
-- Menu
-- Keyboard users
vim.keymap.set("n", "<C-t>", function()
  require("menu").open("default")
end, {})

-- mouse users + nvimtree users!
vim.keymap.set({ "n", "v" }, "<RightMouse>", function()
  require('menu.utils').delete_old_menus()

  vim.cmd.exec '"normal! \\<RightMouse>"'

  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "NvimTree" and "nvimtree" or "default"

  require("menu").open(options, { mouse = true })
end, {})
-- git
vim.keymap.set('n', '<leader>Ga', "<cmd>! git add -A<CR>", {desc="Add all"})
vim.keymap.set('n', '<leader>Gc', function()
    vim.ui.input({prompt="Commit Name"},function(input)
        vim.cmd("! git commit -m '"..input.."'")
    end)
end, {desc="Commit"})
vim.keymap.set('n', '<leader>Gp', "<cmd>! git push<CR>", {desc="Push"})
-- Which Key
wk.add({
    {"<leader>G",group="git"},
    {"<leader>d",group="DAP"},
    {"<leader>b",group="buffers"},
    {"<leader>f",group="Picker"},
    {"<leader>l",group="LSP"},
})


-- Switch Buffers
vim.keymap.set('n', '<leader>bp', '<cmd>bprev<CR>', {desc="prev buffer"})
vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', {desc="next buffer"})
vim.keymap.set('n', '<leader>bc', '<cmd>bd<CR>', {desc="close buffer"})
