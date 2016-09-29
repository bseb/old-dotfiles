#---------------------------------------------------
#Set the prefix to the right thing, clearly C-a     |
#----------------------------------------------------
unbind C-b
set -g prefix C-a
#-----------------------------------
# force a reload of the config file|
#-----------------------------------
unbind r
bind r source-file ~/.tmux.conf
#--------------------
#Status Bar Settings|
#-------------------
set-option -g status-position top

#--------------------------------------------------
# start window numbering at 1 for easier switching|
#-------------------------------------------------
set -g base-index 1
#--------
# colors|
#--------
set -g default-terminal "screen-256color"
# panes
set -g pane-border-fg colour0
set -g pane-active-border-fg colour238

# toggle statusbar
bind-key b set-option status

# status line
set -g status-justify left
set -g status-bg default
set -g status-fg default
set -g status-interval 2

# messaging
set -g message-fg black
set -g message-bg yellow
set -g message-command-fg blue
set -g message-command-bg black
set -g automatic-rename on

# window mode
setw -g mode-bg colour6
setw -g mode-fg colour0

# colors
setw -g window-status-format "#[fg=colour3] •#[fg=colour8] #W "
setw -g window-status-current-format "#[fg=colour2] •#[fg=colour7] #W "
setw -g window-status-current-attr dim
set -g status-justify centre
set -g status-left "  #[fg=colour3]• #[fg=colour2]• #[fg=colour4]•"
set -g status-right " #[fg=colour4] •#[fg=colour8] #S  "
# clock
set-window-option -g clock-mode-colour colour40 #green

#---------------------------
#Prevent Renaming of windows|
#----------------------------
set-option -g allow-rename off
#-------------------------------
# set scrollback history to 1000|
#-------------------------------
set -g history-limit 1000
#---------
#movement|
#--------
# use PREFIX | to split window horizontally and PREFIX - to split vertically
bind | split-window -h
bind - split-window -v
 
bind-key J resize-pane -D 5
bind-key K resize-pane -U 5
bind-key H resize-pane -L 5
bind-key L resize-pane -R 5
 
bind-key M-j resize-pane -D
bind-key M-k resize-pane -U
bind-key M-h resize-pane -L
bind-key M-l resize-pane -R
 
# Vim style pane selection
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
 
# Use Alt-vim keys without prefix key to switch panes
bind -n M-h select-pane -L
bind -n M-j select-pane -D
bind -n M-k select-pane -U
bind -n M-l select-pane -R
 
# Use Alt-arrow keys without prefix key to switch panes
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D
 
# Shift arrow to switch windows
bind -n S-Left previous-window
bind -n S-Right next-window

#Pane Sync Setup
bind . setw synchronize-panes \; display "Pane sync: #{?pane_synchronized,on,off}"
setw -qg window-status-current-format " #W #{?pane_synchronized,<sync> ,}"
