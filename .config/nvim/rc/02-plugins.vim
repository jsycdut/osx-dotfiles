"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" vim插件配置 使用 vim-plug作为插件管理器
" 查看https://github.com/junegunn/vim-plug进行安装
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/plugged')
" First of all, I must say there are so many great plugin developers in
" the open source world, like tpope, juneguun and others, it's you make
" my vim journey so fantastic, thx. I hope that I will be one as good as
" you guys, hope it will not take too long.

" ¶ make neovim ide like
Plug 'neoclide/coc.nvim', {'branch': 'release'} " language server client

Plug 'junegunn/fzf', { 'do': './install --bin' } " fuzzy file searching

Plug 'junegunn/fzf.vim' " fuzzy file searching

Plug 'tpope/vim-surround' " surround content with quotes or something, another plugin by tpope

Plug 'tpope/vim-projectionist' " for unit test file switching

Plug 'tpope/vim-dispatch' " Asynchronous build and test dispatcher

Plug 'junegunn/vim-easy-align' "for align

Plug 'rking/ag.vim'  "The vim front for silver searcher

Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }

Plug 'mhinz/vim-startify' " fancy start screen for vim

Plug 'jiangmiao/auto-pairs' " auto pairs, for better pairs edit experience, this is amazing

Plug 'alvan/vim-closetag' " close tags for me

Plug 'lervag/vimtex',{ 'for': 'tex' } " for tex file and it's align

Plug 'dense-analysis/ale', { 'for': ['shell'] }

Plug 'MattesGroeger/vim-bookmarks'

Plug 'justinmk/vim-sneak' "The missing motion for Vim, by justinmk, neovim maintainer

Plug 'Chiel92/vim-autoformat' " 自动代码格式化插件

" ¶ git itegration
Plug 'tpope/vim-fugitive' " git plugin for vim, by tpope

Plug 'airblade/vim-gitgutter' "side bar for git changes

Plug 'rbong/vim-flog' "view git log graphicly

" ¶ beautify neovim
Plug 'junegunn/goyo.vim' "goyo  centerlize your vitextm

Plug 'ryanoasis/vim-devicons'    "icons for plugins

Plug 'preservim/nerdtree' " file browsing manager in vim

Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "NERDTree文件类型语法高亮

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

Plug 'morhetz/gruvbox' " my favorite color scheme

Plug 'majutsushi/tagbar' " tagbar, for files cannot be processed by language server

Plug 'itchyny/lightline.vim' " status bar, like vim airline, i like its simpilicity

" ¶ misc 
Plug 'wlemuel/vim-tldr' "TL;DR vim client

Plug 'kevinhwang91/rnvimr', {'do': 'make sync'} "Fancy ranger plugin in vim

Plug 'christoomey/vim-tmux-navigator' " navigate vim windows and tmux panes with same shortcut

call plug#end()
