# Path to your oh-my-zsh installation.
export ZSH=/Users/willwin.wang/.oh-my-zsh

# PHP installed by brew
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Plugins
plugins=(aws git node npm bower brew osx extract docker autojump github rvm ruby pip jira bundler)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Bash completion for the `wp` command
autoload bashcompinit
bashcompinit

_wp_complete() {
  local OLD_IFS="$IFS"
  local cur=${COMP_WORDS[COMP_CWORD]}

  IFS=$'\n';  # want to preserve spaces at the end
  local opts="$(wp cli completions --line="$COMP_LINE" --point="$COMP_POINT")"

  if [[ "$opts" =~ \<file\>\s* ]]
  then
    COMPREPLY=( $(compgen -f -- $cur) )
  elif [[ $opts = "" ]]
  then
    COMPREPLY=( $(compgen -f -- $cur) )
  else
    COMPREPLY=( ${opts[*]} )
  fi

  IFS="$OLD_IFS"
  return 0
}
complete -o nospace -F _wp_complete wp

# Config for apps
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Yarn
export PATH="$PATH:`yarn global bin`"

# Kubernetes
export KUBECONFIG=~/.kube/stg

# Idp
function idp {
  export $(rea-as saml | pecorb | xargs rea-as saml) > /dev/null
  echo "Role: ${AWS_ROLE-(not set)}"
}

# Aliases

alias newswd="cd ~/Dev/news/app/www/wordpress-default/wp-content/themes/REA/library"

