alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias vi="nvim"
alias g='cd $(ghq root)/$(ghq list | peco)'
alias "gsf"="git branch -a | fzf | sed 's/remotes\/origin\///g' | xargs git switch"
alias ku="kubectl"
alias ls="ls --color=auto -l"
alias :q="exit"

# go
set -x PATH $PATH /usr/local/go/bin
set -x GOROOT /usr/local/go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH /usr/local/bin

# uv
set -x PATH $PATH $HOME/.local/bin
