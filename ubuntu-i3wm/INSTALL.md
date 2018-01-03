## Installed apps
- [Fish Shell](https://fishshell.com/)
- [Google Chrome](https://www.google.co.jp/chrome/browser/desktop/index.html)
- [JetBrains Toolbox](https://www.jetbrains.com/toolbox/app/)
- [Git Kraken](https://www.gitkraken.com/)
- [Google fonts](https://github.com/google/fonts)
- [i3-gaps](https://github.com/Airblader/i3)
- [Material Icons](https://github.com/google/material-design-icons)
- [polybar](https://github.com/jaagr/polybar)
- [rofi](https://github.com/DaveDavenport/rofi)
- [Go](https://github.com/golang/go)

```sh
#!/usr/bin/env bash

CURRENT_DIR=$(dirname $(readlink -f $0))

mkdir tmp
cd tmp

sudo apt-get install vim git curl unzip feh peek xss-lock typora

curl https://github.com/google/material-design-icons/releases/download/3.0.1/material-design-icons-3.0.1.zip

unzip material-design-icons-3.0.1.zip
cp -rp material-design-icons-3.0.1/iconfont/ $HOME/.font/material-design-icons

# install i3wm-gaps
sudo apt-get install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake

git clone https://www.github.com/Airblader/i3 i3-gap
cd i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/

../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

cd ../..

# install polybar
sudo apt install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev i3-wm libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libxcb-cursor-dev

git clone --recursive https://github.com/jaagr/polybar
mkdir polybar/build
cd polybar/build
cmake -DCMAKE_BUILD_TYPE=Release ..
sudo make install

cd ..

# install rofi
sudo apt install rofi

# theme
# see: https://askubuntu.com/questions/598943/how-to-de-uglify-i3-wm
sudo apt-get install lxappearance gtk-chtheme qt4-qtconfig

git clone https://github.com/unix121/i3wm-themer

cd i3wm-themer/scripts
./i3wmthemer -b backup
./i3wmthemer -c
./i3wmthemer -t Colors
cd ../..

git clone https://github.com/AlessandroYorba/Despacio.git
mkdir -p $HOME/.vim/colors
cp Despacio/colors/despacio.vim $HOME/.vim/colors

git clone https://github.com/google/fonts.git google-fonts
mkdir -p $HOME/.fonts/google-fonts
cp google-fonts/ofl/inconsolata $HOME/.fonts/google-fonts/
fc-cache -fv $HOME/.fonts

# install fish
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish

sudo sh -c "which fish >> /usr/local/bin/fish"
chsh -s ${which fish}

# install golang
sudo apt-get install golang

# apply gnome-terminal theme
dconf load /org/gnome/terminal/legacy/profiles:/:6adce65c-b0e8-4f0a-a04a-555e728da6ac/ < $CURRENT_DIR/gnome-terminal-profile.dconf

# copy config
cp -r .xinitrc .Xresources .xkb $HOME/
cp -r compton.conf load_xkbmap.sh i3 fish polybar rofi $HOME/.config/

sudo cp rc.local /etc/rc.local
sudo cp rc-local.service fcitx-env.service /etc/systemd/
sudo systemctl link rc-local.service
sudo systemctl link fcitx-env.service
sudo systemctl enable rc-local.service
sudo systemctl enable fcitx-env.service
```
