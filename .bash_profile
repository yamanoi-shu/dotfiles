eval "$(rbenv init -)"
eval `/usr/local/opt/coreutils/libexec/gnubin/dircolors ~/.dircolors-solarized/dircolors.ansi-dark`

alias ls='gls --color=auto'
alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH=/usr/local/bin:$PATH

alias g='cd $(ghq root)/$(ghq list | peco)'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/yamanoishu/.sdkman"
[[ -s "/Users/yamanoishu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/yamanoishu/.sdkman/bin/sdkman-init.sh"

source ~/.bashrc

export NODE_PATH=`npm root -g`

export GOPATH=$HOME/go
export GOBIN="$GOPATH/bin"
export PATH=$PATH:$GOPATH/bin
export PATH="$PATH:/Users/yamanoishu/flutter/bin"
eval "$(direnv hook bash)"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/yamanoishu/google-cloud-sdk/path.bash.inc' ]; then . '/Users/yamanoishu/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/yamanoishu/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/yamanoishu/google-cloud-sdk/completion.bash.inc'; fi
export PATH=$HOME/.nodebrew/current/bin:$PATH
