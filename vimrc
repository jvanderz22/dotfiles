execute pathogen#infect()

execute pathogen#helptags()

set tabstop=2
set shiftwidth=2
set viminfo='20,<1000
set expandtab
set number
set autoindent
set smartindent
set hlsearch
set nowrap
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
colorscheme ron
syntax on

imap <C-Return> <CR><CR><C-o>k<Tab>
filetype plugin indent on

let g:pymode_rope_completion = 0
let g:CommandTMaxFiles=20000
let g:CommandTFileScanner="git"

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

nnoremap Q <nop>
