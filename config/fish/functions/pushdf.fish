function pushdf
   set -lx FISHFUNC ~/.config/fish/functions/

   cp -v ~/.vimrc $PROJECTS/dotfiles/vimrc
   cp -v $FISHFUNC/pulldf.fish $FISHFUNC/pushdf.fish \
      $PROJECTS/dotfiles/config/fish/functions/
#   cp -rv ~/.vim/UltiSnips/ $PROJECTS/dotfiles/vim/ #Deprecated, nvim doesn't work well with UltiSnips
   cp -rv ~/.config/fish/config.fish $PROJECTS/dotfiles/paiusco.fish
end
