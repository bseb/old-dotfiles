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
set -g status-justify left
set -g status-bg blue
set -g status-fg white
setw -g window-status-current-style bold
set -g status-interval 2
set -g status-justify centre
bind-key b set-option status

#--------------------------------------------------
# start window numbering at 1 for easier switching|
#-------------------------------------------------
set -g base-index 1
#--------
# colors|
#--------
# panes
set -g pane-border-style fg=colour0
set -g pane-active-border-style fg=colour239


# messaging
set -g message-style fg=black,bg=yellow
set -g message-command-style fg=blue,bg=black
set -g automatic-rename off

# window mode
setw -g mode-style bg=colour6,fg=colour0


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

# Mouse mode
set -g mouse on

#----------------
#Pane Sync Setup|
#---------------
bind . setw synchronize-panes \; display "Pane sync: #{?pane_synchronized,on,off}"
setw -qg window-status-current-format " #W #{?pane_synchronized,<sync> ,}"

#----------
#Tmux Line |
#----------

if-shell "test -f ~/dotfiles/tmuxline" "source ~/dotfiles/tmuxline"
