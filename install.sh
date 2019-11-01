#!/bin/sh

rm -fr /etc/pacman.d/gnupg
pacman-key --init
pacman-key --populate archlinux

pacman -Syu --noconfirm

printf '[archlinuxcn]\nServer = https://repo.archlinuxcn.org/$arch\n' >> /etc/pacman.conf
pacman -Syy --noconfirm

pacman -S --noconfirm archlinuxcn-keyring

pacman -S --noconfirm cmake
pacman -S --noconfirm clang
pacman -S --noconfirm llvm
pacman -S --noconfirm lldb
pacman -S --noconfirm ccls-git

pacman -Scc --noconfirm

curl -o /root/.emacs.d/custom/awesome-tab.el https://raw.githubusercontent.com/manateelazycat/awesome-tab/master/awesome-tab.el

emacs --daemon
emacsclient -e '(kill-emacs)'
