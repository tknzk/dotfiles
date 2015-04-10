#export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:/Users/tknzk/Sites/bit/fuel/vendor/bin/:$PATH
export PATH=/opt/local/bin:/opt/local/sbin:~/bin:$PATH

#export PGDATA=/usr/local/var/postgres


#export GOPATH=/usr/local/bin
#export GOPATH=/usr/local/go/bin


#export TERM=xterm-256color

#export /Users/tknzk/Sites/bit/fuel/vendor/bin/

#export PATH=/Users/tknzk/.mysqlenv/bin:/Users/tknzk/.mysqlenv/shims:/Users/tknzk/.mysqlenv/mysql-build/bin:$PATH
#export MYSQLENV_HOME=$HOME/.mysqlenv
#export PATH=$HOME/.mysqlenv/bin:%HOME/.mysqlenv/shims:$HOME/.mysqlenv/mysql-build/bin:$PATH


#export PATH=/usr/local/sbin:/user/local/bin:$PATH
#DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="wedisagree"
ZSH_THEME="candy"
#ZSH_THEME="pygmalion"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

alias la='ls -la'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias tailf='tail -f'

alias mongo='mongo ~/dot.mongorc.js --shell'

alias railsserver='bundle exec rails s -b 127.0.0.1'
alias railsconsole='bundle exec rails console'


#alias mysql='mysql -uroot'

export EDITOR=/usr/local/bin/vim
export GREP_OPTIONS="--color=auto"

# set editor
export EDITOR='vim'

# git
alias gitdiff='git difftool --tool=vimdiff --no-prompt'
alias gs='git status'
alias gitloggraph='git log --oneline --graph'

# PHP
#alias phplocal='FUEL_ENV=local php'


# for rbenv
if [ -d ${HOME}/.rbenv  ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  #export RBENV_ROOT=$HOME/.rbenv
  eval "$(rbenv init - zsh)"
fi
export RBENV_ROOT=$HOME/.rbenv
eval "$(rbenv init - zsh)"

# ssh aliases
#source $HOME/.zshrc.ssh.alias


bindkey -v
#bindkey "^P" up-line-or-history
#bindkey "^N" down-line-or-history

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end
#
#bindkey -a 'O' push-line
#bindkey -a 'H' run-help
#bindkey -a '^A' vi-beginning-of-line
#bindkey -a '^E' vi-end-of-line
#bindkey -v '^[[8^' vi-end-of-line
#bindkey -v '^[[7^' vi-beginning-of-line


## #
## # Set vi mode status bar
## #
## #
## # Reads until the given character has been entered.
## #
## readuntil () {
##     typeset a
##     while [ "$a" != "$1" ]
##     do
##         read -E -k 1 a
##     done
## }
## 
## #
## # If the $SHOWMODE variable is set, displays the vi mode, specified by
## # the $VIMODE variable, under the current command line.
## # 
## # Arguments:
## #
## #   1 (optional): Beyond normal calculations, the number of additional
## #   lines to move down before printing the mode.  Defaults to zero.
## #
## showmode() {
##     typeset movedown
##     typeset row
## 
##     # Get number of lines down to print mode
##     movedown=$(($(echo "$RBUFFER" | wc -l) + ${1:-0}))
##     
##     # Get current row position
##     echo -n "\e[6n"
##     row="${${$(readuntil R)#*\[}%;*}"
##     
##     # Are we at the bottom of the terminal?
##     if [ $((row+movedown)) -gt "$LINES" ]
##     then
##         # Scroll terminal up one line
##         echo -n "\e[1S"
##         
##         # Move cursor up one line
##         echo -n "\e[1A"
##     fi
##     
##     # Save cursor position
##     echo -n "\e[s"
##     
##     # Move cursor to start of line $movedown lines down
##     echo -n "\e[$movedown;E"
##     
##     # Change font attributes
##     echo -n "\e[1m"
##     
##     # Has a mode been set?
##     if [ -n "$VIMODE" ]
##     then
##         # Print mode line
##         echo -n "-- $VIMODE -- "
##     else
##         # Clear mode line
##         echo -n "\e[0K"
##     fi
## 
##     # Restore font
##     echo -n "\e[0m"
##     
##     # Restore cursor position
##     echo -n "\e[u"
## }
## 
## clearmode() {
##     VIMODE= showmode
## }
## 
## #
## # Temporary function to extend built-in widgets to display mode.
## #
## #   1: The name of the widget.
## #
## #   2: The mode string.
## #
## #   3 (optional): Beyond normal calculations, the number of additional
## #   lines to move down before printing the mode.  Defaults to zero.
## #
## makemodal () {
##     # Create new function
##     eval "$1() { zle .'$1'; ${2:+VIMODE='$2'}; showmode $3 }"
## 
##     # Create new widget
##     zle -N "$1"
## }
## 
## # Extend widgets
## makemodal vi-add-eol           INSERT
## makemodal vi-add-next          INSERT
## makemodal vi-change            INSERT
## makemodal vi-change-eol        INSERT
## makemodal vi-change-whole-line INSERT
## makemodal vi-insert            INSERT
## makemodal vi-insert-bol        INSERT
## makemodal vi-open-line-above   INSERT
## makemodal vi-substitute        INSERT
## makemodal vi-open-line-below   INSERT 1
## makemodal vi-replace           REPLACE
## makemodal vi-cmd-mode          NORMAL
## 
## unfunction makemodal


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

source ~/.zsh.d/zsh-notify/notify.plugin.zsh

export SYS_NOTIFIER="/usr/local/bin/terminal-notifier"
export NOTIFY_COMMAND_COMPLETE_TIMEOUT=30



# Customize to your needs...
#export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin
