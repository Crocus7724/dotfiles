set -x PATH $HOME/.pyenv/bin $HOME/Projects/go/bin $HOME/.cargo/bin  $PATH
set -x GOPATH $HOME/Projects/go
. (pyenv init - | psub)
sh $HOME/.config/load_xkbmap.sh > /dev/null 2>&1 &
