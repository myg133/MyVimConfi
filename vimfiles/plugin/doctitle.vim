" 添加源码文件头注释
" 根据不同文件类型添加不同的头注释文件
" 进行版权声明的设置
" 添加或更新头
map <C-F4> :call TitleDet()<CR>
function AddTitle()
    call append(0,"# -*- Coding:utf-8 -*-")
    call append(1,"#=============================================================================")
    call append(2,"#")
    call append(3,"# Author: Michael.Y.Ma - myg133@qq.com")
    call append(4,"#")
    call append(5,"# QQ : 176214241")
    call append(6,"#")
    call append(7,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(8,"#")
    call append(9,"# Filename: ".expand("%:t"))
    call append(10,"#")
    call append(11,"# Description: ")
    call append(12,"#")
    call append(13,"#=============================================================================")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endfunction
"更新最近修改时间和文件名
function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
"判断前10行代码里面，是否有Last modified这个单词，
"如果没有的话，代表没有添加过作者信息，需要新添加；
"如果有的话，那么只需要更新即可
function TitleDet()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction 
