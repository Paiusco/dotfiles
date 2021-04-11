function pulldf
   set -lx PROJECTS ~/Projects/

   cp -v $PROJECTS/dotfiles/vimrc ~/.config/nvim
#   cp -rv $PROJECTS/dotfiles/vim/UltiSnips/ ~/.vim/ #Deprecated, nvim doesn't work well with UltiSnips
   cp -rv $PROJECTS/dotfiles/config/fish/functions ~/.config/fish/functions
   cp -rv $PROJECTS/dotfiles/paiusco.fish ~/.config/fish/config.fish
end
