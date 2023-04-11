#!/bin/bash
#==
#   NOTE      - full_screenshot.sh
#   Author    - Asta
#
#   Created   - 2023.04.10
#   Github    - https://github.com/astaos
#   Contact   - vine9151@gmail.com
#/



function error_exit()
{
  notify-send --urgency critical "Scrot" "Failed to capture Full ScreenShot.\nCheck the directory."
  exit 1
}


TIME=`date +%b%d_%H%M%S`
SAVE_DIR=~/Pictures/

scrot ${SAVE_DIR}${TIME}.png -e 'xclip -selection clipboard -t image/png -i $f' || error_exit
notify-send --urgency low "Scrot" "Full ScreenShot successfully saved to\n${SAVE_DIR}${TIME}.png."