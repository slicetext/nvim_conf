:set nocompatible
:set autoindent
:set cursorline
:set incsearch
:set ignorecase
:set smartcase
:set showmatch
:set hlsearch
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set number
:set termguicolors
:set autochdir
:set noshowmode
:try | :cd %:h | catch | :cd ~ | endtry
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
:set relativenumber
call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'farmergreg/vim-lastplace'
"Plug 'scrooloose/nerdtree'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'vim-scripts/indentpython.vim'
Plug 'alvan/vim-closetag'
Plug 'luochen1990/rainbow'
Plug 'lilydjwg/colorizer'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.3' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/tokyonight.nvim'
Plug 'edluffy/hologram.nvim'
Plug 'romgrk/barbar.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-calc'
Plug 'f3fora/cmp-spell'
Plug 'tamago324/cmp-zsh'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'vim-scripts/autoclose'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
""Plug 'nvimdev/dashboard-nvim'
""Plug 'glepnir/dashboard-nvim'
Plug 'startup-nvim/startup.nvim'
Plug 'tanvirtin/vgit.nvim'
Plug 'instant-markdown/vim-instant-markdown'
Plug 'neovim/nvim-lspconfig'
""Plug 'rcarriga/nvim-notify'
Plug 'folke/trouble.nvim'
Plug 'terrortylor/nvim-comment'
call plug#end()

autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()

nnoremap <C-k> <cmd>NvimTreeToggle<cr>
nnoremap <C-o> <cmd>Telescope find_files hidden=true<cr>
colorscheme tokyonight
:set shortmess+=A
:set mouse+=iv
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-w> <Cmd>BufferClose<CR>

function! GitRepo()
	let branch=system("git rev-parse --abbrev-ref HEAD")
	:if len(branch)<10
		return branch
	:endif
	return ""
endfunction
let g:nvim_tree_auto_open = 1
function! UpdateTree()
	NvimTreeOpen
	wincmd w
endfunction
autocmd BufNewFile,BufReadPost * call UpdateTree() 
autocmd BufNewFile,BufReadPost * Trouble
autocmd BufNewFile,BufReadPost * let g:indentLine_enabled=1
""autocmd BufNewFile,BufReadPost * wincmd w
let g:indentLine_enabled=0
function! StatuslineMode() abort

    let l:currentmode={
        \ 'n':  'Normal',
        \ 'v':  'Visual',
        \ 'V':  'Visual_L',
        \ '^V': 'Visual_B',
        \ 's':  'S',
        \ 'S':  'SL',
        \ '^S': 'SB',
        \ 'i':  'Insert',
        \ 'R':  'R',
        \ 'c':  'Command',
        \ 't':  'Terminal'}

    let l:modecurrent = mode()
    " use get() -> fails safely, since ^V doesn't seem to register
    " 3rd arg is used when return of mode() == 0, which is case with ^V
    " thus, ^V fails -> returns 0 -> replaced with 'VB'
    let l:modelist = toupper(get(l:currentmode, l:modecurrent, 'VB'))
    let l:current_status_mode = l:modelist
    return l:current_status_mode
endfunction
let g:gitbranchcmd = "git branch --show-current 2>/dev/null | tr -d '\n'"
:set laststatus=2
:set statusline=
:set statusline+=%#TabLineSel#
:set statusline+=%{system(g:gitbranchcmd)}
:set statusline+=%#DiffText#\ 
:set statusline+=%f\ %#PmenuSel#%y%#DiffText#\ %m\ %r
:set statusline+=%=
:set statusline+=%{StatuslineMode()}\ 
:set statusline+=%#TabLineSel# 
:set statusline+=Line\ %l\ Column\ %v
:set statusline+=\ (%p%%)\ 

nnoremap <C-q> <cmd>TroubleToggle<cr>

"source $HOME/.config/nvim/plug-config/auto-cmp.lua"
lua <<EOF
require'nvim-tree'.setup {
	view = {
		side = 'left',
		width = 15
	}
}

require("nvim_comment").setup({line_mapping = "<C-_>",comment_empty_trim_whitespace = false})


local cmp = require'cmp'
local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close
      },
    },
  }
}

require("startup").setup({theme="dashboard"})

require("lspconfig").csharp_ls.setup{
	on_attach=on_attach
}
--require('winbar').setup({
--	enabled=true,
--	show_file_path = true,
--    show_symbols = true,
--    icons = {
--        file_icon_default = '',
--        seperator = '>',
--        editor_state = '●',
--        lock_icon = '',
--    },

--    exclude_filetype = {
--        'help',
--        'startify',
--        'dashboard',
--        'packer',
--        'neogitstatus',
--        'NvimTree',
--        'Trouble',
--        'alpha',
--        'lir',
--        'Outline',
--        'spectre_panel',
--        'toggleterm',
--        'qf',
--    }})

require('vgit').setup({
	keymaps={
		['n <C-g>'] = function() require('vgit').buffer_diff_preview() end
	},
	hls = {
      GitBackground = 'Normal',
      GitHeader = 'NormalFloat',
      GitFooter = 'NormalFloat',
      GitBorder = 'LineNr',
      GitLineNr = 'LineNr',
      GitComment = 'Comment',
      GitSignsAdd = {
        gui = nil,
        fg = '#d7ffaf',
        bg = nil,
        sp = nil,
        override = false,
      },
      GitSignsChange = {
        gui = nil,
        fg = '#7AA6DA',
        bg = nil,
        sp = nil,
        override = false,
      },
      GitSignsDelete = {
        gui = nil,
        fg = '#e95678',
        bg = nil,
        sp = nil,
        override = false,
      },
      GitSignsAddLn = 'DiffAdd',
      GitSignsDeleteLn = 'DiffDelete',
      GitWordAdd = {
        gui = nil,
        fg = nil,
        bg = '#5d7a22',
        sp = nil,
        override = false,
      },
      GitWordDelete = {
        gui = nil,
        fg = nil,
        bg = '#960f3d',
        sp = nil,
        override = false,
      },
    }
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      --{ name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
       { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })
  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = { 'pylsp', 'lua_ls', 'csharp_ls','html','cssls','tsserver','vimls','jedi_language_server' },
})


  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')[''].setup {
    capabilities = capabilities
  }

require('trouble').setup()

local opts={noremap=true,silent=true}
vim.api.nvim_set_keymap('v', '<TAB>', '<S->>gv', opts)
vim.api.nvim_set_keymap('v', '<S-TAB>', '<S-<>gv', opts)

EOF


