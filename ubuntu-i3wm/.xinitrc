xrdb -merge $HOME/.Xresources

export DefaultImModule=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
sh $HOME/Documents/load_xkbmap.sh
