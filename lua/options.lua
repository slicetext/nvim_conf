--vim.opt.nocompatible=true
vim.opt.autoindent=true
vim.opt.cursorline=true
vim.opt.incsearch=true
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.showmatch=true
vim.opt.tabstop=4
vim.opt.shiftwidth=4
vim.opt.smarttab=true
vim.opt.termguicolors=true
vim.opt.autochdir=true
vim.opt.hlsearch=false
vim.opt.incsearch=true
vim.g.mapleader=" "
vim.opt.expandtab=true
vim.opt.wrap=false
vim.api.nvim_set_hl(0, "SignColumn", { bg = "none"})
vim.opt.clipboard:append("unnamedplus")
vim.opt.cmdheight=0
vim.api.nvim_create_autocmd({"CmdlineEnter"},{
    pattern={},
    command="setlocal cmdheight=1"
})
vim.api.nvim_create_autocmd({"CmdlineLeave"},{
    pattern={},
    command="call timer_start(1, { tid-> execute('setlocal cmdheight=0')})"
})

vim.api.nvim_create_autocmd({"BufEnter","BufWinEnter"},{
	pattern={},
	callback=function()
		if(vim.bo.filetype~="snacks_picker_list")then
			vim.cmd("set number relativenumber")
		end
	end,
})
vim.api.nvim_create_autocmd({"TermOpen"},{
	pattern={},
	callback=function()
		vim.cmd("set nonumber norelativenumber")
	end,
})
vim.api.nvim_create_autocmd({"InsertEnter"},{
	pattern={},
	command="set norelativenumber"
})
vim.api.nvim_create_autocmd({"InsertLeave"},{
	pattern={},
	command="set relativenumber"
})

--vim.opt.shortmess+=A
--vim.opt.mouse+=a
