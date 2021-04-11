#!/bin/bash

## Writting down ideas first:

# installation list: git, nvim, fish, terminator (Look into rxvt-unicode),
#and configure it all.

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
BOLD=$(tput bold)
NORM=$(tput sgr0)

#Var for differentiate logs from dryruns
_echo="echo -e ${GREEN}[DEBUG]${NC}"

function usage()
{
   echo "Usage:"
   echo "   bootstrap.sh -h         Display this help message"
   echo "   bootstrap.sh -d         DryRun is on (one will see every command w/o running it)"
}

#This method does not use $_echo because the echo here is only for a return
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

function install_bins()
{
   pkg_manager=$(linux_id)
   $_echo "Package manager is:" $pkg_manager
   $_echo "Packages to be installed:" $@

   case $pkg_manager in

      pacman)
         $_echo "This is an Arch distro"
         $D sudo $pkg_manager -S $@
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
############## All functions are defined above this line #######################

# Variable to use for DryRun if requested by command line
D=''

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

bins_to_install="git terminator fish neovim tree"

install_bins $bins_to_install
if [ $? != 0 ]; then
   $_echo "Installation did not proceed well! Aborting..."
   exit 1
fi

$D chsh -s /usr/bin/fish
if [ $? != 0 ]; then
   $_echo "Change of shell did not proceed well! Aborting..."
   exit 1
fi

$D git config --global core.editor "nvim"
if [ $? != 0 ]; then
   $_echo "Git config did not proceed well! Aborting..."
   exit 1
fi

#TODO: Configure fish and nvim!
$D cp -av ~/dotfiles/init.vim ~/.config/nvim/

terminator -e "~/dotfiles/setup.fish" 2>/dev/null # 2>&1 is not working for some reason


echo -e "${RED}${BOLD}DO NOT FORGET: Add user.name and user.email on git \
   config!${NC}${NORM}"
