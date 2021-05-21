# Install vim-plugin
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

[[ ! -d ~/.config/nvim/ ]] && mkdir ~/.config/nvim/
ln -s ~/dev/dotfiles/vim/.vimrc ~/.config/nvim/init.vim
