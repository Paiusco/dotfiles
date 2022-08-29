#!/bin/bash

########## Output config ##########
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
BOLD=$(tput bold)
NORM=$(tput sgr0)

# Variable to use for DryRun if requested by command line
D=''

#Var for differentiate logs from dryruns
_echo="echo -e ${GREEN}[DEBUG]${NC}"

#Prints the usage of the script
function usage()
{
   echo "Usage:"
   echo "   bootstrap.sh [options]\n"
   echo "   Install and configure app for an amazing workflow :D"
   echo "Options:"
   echo "   -h           Display this help message"
   echo "   -i           Install i3, its config files and dependencies"
   echo "   -d           DryRun is on (one will see every command w/o running it)"
}

#Install packages coming from parameter
function install_bins()
{
   $_echo "Packages to be installed:" "$@"

   $D sudo pacman -Syyu --needed "$@"
}

function copy_config_files()
{
   $D mkdir -p ~/.config/alacritty
   $D mkdir -p ~/.config/ranger
   $D mkdir -p ~/.config/qtile

   $D cp -av ~/dotfiles/config/ranger/* ~/.config/ranger/
   $D cp -av ~/dotfiles/config/alacritty/* ~/.config/alacritty/
   $D cp -av ~/dotfiles/config/qtile/* ~/.config/qtile/
}
############## All functions are defined above this line #######################

hardcoded_bins=" \
   fish \
   rofi \
   feh \
   neovim \
   exa \
   ranger \
   qutebrowser \
   brave \
   neofetch \
   libwnck3 \
   lxappearance \
   htop \
   blueberry \
   man \
   scrot \
   xclip \
   spotify \
   alacritty \
   ttf-font-awesome"

# add later -> archlinux-tweak-tool to change themes :)
bins_to_install=$hardcoded_bins

# Parsing arguments
while getopts ":hd" opt; do
   case ${opt} in
      h) # process option h
         usage
         exit 0
         ;;
      d) # process option d
         $_echo "DryRun is activated!"
      D="echo -e ${BLUE}Command:${NC}"
         ;;
      \?)
         echo "Invalid option -$OPTARG"
         usage
         exit 1
         ;;
   esac
done
shift $((OPTIND -1))


if ! install_bins "$bins_to_install"; then
   $_echo "Installation did not proceed well! Aborting..."
   exit 1
fi

if ! copy_config_files; then
   $_echo "Config copying did not proceed well! Aborting..."
   exit 1
fi

# Configure nvim
$D mkdir -p ~/.config/nvim
$D cp -av ~/dotfiles/config/init.vim ~/.config/nvim/

#Configure Fish
cp -rv ~/dotfiles/config/fish/functions/* ~/.config/fish/functions/
cp -v ~/dotfiles/paiusco.fish ~/.config/fish/config.fish

# Vim-plug installation
$D sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#Starship installation
$D sh -c "$(curl -fsSL https://starship.rs/install.sh)"

$D printf "\neval \"\$(starship init bash)\"" >> ~/.bashrc

echo -e "${RED}${BOLD}DO NOT FORGET: Add user.name and user.email on git \
   config!${NC}${NORM}"
