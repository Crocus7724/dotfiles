## Install programs
- [Fish Shell](https://fishshell.com/)
- [Google Chrome](https://www.google.co.jp/chrome/browser/desktop/index.html)
- [JetBrains Toolbox](https://www.jetbrains.com/toolbox/app/)
- [Git Kraken](https://www.gitkraken.com/)
- [Google fonts](https://github.com/google/fonts)

## Install shell scripts(WIP)
```sh
#!/bin/sh -e

mkdir tmp
pushd tmp

# Install packages
sudo -k
sudo sh <<SCRIPT
	apt-get install vim-gnome
	apt-get install gnome-tweak-tool
	apt get install gnome-themes-standard gtk2-engines-murrine glib-compile-resources libglib2.0-dev

	# fish shell install
	apt-add-repository ppa:fish-shell/release-2
	apt-get update
	apt-get install fish
SCRIPT

# material-dark install
curl -sL https://github.com/nana-4/materia-theme/archive/master.tar.gz | tar xz
cd materia-theme-master
sudo ./install.sh

# change GDM theme
sudo cp -v /usr/share/gnome-shell/gnome-shell-theme.gresource{,~}
GTK_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme | sed "s/'//g")
sudo cp -v /usr/share{/themes/$GTK_THEME,}/gnome-shell/gnome-shell-theme.gresource

# install google fonts
wget https://github.com/google/fonts/archive/master.zip && unzip master.zip
mkdir -p $HOME/.fonts/google-fonts
cp -r master/ofl/inconsolata $HOME/.fonts/google-fonts/

chsh -s $(which fish)
sudo reboot
```


