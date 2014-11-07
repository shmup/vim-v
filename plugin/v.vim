" v.vim - a vim plugin wrapper for https://github.com/rupa/v
" Maintainer:   Jared Miller <http://cantcode.com/>

if exists("g:v_loaded")
    finish
endif

let g:v_loaded = 1

let v_exists = executable('v')

command! V call V()

function! V()
    let oldmore = &more
    try
        let lines = split(system('v'), '\n')
        set nomore
        for line in lines
            echo line
        endfor
        let option = input('> ')
        if option > len(lines)
            return
        endif
        echo lines[-option] 
        execute 'edit' split(lines[-option])[1]
    finally
        let &more=oldmore
    endtry
endfunction
