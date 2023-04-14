#!/bin/bash
#==
#   NOTE      - grep_screenshot.sh
#   Author    - Aru
#
#   Created   - 2023.04.10
#   Github    - https://github.com/aruyu
#   Contact   - vine9151@gmail.com
#/



function error_exit()
{
  notify-send --urgency critical "Scrot" "Failed to capture Grep ScreenShot.\nCheck the directory."
  exit 1
}


TIME=`date +%b%d_%H%M%S`
SAVE_DIR=~/Pictures/

scrot --select --freeze ${SAVE_DIR}${TIME}.png -e 'xclip -selection clipboard -t image/png -i $f' || error_exit
notify-send --urgency low "Scrot" "Grep ScreenShot successfully saved to\n${SAVE_DIR}${TIME}.png."
