#!/bin/sh
DIR=$(realpath "$(dirname "{BASH_SOURCE[0]}")")
# install all these packages first
# i3, dmenu, firefox, alacritty, nvim, tmux, 
# feh, git, gcc, net-tools, alsamixer, nmtui
#
# clone nvim-fork repo into .dotfiles
git clone https://github.com/ohnchen/nvim-config.git "$HOME"/.config/nvim

# i3 setup
if [ ! -e "$HOME/.config/i3" ]; then
  printf "WARNING: created directory i3"
  mkdir "$HOME"/.config/i3
fi
if [ ! -e "$HOME/.config/i3status" ]; then
  printf "WARNING: created directory i3status"
  mkdir "$HOME"/.config/i3status
fi
ln -sf $DIR/i3/config "$HOME"/.config/i3/config 
ln -sf $DIR/i3status/config "$HOME"/.config/i3status/config 

# alacritty setup
if [ ! -e "$HOME/.config/alacritty" ]; then
  printf "WARNING: created directory alacritty"
  mkdir "$HOME"/.config/alacritty
fi
ln -sf $DIR/alacritty/alacritty.yml "$HOME"/.config/alacritty/alacritty.yml 

#tmux setup
if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
  printf "WARNING: Cannot found TPM (Tmux Plugin Manager) \
 at default location: \$HOME/.tmux/plugins/tpm.\n"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

ln -sf $DIR/tmux/tmux.conf "$HOME"/.tmux.conf

# move wallpaper and set lightdm-theme
ln -sf $DIR/wallpaper.png "$HOME"/.wallpaper.png
feh --bg-scale "$HOME"/.wallpaper.png

# set lightdm-stuff ( copying instead of linking because of lightdm not having access to this dir)
cp $DIR/wallpaper.png /usr/share/pixmaps/wallpaper.png
cp $DIR/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
if [ ! -e "/usr/share/themes/Dracula" ]; then
  wget https://github.com/dracula/gtk/archive/refs/heads/master.zip
  unzip $DIR/master.zip 
  sudo mv gtk-master /usr/share/themes/Dracula
  rm $DIR/master.zip
fi

# set xinitrc
ln -sf $DIR/.xinitrc "$HOME"/.xinitrc
ln -sf "$HOME"/.xinitrc "$HOME"/.xprofile # executed by lightdm

# bashrc
ln -sf $DIR/.bashrc "$HOME"/.bashrc
ln -sf $DIR/.bash_aliases "$HOME"/.bash_aliases

# picom
ln -sf $DIR/picom/picom.conf "$HOME"/.config/picom/picom.conf

# enable touchpad 
sudo ln -sf $DIR/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf

# install rust 
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
