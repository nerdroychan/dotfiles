DIR=`pwd`
echo "Current directory:" $DIR

# vim
rm -r $HOME/.vim
ln -sf $DIR/vim $HOME/.vim

# i3
rm -r $HOME/.config/i3
mkdir -p $HOME/.config/i3
ln -sf $DIR/i3/* $HOME/.config/i3

# kitty
rm -r $HOME/.config/kitty
mkdir -p $HOME/.config/kitty
ln -sf $DIR/kitty/*.conf $HOME/.config/kitty

# tmux
rm $HOME/.tmux.conf
ln -sf $DIR/tmux/tmux.conf $HOME/.tmux.conf
