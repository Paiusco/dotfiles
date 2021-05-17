set -Ux EDITOR nvim
set -Ux CONFIG_PATH ~/.config/
if status --is-interactive
   # Git abbrs
   abbr -ag -- ga 'git add'
   abbr -ag -- gc 'git commit -v'
   abbr -ag -- gca 'git commit -av'
   abbr -ag -- gco 'git checkout'
   abbr -ag -- gamen 'git commit --amend'
   abbr -ag -- gitka 'gitk --all &'
   abbr -ag -- gpl 'git pull'
   abbr -ag -- gps 'git push'
   abbr -ag -- gs 'git status'
   abbr -ag -- gd 'git diff'
   # Basic abbrs
   abbr -ag -- tiga 'tig --all'
   abbr -ag -- grep 'grep --color=auto'
   abbr -ag -- l ls
   abbr -ag -- rmall 'rm -rf *'
   abbr -ag -- make 'make -j(nproc)'
   abbr -ag -- vim 'nvim'
   abbr -ag -- vi 'nvim'
   # Fixing typos
   abbr -ag -- cd.. '..'
   abbr -ag -- ... '..'
   abbr -ag -- wget 'wget -c'
   abbr -ag -- cat 'bat'
   # Config files
   abbr -ag -- cvim 'nvim $CONFIG_PATH/nvim/init.vim'
   abbr -ag -- ci3 'nvim $CONFIG_PATH/i3/config'
   abbr -ag -- ci3blocks 'nvim $CONFIG_PATH/i3blocks/i3blocks.conf'
   abbr -ag -- calacritty 'nvim $CONFIG_PATH/alacritty/alacritty.yml'
end

neofetch
