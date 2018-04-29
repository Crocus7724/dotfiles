set -x GOPATH $HOME/Projects/go
set -x PATH $HOME/Projects/go/bin $PATH
. (pyenv init - | psub)


set -x FZF_DEFAULT_OPTS "--height 20%"

function fish_user_key_bindings
  bind \cr 'h'
end
