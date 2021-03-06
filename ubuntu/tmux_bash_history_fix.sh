### Information ###
# Last Modified Date: 2020/09/12
# Maintainer: lentychang@gmail.com

### Usage ###
# Please append the following content into your ~/.bashrc

### Purpose of this script ###
# It seperates bash history based on tmux panel. For each tmux panel, it will save to different file.
# The reason is that, timestamp is not really helpful if you keep switching tmux panels. For example, if the two panel is in different directory or repository.
# You switch to master branch in panel 1, and switch to devel branch in panel 2. If you merge all history together, it is confusing.

# number of commands in History file and History file size
export HISTSIZE=100000
export HISTFILESIZE=100000

# Comment it, if you don't want timestamp in your history
export HISTTIMEFORMAT="%F %T "

# Avoid duplicate command
export HISTCONTROL=ignoredups:erasedups

# Append history entries
shopt -s histappend

# After each command, save and reload history
unset PROMPT_COMMAND
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# For each tmux panel, set different history file name
if [[ $TMUX_PANE ]]; then
	          HISTFILE=$HOME/.bash_history_tmux_${TMUX_PANE:-0}
fi
