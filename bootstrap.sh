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

#This method does not use $_echo because the echo here is only for a return
#Finds out if we're in a arch/debian based distro
function linux_id()
{
   if [ -f /etc/os-release ]; then
      . /etc/os-release
      if [[ $ID_LIKE == "arch" ]]; then
         echo "pacman"
      elif [[ $ID_LIKE == "debian" ]]; then
         echo "apt"
      else
         echo "Unknown"
      fi
   fi
}

#Install packages coming from parameter
function install_bins()
{
   pkg_manager=$(linux_id)
   $_echo "Package manager is:" $pkg_manager
   $_echo "Packages to be installed:" $@

   case $pkg_manager in

      pacman)
         $_echo "This is an Arch distro"
         $D sudo $pkg_manager -Sy --needed $@
         ;;
      apt)
         $_echo "This is a Debian distro"
         $D sudo $pkg_manager install $@
         ;;
      *)
         $_echo "This distro is not recognized yet"
         ;;
   esac
}

function copy_config_files()
{
   $D mkdir -p ~/.config/alacritty
   $D mkdir -p ~/.config/ranger

   $D cp -av ~/dotfiles/config/ranger/* ~/.config/ranger/
   $D cp -av ~/dotfiles/config/alacritty/* ~/.config/alacritty/
}
############## All functions are defined above this line #######################

hardcoded_bins="git tig meld brave fish neovim tree curl neofetch \
   alacritty ranger"
i3_related_bins="i3 autotiling conky polybar feh rofi nitrogen xclip scrot"

bins_to_install=$hardcoded_bins

is_i3_installed=false
# Parsing arguments
while getopts ":hdi" opt; do
   case ${opt} in
      h) # process option h
         usage
         exit 0
         ;;
      d) # process option d
         $_echo "DryRun is activated!"
      D="echo -e ${BLUE}Command:${NC}"
         ;;
      i) # process option i
         $_echo "i3 packages added!"
         is_i3_installed=true
         bins_to_install+=$i3_related_bins
         ;;
      \?)
         echo "Invalid option -$OPTARG"
         usage
         exit 1
         ;;
   esac
done
shift $((OPTIND -1))


install_bins $bins_to_install
if [ $? != 0 ]; then
   $_echo "Installation did not proceed well! Aborting..."
   exit 1
fi

copy_config_files
if [ $? != 0 ]; then
   $_echo "Config copying did not proceed well! Aborting..."
   exit 1
fi

$D chsh -s /usr/bin/fish
if [ $? != 0 ]; then
   $_echo "Change of shell did not proceed well! Aborting..."
   exit 1
fi

# If i3 is added, install config files
if [ "$is_i3_installed" = true ] ; then
   $D mkdir -p ~/.config/i3/
   $D cp -av ~/dotfiles/i3/ ~/.config/i3/
fi

# Configure nvim
$D mkdir -p ~/.config/nvim
$D cp -av ~/dotfiles/config/init.vim ~/.config/nvim/

# Vim-plug installation
$D sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Installing and configuring Oh My Fish
$D curl -L https://get.oh-my.fish | fish

$D alacritty -e "fish ~/dotfiles/setup.fish" 2>/dev/null


echo -e "${RED}${BOLD}DO NOT FORGET: Add user.name and user.email on git \
   config!${NC}${NORM}"
