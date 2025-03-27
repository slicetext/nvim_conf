local dap=require("dap")
local dapui=require("dapui")
local masondap=require("mason-nvim-dap")
dapui.setup({})
masondap.setup({
    ensure_installed={"python","cppdbg"},
    handlers={},
    automatic_installation=true;
})

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end

vim.fn.sign_define('DapBreakpoint',{text='',numhl='',texthl='red',linehl=''})

require("nvim-dap-virtual-text").setup({})
