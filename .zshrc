# Path to your oh-my-zsh installation.
export ZSH=/Users/willwin.wang/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# Plugins
plugins=(aws git node npm bower brew osx extract docker autojump github rvm ruby pip jira bundler)

source $ZSH/oh-my-zsh.sh

# User configuration

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

#Kubernetes
export KUBECONFIG=~/.kube/c1.mde.realestate.com.au

# Idp
function idp {
  export $(rea-as saml | pecorb | xargs rea-as saml) > /dev/null
  echo "Role: ${AWS_ROLE-(not set)}"
}

# Go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Java
export JAVA_HOME=$(/usr/libexec/java_home)

# Dotnet
export PATH=/usr/local/share/dotnet/bin:$PATH
