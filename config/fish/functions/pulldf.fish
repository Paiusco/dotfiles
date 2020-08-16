function pulldf
   cp -v $PROJECTS/dotfiles/vimrc ~/.vimrc 
   cp -rv $PROJECTS/dotfiles/vim/UltiSnips/ ~/.vim/
   cp -rv $PROJECTS/config/fish/functions ~/.config/fish/functions
end 
