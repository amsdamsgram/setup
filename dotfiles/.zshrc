#!/usr/bin/env zsh

export EDITOR="atom"

# export PATH
# OS X 10.10+ doesn't execute /etc/launchd.conf
# and GUI app doesn't get /etc/paths
# in order to get the right PATH in Atom.app Terminal (atom-term2)
# here is my PATH, hardcoded
# https://github.com/webBoxio/atom-term2/issues/50
# export PATH=$(cat /etc/paths | xargs | tr " " :)
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

export ANDROID_HOME=/Users/iDams/Library/Android/sdk

#$SETUP_PATH doesn't exist yet
source $HOME/setup/setupsh/index

# find $SETUP_PATH if not defined using symlink real dirname
#__FILENAME__=${0} # only for sourced file, .zshrc is not sourced
__FILENAME__=${ZDOTDIR-~}/.zshrc
if [[ -z "$SETUP_PATH" ]] then
  export SETUP_PATH=$(cd $(dirname $(readlink $__FILENAME__))/../../ && pwd)
fi


source $SETUP_PATH/submodules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

HISTFILE=~/.history
HISTSIZE=SAVEHIST=1000
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FCNTL_LOCK
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
#setopt PRINT_EXIT_VALUE

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

#export CC=llvm-gcc-4.2

ZSH_SITE_FUNCTION=/usr/local/share/zsh/site-functions
if [ ! -e  $ZSH_SITE_FUNCTION/prompt_pure_setup ]
then
  mkdir -p $ZSH_SITE_FUNCTION
  silent-rm $ZSH_SITE_FUNCTION/prompt_pure_setup
  ln -s "$SETUP_PATH/submodules/pure/pure.zsh" $ZSH_SITE_FUNCTION/prompt_pure_setup
fi
if [ ! -e  $ZSH_SITE_FUNCTION/async ]
then
  mkdir -p $ZSH_SITE_FUNCTION
  silent-rm $ZSH_SITE_FUNCTION/async
  ln -s "$SETUP_PATH/submodules/pure/async.zsh" $ZSH_SITE_FUNCTION/async
fi
fpath=("/usr/local/share/zsh/site-functions" $fpath)
#PURE_CMD_MAX_EXEC_TIME=2
autoload -U promptinit && promptinit
prompt pure
# add %F{red}%(?..[%?] )%f to include exit code [code]
PROMPT='%(?.%F{green}.%F{red}❯%F{green})❯%f '


## OS X
alias osx-hidden-show="defaults write com.apple.finder AppleShowAllFiles -bool true && osx-refresh"
alias osx-hidden-hide="defaults write com.apple.finder AppleShowAllFiles -bool false && osx-refresh"
alias osx-desktop-show="defaults write com.apple.finder CreateDesktop -bool true && osx-refresh"
alias osx-desktop-hide="defaults write com.apple.finder CreateDesktop -bool false && osx-refresh"

## NVM
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

## NPM

alias n="npm"
alias nv="node --version && npm --version"
alias ni="npm i"
alias nio="npm --cache-min 0 i"
alias nig="npm i -g"
alias nis="npm i -S"
alias nid="npm i -D"
alias ns="npm -s start --"
alias nt="npm -s test --"
alias nr="npm run -s"

## YARN
alias y="yarn"

alias echofliptable="echo '\n(╯°□°）╯︵ ┻━┻\n'"
alias fliptable="echo \"$USER/setup\"; echofliptable; setupsh-update; setupsh-run"

## Git
alias g="git"

## React Native
alias rn="react-native"

## Network
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

# Show notification when long running command finishes
# and your terminal is not in focus
#
# http://frantic.im/notify-on-completion
function notify_cmd_result_when_terminal_not_focused {
  LAST_EXIT_CODE=$?
  CMD=$(fc -ln -1)
  # No point in waiting for the command to complete
  notify-if-hyperterm-is-in-the-background "$CMD" "$LAST_EXIT_CODE" &
}
export PS1='$(notify_cmd_result_when_terminal_not_focused)'$PS1

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
