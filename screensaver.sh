DIR=$(realpath "$(dirname "{BASH_SOURCE[0]}")")
cp $DIR/screensaver.png /usr/share/pixmaps/wallpaper.png
ln -sf $DIR/screensaver.png ~/.screensaver.png
