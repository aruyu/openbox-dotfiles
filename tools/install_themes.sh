#!/bin/bash
#==
#   NOTE      - install_themes.sh
#   Author    - Asta
#
#   Created   - 2023.03.04
#   Github    - https://github.com/astaos
#   Contact   - vine9151@gmail.com
#/



T_CO_RED='\e[1;31m'
T_CO_YELLOW='\e[1;33m'
T_CO_GREEN='\e[1;32m'
T_CO_BLUE='\e[1;34m'
T_CO_GRAY='\e[1;30m'
T_CO_NC='\e[0m'

CURRENT_PROGRESS=0

function script_print()
{
  echo -ne "$T_CO_BLUE[SCRIPT]$T_CO_NC$1"
}

function script_print_notify()
{
  echo -ne "$T_CO_BLUE[SCRIPT]$T_CO_NC$T_CO_GREEN-Notify- $1$T_CO_NC"
}

function script_print_error()
{
  echo -ne "$T_CO_BLUE[SCRIPT]$T_CO_NC$T_CO_RED-Error- $1$T_CO_NC"
}

function error_exit()
{
  script_print_error "$1\n\n"
  exit 1
}




#==
#   Starting Code in below.
#/

if [[ $EUID -eq 0 ]]; then
  error_exit "This script must be run as USER!"
fi


##======================
#-- Cursor
git clone https://github.com/varlesh/oreo-cursors.git $HOME/Documents/oreo-cursors/
cd $HOME/Documents/oreo-cursors/
ruby generator/convert.rb || error_exit "Installation Faild... ruby needed."
make build
sudo make install


##======================
#-- Openbox
cp -rf $HOME/Documents/openbox-dotfiles/.themes $HOME/ || cp -rf ~/.config/.themes $HOME/


##======================
#-- GTK
wget https://github.com/catppuccin/gtk/releases/download/v0.4.3/Catppuccin-Frappe-Standard-Maroon-Dark.zip
unzip Catppuccin-Frappe-Standard-Maroon-Dark.zip -d $HOME/Documents/catppuccin-gtk/
cp -rf $HOME/Documents/catppuccin-gtk/Catppuccin-Frappe-Standard-Maroon-Dark $HOME/.themes/
rm Catppuccin-Frappe-Standard-Maroon-Dark.zip


##======================
#-- Icons
sudo pacman -S papirus-icon-theme


##======================
#-- END
cd $HOME
script_print_notify "All successfully done.\n"
