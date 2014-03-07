"" autosession.vim
"" 
"" Automatically dump/restore sessions based on the working directory where
"" you start up. Super primitive.
" Maintainer: Geoff Gerrietts
" Version: 0.1
"
" Installation:
" Place in ~/.vim/plugin/autosession.vim
"
" License:
" Copyright (c) Geoff Gerrietts.  Distributed under the same terms as Vim itself.
" See :help license
"
" Usage:
" This is so drop-dead simple. When you install the plugin it will try to load
" a session out of the directory from which you launch Vim. When you exit, it
" will save a session to that file.

if exists("g:loaded_autosession") || &cp || v:version < 700
    finish
endif
let g:loaded_autosession = 1

"" This is a simple plugin that will look in cwd or the vim dir to find 
"" session files. It will source them when vim starts a new window, or 
"" write them when it closes.
let s:localfilename = ".session.vim"
let s:sessiondir = expand("~/.vim/")
let g:autosession_session_name = ""
let g:autosession_prefer_global = 0

"" function to determine correct session name {{{1
" first try to find a .session.vim file in the current directory.
" next try to find a <dirname>.session.vim file in the ~.vim directory.
" if all fails then register .session.vim as the session
function! autosession#get_session_name ()
    let localfile = fnamemodify(s:localfilename, ":p")
    let dirname = fnamemodify(getcwd(), ':p:h:t')
    let globalfile = s:sessiondir . dirname . s:localfilename
    if filewritable(localfile)
        return localfile
    elseif filewritable(globalfile)
        return globalfile
    elseif g:autosession_prefer_global
        return globalfile
    else
        return localfile
    endif
endfunction
"" }}}


"" function to load a named session {{{1
function! autosession#load_session (sess)
    let g:autosession_session_name = a:sess
    if filereadable(a:sess)
        execute 'silent source ' . g:autosession_session_name
    endif
endfunction
"" }}}

"" function tou dump the active session {{{1
function! autosession#dump_session ()
    execute 'silent mksession! ' . g:autosession_session_name
endfunction

"" }}}


"" 'main' function {{{1
" run determiner, register session, load session on new window
function! autosession#set_up_session (...)
    if a:0 == 1
        call autosession#load_session(a:1)
    else
        call autosession#load_session(autosession#get_session_name())
    endif

    "" register autocommand to save session on exit
    augroup autosessiongroup
        autocmd!
        autocmd! VimLeavePre * call autosession#dump_session()
    augroup END
endfunction
"" }}}

command! -nargs=? Autosession call autosession#set_up_session(<f-args>)
