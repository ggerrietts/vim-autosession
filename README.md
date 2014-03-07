# autosession.vim

Automatically load and/or dump session files.

## Installation

Easiest installation is to use Vundle or similar. I absolutely recommend
high-level plugin management.

That said, you can copy `plugin/autosession.vim` to `~/.vim/plugin` and everything 
should work fine.

Once installed, a command `:Autosession` becomes available.

`:Autosession` is intended to be used in a `.gvimrc` or `.vimrc`. It will look
for `.session.vim` in the current directory. If the local session file does not 
exist, it will look for `~/.vim/<directory>.session.vim`. If it finds a session
file, it will try to load the session it finds. Then when vim exits, it will
save the session. If no session file was found, it will save the session to the
initial working directory.

`:Autosession <session-file>` can be used to declare the name of a session file
for the current window. If `<session-file>` exists, it will be sourced.


## Why Bother

This isn't a sophisticated plugin, as is probably evident. It could stand a lot
of polish. But none of the other session-management plugins available seemed to 
do exactly what I wanted, which was a very low-effort restoration of my working
state between editing sessions, but tracked separately for separate projects or
repositories. Maybe I didn't look hard enough, because this seems pretty simple.

This plugin could stand a lot of improvement, but it fills my immediate need. I
am interested in where it falls short for other people!






