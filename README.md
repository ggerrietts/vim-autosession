# autosession.vim

Automatically load and/or dump session files.

## Installation

Easiest installation is to use Vundle or similar. I absolutely recommend
high-level plugin management.

That said, you can copy `plugin/autosession.vim` to `~/.vim/plugin` and everything 
should work fine.

## What It Does

When you start a vim session, it tries to load a session file. It first tries
to load `.session.vim` from the working directory. If that fails, it tries to
load `~/.vim/<directory>.session.vim`. In this case `<directory>` is the name of
the current working directory (but not including its path.) If this second
session file is not found, it assumes there is no session to load. 

When you exit the vim session, it stores session data to the session file. If 
no session file was found at load time, it writes `.session.vim` in the initial
working directory.

## Why Bother

This isn't a sophisticated plugin, as is probably evident. It could stand a lot
of polish. But none of the other session-management plugins available seemed to 
do exactly what I wanted, which was a very low-effort restoration of my working
state between editing sessions, but tracked separately for separate projects or
repositories. Maybe I didn't look hard enough, because this seems pretty simple.

This plugin could stand a lot of improvement, but it fills my immediate need. I
am interested in where it falls short for other people!






