#!/bin/bash

# Get the TTY of the current pane
tty=$(tmux display-message -p '#{pane_tty}')

# Check if the process is Vim or Neovim
is_vim="ps -o state= -o comm= -t $tty | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?$'"

# Check if the pane is an SSH session
is_ssh="ps -o state= -o comm= -t $tty | grep -iqE '^[^TXZ ]+ +(\S+\/)?ssh$'"

# If it's an SSH session, check for Vim/Neovim on the remote machine
if eval "$is_ssh"; then
    ssh_command=$(ps -o command= -t $tty | grep ssh)
    remote_host=$(echo $ssh_command | awk '{print $NF}')
    is_remote_vim="ssh $remote_host 'ps aux | grep -iqE \"(view|n?vim?x?)(diff)?\"'"
    if eval "$is_remote_vim"; then
        exit 0
    fi
elif eval "$is_vim"; then
    exit 0
fi

exit 1
