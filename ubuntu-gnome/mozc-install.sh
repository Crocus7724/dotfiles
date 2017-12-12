#!/bin/bash -e

tar xavf mozc-*.tgz

cd mozc-*/

sed -i s/'const bool kActivatedOnLaunch = false;'/'const bool kActivatedOnLaunch = true;'/g mut/src/unix/ibus/property_handler.cc 

sudo apt-get install -y clang libdbus-1-dev libglib2.0-dev libgtk2.0-dev subversion tegaki-zinnia-japanese debhelper libibus-1.0-dev build-essential libssl-dev libxcb-xfixes0-dev python-dev gyp protobuf-compiler libqt4-dev libuim-dev libzinnia-dev fcitx-libs-dev devscripts ninja-build 

sudo ./build_mozc_plus_utdict 

tail -n 5 /var/log/apt/history.log | grep Install: | sed -e s/"Install: "// | sed -e s/", automatic"//g | sed -e s/"), "/"\n"/g | sed -e s/" (.*$"/""/g | tr '\n' ' ' | xargs sudo apt-get remove -y 

sudo apt install ./mozc-*.deb ./fcitx-mozc_*.deb ./ibus-mozc_*.deb 

gsettings set org.gnome.settings-daemon.plugins.keyboard active true 

