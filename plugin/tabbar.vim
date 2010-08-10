scriptencoding "utf-8"

" Name:        tabbar.vim (Global Plugin)
" Author:      Ciaran McCreesh <ciaranm@gentoo.org>
" Version:     20050403
" Description: Mozilla-style tabs for gvim. This is just a proof of concept
"              for now. Needs gvim7, won't work with some GUI options (GTK+-2
"              is fine). Your existing toolbar, if present, gets nuked, since
"              we can only specify one toolbar menu in vim currently.

if v:version < 700 || ! has("gui_running")
    finish
endif

" Allow modified buffers to become unfocused. Otherwise we couldn't
" switch away from the active tab without saving first.
set hidden

" Enable the toolbar.
if &guioptions !~# 'T'
    set guioptions+=T
    " Nasty hack to get around window resize bug
    autocmd VimEnter * set lines+=1 | set lines-=1
endif
set toolbar=text

" Nuke the existing toolbar, and create our own skeleton
aunmenu ToolBar.
amenu icon="" ToolBar.New :enew<CR>
amenu icon="" ToolBar.-1- :<CR>

" For keeping track of buttons we've created
let s:buttons = []

" Take a buffer name and turn it into a (possibly) shorter tab
" name
fun! <SID>Shorten(bufname)
    let l:bufname = a:bufname
    if len(l:bufname) < 15
        " short enough already
        return l:bufname
    else
        " try just the filename
        let l:bufname = fnamemodify(l:bufname, ":t")
        if len(l:bufname) < 15
            return "…" . l:bufname
        else
            return "…" . strpart(a:bufname, 0, 15) . "…"
        endif
    endif
endfun

" Make a tab name from a buffer number.
fun! <SID>MakeName(bufnumber)
    " Buffer name...
    let l:bufname = bufname(a:bufnumber)
    if l:bufname == ""
        let l:bufname = "(unnamed)"
    end
    let l:bufname = <SID>Shorten(l:bufname)
    let l:bufname = substitute(l:bufname, '[^a-zA-Z0-9\-\_]', '\\&', 'g')

    " Prefix for active window
    let l:bufprefix = []
    if bufnr("%") == a:bufnumber
        let l:bufprefix += ["*"]
    endif
    if len(l:bufprefix) > 0
        let l:bufprefix += [""]
    endif

    " Suffixes for read only and modified
    let l:bufsuffix = []
    if getbufvar(a:bufnumber, "&modified")
        let l:bufsuffix += ["+"]
    endif
    if getbufvar(a:bufnumber, "&readonly")
        let l:bufsuffix += ["RO"]
    endif
    if len(l:bufsuffix) > 0
        let l:bufsuffix = [""] + l:bufsuffix
    endif

    " Stick it all together
    return join(l:bufprefix, "\\ ") . a:bufnumber . ":\\ " .
                \ l:bufname . join(l:bufsuffix, "\\ ")
endfun

" Add and record a new tab
fun! <SID>AddTabEntry(bufnumber)
    let l:name = <SID>MakeName(a:bufnumber)
    exec 'amenu icon="" ToolBar.' . l:name
                \ . ' :buffer ' . a:bufnumber . '<CR>'
    exec 'amenu icon="" ToolBar.-t' . a:bufnumber . '- <nothing>'
    let s:buttons += [l:name, '-t' . a:bufnumber . '-']
endfun

" Clean out existing tab bar, add in new tabs
fun! <SID>UpdateTabBar()
    for l:bufname in s:buttons
        exec 'aunmenu ToolBar.' . l:bufname
    endfor
    let s:buttons = []

    for l:bufnumber in range(1, bufnr("$"))
        if buflisted(l:bufnumber)
            call <SID>AddTabEntry(l:bufnumber)
        endif
    endfor
endfun

" We need to update the tabbar whenever any of these happen...
augroup TabBar
    au!
    autocmd BufAdd,BufWinEnter,WinEnter,BufUnload,BufHidden,BufDelete *
                \ call <SID>UpdateTabBar()
    autocmd CursorHold *
                \ call <SID>UpdateTabBar()
augroup END

call <SID>UpdateTabBar()

" vim: set sw=4 sts=4 et : "
