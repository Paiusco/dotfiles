#!/bin/fish

# Configure Oh My Fish
omf update
omf install pure
omf theme pure

# Setting up Pure as I want
set -x pure_color_git_branch red
set -x pure_show_system_time true

# Copy all fish functions
cp -rv ~/dotfiles/config/fish/functions/* ~/.config/fish/functions/
cp -v ~/dotfiles/paiusco.fish ~/.config/fish/config.fish

