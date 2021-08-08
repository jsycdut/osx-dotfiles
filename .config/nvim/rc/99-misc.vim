" colorscheme gruvbox disable cause my default terminal color is gruvbox

au BufNewFile *.java exec ":call AddJavaHeader()"

func AddJavaHeader()
  let l:cwd = getcwd()

  if (l:cwd =~ '^.*/stmt.*/gdm.*$') " path detection for company code
    call append(0,  '/*')
    call append(1,  ' * @(#)'.expand("%").', '.strftime("%Y年%m月%e日 %p%H:%M:%S"))
    call append(2,  ' *')
    call append(3,  ' * Copyright (c) 2018-'.strftime("%Y").', 四川蜀天梦图数据科技有限公司.')
    call append(4,  ' * All rights reserved.')
    call append(5,  ' */')
    call append(6,  'package com.')
    call append(7,  '')
    call append(8,  '/**')
    call append(9,  ' * 在这里加入功能说明')
    call append(10, ' *')
    call append(11, ' * @author Jin Shiyu')
    call append(12, ' * @version 1.0, ' .strftime("%Y年%m月%e日"))
    call append(13, ' */')
    call append(14, 'public class '.expand("%:r").' {')
    call append(15, '')
    call append(16, '}')
  else
    " temporarily blank
  endif

endfunc
