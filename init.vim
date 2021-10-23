set relativenumber
set number
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set splitbelow
set splitright
set hidden
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hls
set nrformats=octal
set nowrap
set scrolloff=10
set colorcolumn=80
set inccommand=nosplit
set foldmethod=manual
set updatetime=100
set mouse=a

let mapleader=" "
nnoremap <SPACE> <Nop>

nnoremap <leader><leader> :silent!nohls<CR>
nnoremap j gj
nnoremap k gk
nnoremap G Gzz
nnoremap n nzz
nnoremap N Nzz
nnoremap <C-p> "+p
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>W :wq<CR>
nnoremap <C-q> :tabclose<CR>
nnoremap <C-f> :NERDTreeToggle<CR>
nnoremap <Leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fm <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <leader>fc <cmd>lua require('telescope.builtin').git_commits()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>

" go snippets
nnoremap <leader>e iif err != nil {<CR>}<esc>v%=o

nnoremap <silent> <leader>t :sp <CR><bar> :term <CR><bar> :resize 20<CR>
nnoremap <silent> <leader>r :res 12<CR>

" format JSON files (jq needs to be installed)
nnoremap <leader>jf :%!jq .<cr>
nnoremap <leader>z zf%
nnoremap <leader>o zo

nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gdt <cmd>tab split \| lua vim.lsp.buf.definition()<CR>
nnoremap <leader>i <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>d <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>n <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>p <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>

nnoremap <leader>ut :UndotreeToggle<CR>

nnoremap <leader>gt :GoCoverageToggle<CR>
nnoremap <leader>gat :GoAddTags<CR>

nnoremap <leader>glh :GitGutterLineHighlightsToggle<CR>
map <leader>gj <Plug>(GitGutterNextHunk)
map <leader>gk <Plug>(GitGutterPrevHunk)
nnoremap <leader>gf <cmd>tab split \| :Glog -- %<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>ga :G add<CR>
nnoremap <leader>gc :G commit<CR>
nnoremap <leader>gp :G -c push.default=current push<CR>
nnoremap <leader>gh :diffget //2<CR>
nnoremap <leader>gl :diffget //3<CR>

vnoremap <C-y> "+y
"Base 64 encoding/decoding might only work like this on a mac
vnoremap <silent> <leader>be c<c-r>=system('base64', @")<cr><esc>kJ
vnoremap <silent> <leader>bd c<c-r>=system('base64 --decode', @")<cr><esc>

" space-esc to exit out of terminal
tnoremap <leader><esc> <C-\><C-n>

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'mbbill/undotree'

Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'

Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'ray-x/lsp_signature.nvim'

Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

Plug 'yggdroot/indentline'

" Track the engine.
" Plug 'SirVer/ultisnips'

" Plug 'puremourning/vimspector' debugger not needed yet

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'pprovost/vim-ps1'

call plug#end()

" activate different indent behavious by filetypes
filetype plugin indent on

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set completeopt=menuone,noinsert,noselect

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

colorscheme gruvbox
highlight Normal ctermbg=none guibg=none
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1

let g:go_fmt_command = "goimports"
let g:rainbow_active = 1
let g:rainbow_conf = {'separately': {'nerdtree': 0}}

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setConceal = 2
let g:indentLine_concealcursor=""

" open vertical git diff split in new tab
au User FugitiveIndex nmap <buffer> dt :Gtabedit <Plug><cfile><Bar>Gvdiffsplit<CR>

" trim whitespaces on save
fun! TrimWhitespace()
    "Don't trim in markdown files
    if &ft =~ 'markdown'
        return
    endif

    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup FUNKY
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

"presentation stuff BEGIN
autocmd BufNewFile,BufRead *.vpm call SetVimPresentationMode()
function SetVimPresentationMode()
    nnoremap <silent> <buffer> <Right> :n<CR>
    nnoremap <silent> <buffer> <Left> :N<CR>
endfunction
nmap <silent> <F5> :set colorcolumn=138 laststatus=0 relativenumber! number! showmode! showcmd! hidden! ruler!<CR><bar> :AirlineToggle<CR><bar> :IndentLinesToggle<CR>
"presentation stuff END

" telescope setup funcion
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        color_devicons = true,

        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-i>"] = actions.file_split,
                ["<C-s>"] = actions.file_vsplit,
                ["<C-q>"] = actions.send_to_qflist,
            },
        }
    },
    extenstions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
EOF

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body)

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      --['<C-o>'] = cmp.mapping.complete(),
      ['<Left>'] = cmp.mapping.abort(),
      ['<C-c>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
  },
    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'path' },
      { name = 'buffer', keyword_length = 5 },
    }
  })

  local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }, _config or {})
  end

  -- go lsp setting
  require "lsp_signature".setup({
    hi_parameter = "IncSearch", --TODO find better highlight scheme
  })  -- Note: add in lsp client on-attach
  require'lspconfig'.gopls.setup(config({
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
    require "lsp_signature".on_attach()  -- Note: add in lsp client on-attach
}))
  require'lspconfig'.yamlls.setup(config())
  require'lspconfig'.pylsp.setup(config())
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  ignore_install = { "gdscript", "teal", "godotResource" }, -- buggy
  highlight = {
    enable = true,
    disable = { "c", "rust" },
    additional_vim_regex_highlighting = false,
  },
}
EOF
