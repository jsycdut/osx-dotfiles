"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" _   __ (_)____ ___          _____ ____   ____   / __/(_)____ _
"| | / // // __ `__ \ ______ / ___// __ \ / __ \ / /_ / // __ `/
"| |/ // // / / / / //_____// /__ / /_/ // / / // __// // /_/ /
"|___//_//_/ /_/ /_/        \___/ \____//_/ /_//_/  /_/ \__, /
"                                                      /____/
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: jsy<jsycdut@gmail.com>
"
" Github: https://github.com/jsycdut
"
" Description: jsy个人vim配置文件，由于内容过多，所以分散到各个文件中进行分别管理
"

" Load all configs.
" the order of glob function's result can not be guaranteed
" if you want it return the result with specific order, simply add order to
" your config file's name, eg. 01.base.vim
for i in split(glob('~/.config/nvim/rc/*.vim'), '\n')
  execute 'source' i
endfor
