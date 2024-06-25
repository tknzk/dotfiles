export GOPATH=$HOME

# go_appengin_sdk
export PATH=/usr/local/go_appengine:$PATH


#export PATH=/usr/local/bin:/usr/local/sbin:$PATH
#export PATH=/usr/local/bin:/usr/local/sbin:/Users/tknzk/Sites/bit/fuel/vendor/bin/:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/go/bin:/usr/local/go/bin/bin:$PATH

export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=$HOME/bin:$PATH

#export PATH=/opt/local/bin:/opt/local/sbin:~/bin:$PATH

export PGDATA=/usr/local/var/postgres


# nvm
# export NVM_DIR="$HOME/.nvm"
# . "/usr/local/opt/nvm/nvm.sh"

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
#

LC_CTYPE="ja_JP.UTF-8"


alias la='ls -la'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias tailf='tail -f'
alias vi='vim'

alias listen_port='lsof -nP -iTCP -sTCP:LISTEN'

alias git_branch_clean="git branch --merged | egrep -v '^\*|staging|master|features/' | xargs git branch -d"

#alias mongoshell='mongo ~/dot.mongorc.js --shell'

alias td-agent_unload='sudo launchctl unload /Library/LaunchDaemons/td-agent.plist'
alias td-agent_load='sudo launchctl load /Library/LaunchDaemons/td-agent.plist'
alias td-agent_reload='sudo launchctl unload /Library/LaunchDaemons/td-agent.plist && sleep 2 && sudo launchctl load /Library/LaunchDaemons/td-agent.plist'


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


# for pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
 export PATH=${PYENV_ROOT}/bin:$PATH
 eval "$(pyenv init -)"
fi


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

#source ~/.zsh.d/zsh-notify/notify.plugin.zsh

#export SYS_NOTIFIER="/usr/local/bin/terminal-notifier"
#export NOTIFY_COMMAND_COMPLETE_TIMEOUT=30


#alias brew="env PATH=${PATH/\/Users\/TakumiKanzaki\/\.phpenv\/shims:/} brew"


# Customize to your needs...
#export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin
#export DOCKER_TLS_VERIFY=1
#export DOCKER_HOST=tcp://192.168.59.103:2376
#export DOCKER_CERT_PATH=/Users/TakumiKanzaki/.boot2docker/certs/boot2docker-vm



# local dev
source ~/.zshrc_dev_alias

autoload -Uz add-zsh-hook

rbenv_version () {
  local ruby_v=`rbenv version | cut -f1 -d' '`
  if [[ "`rbenv version | grep '.rbenv/version'`" = "" ]];then
    if [[ "`rbenv version | grep 'RBENV_VERSION'`" = "" ]];then
      local setting="%{$fg[green]%}[$ruby_v (local)]%{$reset_color%}"
    else
      local setting="%{$fg[blue]%}[$ruby_v (global)]%{$reset_color%}"
    fi
  else
    local setting="%{$fg[blue]%}[$ruby_v (global)]%{$reset_color%}"
  fi
  RPROMPT="$setting"
}
add-zsh-hook precmd rbenv_version

# 使い方:
# 1. 以下を .bashrc などにコピペして保存 -> 端末・シェル再起動または .bashrc 再読み込み
# 2. Git リポジトリを clone したディレクトリに移動 -> Pull Request と紐付いているブランチを checkout
# 3. $ ciopen [COMMIT]
#    $ ciopen head
#    $ ciopen head^
#    $ ciopen head~2
# ciopen() {
#   commit=$1
#   result=$(hub ci-status -v $commit)
#   if [ $? == 3 ]; then
#     echo $result
#   else
#     open $(echo $result | awk '{print $2}')
#   fi
# }

# eval $(docker-machine env docker-vm)

# The next line updates PATH for the Google Cloud SDK.
if [ -f /usr/local/google-cloud-sdk/path.zsh.inc ]; then
  source '/usr/local/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /usr/local/google-cloud-sdk/completion.zsh.inc ]; then
  source '/usr/local/google-cloud-sdk/completion.zsh.inc'
fi

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

. /opt/homebrew/opt/asdf/libexec/asdf.sh

export PATH="/opt/homebrew/opt/gawk/libexec/gnubin:$PATH"

# diff-highlight
export PATH=" PATH=$PATH:$(brew --prefix git)/share/git-core/contrib/diff-highlight:$PATH"

