if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status is-interactive
    # Commands to run in interactive sessions can go here

    # PATH
    set PATH /opt/homebrew/bin $PATH # <-追加
end

set -x GOOGLE_APPLICATION_CREDENTIALS "/Users/s17573/creds/love-221800-112db2d2d2d6.json"
set -x FIREBASE_CREDENTIALS "/Users/s17573/creds/love-dev-firebase-7b11d79e9697.json"
set -x SPANNER_INSTANCE_ID love-local
set -x SPANNER_EMULATOR_HOST localhost:9010
set -x PUBSUB_EMULATOR_HOST "localhost:9000"
set -x IGNORE_RACE true
set -x BUILD_ENV darwin-arm64

alias gs='git status'
alias gb='git branch'
alias gc='git checkout'
alias gcb='git checkout -b'
alias vi="nvim"
alias g='cd $(ghq root)/$(ghq list | peco)'
alias "gsf"="git branch -a | fzf | sed 's/remotes\/origin\///g' | xargs git switch"
alias ku="kubectl"

# go
set -x PATH $PATH /usr/local/go/bin
set -x GOROOT /usr/local/go
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# uv
set -x PATH $PATH $HOME/.local/bin
