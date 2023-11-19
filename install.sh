#!/bin/sh
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
ln -sf "$PWD"/i3/config "$HOME"/.config/i3/config 
ln -sf "$PWD"/i3status/config "$HOME"/.config/i3status/config 

# alacritty setup
if [ ! -e "$HOME/.config/alacritty" ]; then
  printf "WARNING: created directory alacritty"
  mkdir "$HOME"/.config/alacritty
fi
ln -sf "$PWD"/alacritty/alacritty.yml "$HOME"/.config/alacritty/alacritty.yml 

# kitty setup
if [ ! -e "$HOME/.config/kitty" ]; then
  printf "WARNING: created directory kitty"
  mkdir "$HOME"/.config/kitty
fi
ln -sf "$PWD"/kitty/kitty.conf "$HOME"/.config/kitty/kitty.conf 


#tmux setup
if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
  printf "WARNING: Cannot found TPM (Tmux Plugin Manager) \
 at default location: \$HOME/.tmux/plugins/tpm.\n"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

ln -sf "$PWD"/tmux/tmux.conf "$HOME"/.tmux.conf

# move wallpaper 
ln -sf "$PWD"/wallpaper.png "$HOME"/.wallpaper.png
feh --bg-scale "$HOME"/.wallpaper.png

# set xinitrc
ln -sf "$PWD"/.xinitrc "$HOME"/.xinitrc

# enable touchpad 
sudo ln -sf "$PWD"/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf

# install rust 
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
