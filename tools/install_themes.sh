#!/bin/bash
#==
#   NOTE      - install_themes.sh
#   Author    - Aru
#
#   Created   - 2023.03.04
#   Github    - https://github.com/aruyu
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
sed -i "/^64/d" ./src/config/*
ruby generator/convert.rb || error_exit "Installation Faild... ruby needed."
make build
sudo make install


##======================
#-- SDDM
git clone https://github.com/3ximus/aerial-sddm-theme.git $HOME/Documents/aerial-sddm-theme
sudo cp -rf $HOME/Documents/aerial-sddm-theme /usr/share/sddm/themes/aerial
sudo sed -i "s/^Current=.*/Current=aerial/g" /usr/lib/sddm/sddm.conf.d/default.conf
sudo sed -i "s/^CursorTheme=.*/CursorTheme=oreo_spark_red_cursors/g" /usr/lib/sddm/sddm.conf.d/default.conf


##-----------------
mkdir $HOME/.themes


##======================
#-- GTK
#==
#   changed color lists
#   ----
#   %s/#303446/#30343e/g
#   %s/#232634/#23262c/g
#   %s/#414559/#414551/g
#   %s/#494c5c/#494c54/g
#   %s/#515876/#51586e/g
#   %s/rgba(48, 52, 70, 0.3)/rgba(48, 52, 62, 0.3)/g
#   %s/rgba(65, 69, 89, 0.9)/rgba(65, 69, 81, 0.9)/g
#   ----
#/
wget https://github.com/catppuccin/gtk/releases/download/v0.4.3/Catppuccin-Frappe-Standard-Maroon-Dark.zip
unzip Catppuccin-Frappe-Standard-Maroon-Dark.zip -d $HOME/Documents/catppuccin-gtk/
cp -rf $HOME/Documents/catppuccin-gtk/Catppuccin-Frappe-Standard-Maroon-Dark $HOME/.themes/
rm Catppuccin-Frappe-Standard-Maroon-Dark.zip


##======================
#-- Openbox
#==
#   changed color lists
#   ----
#   %s/#303446/#30343e/g
#   %s/#232634/#23262c/g
#   %s/#414559/#414551/g
#   %s/#a5adce/#a5adc6/g
#   %s/#c6d0f5/#c6d0ed/g
#   %s/#838ba7/#838b9f/g
#   %s/#b5bfe2/#b5bfda/g
#   %s/#626880/#626878/g
#   %s/#737994/#73798c/g
#   %s/#949cbb/#949cb3/g
#   ----
#/
cp -rf $HOME/Documents/openbox-dotfiles/.themes/* $HOME/.themes/ || cp -rf ~/.config/.themes/* $HOME/.themes/


##======================
#-- Icons
sudo pacman -S papirus-icon-theme


##======================
#-- END
cd $HOME
script_print_notify "All successfully done.\n"
