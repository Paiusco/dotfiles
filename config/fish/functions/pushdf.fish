function pushdf
   set -lx FISHFUNC ~/.config/fish/functions/

   cp -v ~/.config/nvim/init.vim ~/dotfiles/vimrc
   cp -v $FISHFUNC/pulldf.fish $FISHFUNC/pushdf.fish \
      ~/dotfiles/config/fish/functions/
   cp -rv ~/.config/fish/config.fish ~/dotfiles/paiusco.fish
end
