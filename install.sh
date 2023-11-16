#!/bin/sh
#
# expects everything to be installed:
# nvim, tmux, alacritty, i3-package
#
#
# clone nvim-fork repo into .dotfiles
# does not need a link because it is its own repo

git clone git@github.com:ohnchen/nvim-config.git "$HOME"/.config/nvim

# i3 setup
ln -sf "$PWD"/i3/config "$HOME"/.config/i3/config 
ln -sf "$PWD"/i3status/config "$HOME"/.config/i3status/config 

# alacritty setup
ln -sf "$PWD"/alacritty/alacritty.yml "$HOME"/.config/alacritty/alacritty.yml 

#tmux setup
if [ ! -e "$HOME/.tmux/plugins/tpm" ]; then
  printf "WARNING: Cannot found TPM (Tmux Plugin Manager) \
 at default location: \$HOME/.tmux/plugins/tpm.\n"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

ln -sf "$PWD"/tmux/tmux.conf "$HOME"/.tmux.conf

