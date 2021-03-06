# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

if [ ! -n "$profile_paths" ]; then
	export profile_paths=$(( profile_paths + 1 ))
	PATH="$HOME/bin:$PATH"
	PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
	PATH="$PATH:$HOME/.local/bin"
	PATH="$PATH:/usr/local/heroku/bin"
    PATH="$PATH:$HOME/.local/nim/bin"
    export PATH
fi
