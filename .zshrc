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

# NVM

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Yarn

export PATH=$PATH:~/.config/yarn/global
