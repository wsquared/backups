POWERLEVEL9K_MODE='nerdfont-complete'

# Path to your oh-my-zsh installation.
export ZSH=/Users/willwin.wang/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Plugins
plugins=(aws git node npm yarn brew osx extract docker autojump github pip jira bundler jsontools scala sbt vscode web-search)

source $ZSH/oh-my-zsh.sh


# User configuration

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

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
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# Yarn
export PATH=$PATH:~/.yarn/bin

# Jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Python
export PATH=$PATH:/usr/local/opt/python/bin/python3
eval "$(pyenv init -)"
export USER_BASE=/Users/willwin.wang/.local/lib/python3.7/site-packages/

# avn
[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

# prompt
prompt_context () { }

# vim
stty -ixon

# ssh
export SSSH_DEFAULT_ENDPOINT='hdqqb0c1y6.execute-api.ap-southeast-2.amazonaws.com'

# ammonite

alias amm="amm --no-remote-logging"

# bash-my-aws and bash-my-rea
source ~/.bash-my-aws/aliases
source ~/.bash-my-aws/zsh_completion.sh
source ~/.bash-my-aws/lib/region-functions
source ~/.aws-shortcuts/aws-shortcuts.sh
for f in ~/.bash-my-rea/*-functions; do source $f; done

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/willwin.wang/Dev/agent-finder/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/willwin.wang/Dev/agent-finder/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/willwin.wang/Dev/agent-finder/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/willwin.wang/Dev/agent-finder/node_modules/tabtab/.completions/sls.zsh
[ -s "/Users/willwin.wang/.jabba/jabba.sh" ] && source "/Users/willwin.wang/.jabba/jabba.sh"
