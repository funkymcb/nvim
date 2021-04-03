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
set conceallevel=0

let mapleader=" "
nnoremap <SPACE> <Nop>

nnoremap <esc><esc> :silent!nohls<CR>
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
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>

nnoremap <silent> <leader>t :sp <CR><bar> :term <CR><bar> :resize 12<CR>
nnoremap <silent> <leader>r :res 12<CR>

" format JSON files (jq needs to be installed)
nnoremap <leader>jf :%!jq .<cr>
nnoremap <leader>z zf%
nnoremap <leader>o zo

" resizing works for mac only
" resize with <OPTION-hjkl>
nnoremap º :resize -2<CR>
nnoremap ∆ :resize +2<CR>
nnoremap ª :vertical resize +2<CR>
nnoremap @ :vertical resize -2<CR>

nnoremap <leader>gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gdt <cmd>tab split \| lua vim.lsp.buf.definition()<CR>
nnoremap <leader>i <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>d <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>n <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>p <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>ut :UndotreeToggle<CR>

nnoremap <leader>glh :GitGutterLineHighlightsToggle<CR>
map <leader>gj <Plug>(GitGutterNextHunk)
map <leader>gk <Plug>(GitGutterPrevHunk)
nnoremap <leader>gf <cmd>tab split \| :Glog -- %<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>ga :G add<CR>
nnoremap <leader>gc :G commit<CR>
nnoremap <leader>gp :G push<CR>
nnoremap <leader>gh :diffget //2<CR>
nnoremap <leader>gl :diffget //3<CR>

"  use tab to cycle through completions
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

vnoremap <C-y> "+y
"Base 64 encoding/decoding might only work like this on a mac
vnoremap <silent> <leader>be c<c-r>=system('base64', @")<cr><esc>kJ
vnoremap <silent> <leader>bd c<c-r>=system('base64 --decode', @")<cr><esc>

" ctrl-q to exit out of terminal
tnoremap <C-q> <C-\><C-n>

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
Plug 'nvim-lua/completion-nvim'

" Track the engine.
" Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'

" Plug 'puremourning/vimspector' debugger not yet needed

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'kyazdani42/nvim-web-devicons'

call plug#end()

" activate different indent behavious by filetypes
filetype plugin indent on

" completion in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" Setup lsp for golang (gpls language server has to be installed)
lua require'lspconfig'.gopls.setup{ on_attach=require'completion'.on_attach }

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
let g:aitline#extensions#branch#enabled = 1

let g:go_fmt_command = "goimports"
let g:rainbow_active = 1
let g:rainbow_conf = {'separately': {'nerdtree': 0}}
let g:completion_enable_auto_paren = 1
" let g:completion_enable_snippet = 'UltiSnips'

" open vertical git diff split in new tab
au User FugitiveIndex nmap <buffer> dt :Gtabedit <Plug><cfile><Bar>Gvdiffsplit<CR>

" trim whitespaces on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup FUNKY
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

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

" kubernetes yaml setup
lua << EOF
require'lspconfig'.yamlls.setup{
    on_attach = require'completion'.on_attach,
    settings = {
        yaml = {
            schemas = { kubernetes = "/*.yaml" },
        }
    }
}
EOF
