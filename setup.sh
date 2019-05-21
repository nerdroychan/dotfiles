DIR=`pwd`
echo "Current directory:" $DIR

# vim
ln -sf $DIR/vim $HOME/.vim

# i3
mkdir -p $HOME/.config/i3
ln -sf $DIR/i3/* $HOME/.config/i3

# kitty
mkdir -p $HOME/.config/kitty
ln -sf $DIR/kitty/*.conf $HOME/.config/kitty

# tmux
ln -sf $DIR/tmux/tmux.conf $HOME/.tmux.conf

# xinitrc
ln -sf $DIR/xinitrc $HOME/.xinitrc

# imwheel
ln -sf $DIR/imwheelrc $HOME/.imwheelrc

# supervisord
ln -sf $DIR/xsupervisord $HOME/.xsupervisord
