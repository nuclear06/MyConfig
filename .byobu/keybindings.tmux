unbind-key -n C-a
set -g prefix ^A
set -g prefix2 F12
bind a send-prefix




# tmux-screen-keys.conf
#
# By Nicholas Marriott. Public domain.
# Updated by Dustin Kirkland.
#
# This configuration file binds many of the common GNU screen key bindings to
# appropriate tmux key bindings. Note that for some key bindings there is no
# tmux analogue and also that this set omits binding some commands available in
# tmux but not in screen.
#
# Note this is only a selection of key bindings and they are in addition to the
# normal tmux key bindings. This is intended as an example not as to be used
# as-is.

# Set the prefix to ^A.
unbind C-b
set -g prefix ^A
bind a send-prefix

# Bind appropriate commands similar to screen.
# lockscreen ^X x
# unbind ^X
# bind ^X lock-server
# unbind x
# bind x lock-server

# screen ^C c
unbind ^C
bind ^C new-window -c "#{pane_current_path}"
unbind c
bind c new-window -c "#{pane_current_path}"

# detach ^D d
unbind ^D
bind ^D detach

# displays *
unbind *
bind * list-clients

# next ^@ ^N sp n
unbind ^@
bind ^@ next-window
unbind ^N
bind ^N next-window
unbind " "
bind " " next-window
unbind n
bind n next-window

# title A
unbind A
bind A command-prompt "rename-window %%"

# other ^A
unbind ^A
# bind ^A last-window

# prev ^H ^P p ^?
# unbind ^H
# bind ^H previous-window
# unbind ^P
# bind ^P previous-window
# unbind p
# bind p previous-window
# unbind BSpace
# bind BSpace previous-window

# windows ^W w
unbind ^W
bind ^W list-windows
unbind w
bind w list-windows

# quit \ 
# unbind '\' 
# bind '\' confirm-before "kill-server"

# kill K k
# unbind K
# bind K confirm-before "kill-window"
# unbind k
# bind k confirm-before "kill-window"


# redisplay ^L l
# unbind ^L
# bind ^L refresh-client
# unbind l
# bind l refresh-client

# split -v |
unbind |
bind | split-window -c "#{pane_current_path}"

# :kB: focus up
unbind Tab
bind Tab select-pane -t:.+
unbind BTab
bind BTab select-pane -t:.-

# " windowlist -b
unbind '"'
bind '"' choose-window

# K: select DOWN plane
unbind K
bind K display-panes \; select-pane -D
unbind k
bind k display-panes \; select-pane -D

# J: select UP plane
unbind J
bind J display-panes \; select-pane -U
unbind j
bind j display-panes \; select-pane -U

# H: select LEFT window
unbind H
bind H display-panes \; select-pane -L
unbind h
bind h display-panes \; select-pane -L

# L: select RIGHT window
unbind L
bind L display-panes \; select-pane -R
unbind l
bind l display-panes \; select-pane -R

# U: select previous window
unbind U
bind U previous-window
unbind u
bind u previous-window

# I: select next window
unbind I
bind I next-window
unbind i
bind i next-window

# kill pane ^X x
unbind X
bind x kill-pane
unbind x
bind x kill-pane

# kill window '\'  
unbind '\' 
bind '\' confirm-before "kill-window"
unbind '\' 
bind '\' confirm-before "kill-window"

# |: splite -h
unbind '|'
bind '|' display-panes \; split-window -h -c "#{pane_current_path}"

# -: splite -h
unbind '-'
bind '-' display-panes \; split-window -v -c "#{pane_current_path}"
