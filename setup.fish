#!/bin/fish

## Installing OMF

curl -L https://get.oh-my.fish | fish

omf update
omf install pure
omf theme pure

# Setting up Pure as I want
set -x pure_color_git_branch red
set -x pure_show_system_time true

