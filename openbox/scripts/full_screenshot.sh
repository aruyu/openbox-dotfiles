#!/bin/bash
#==
#   NOTE      - full_screenshot.sh
#   Author    - Aru
#
#   Created   - 2023.04.10
#   Github    - https://github.com/aruyu
#   Contact   - vine9151@gmail.com
#/



function error_exit()
{
  notify-send --urgency critical "Scrot" "Canceled to capture Full ScreenShot." --icon="accessories-screenshot"
  exit 1
}


TIME=`date +%b%d_%H%M%S`
SAVE_DIR=~/Pictures/

if [[ ! -d "${SAVE_DIR}" ]]; then
  mkdir ${SAVE_DIR}
fi

scrot ${SAVE_DIR}${TIME}.png -e 'xclip -selection clipboard -t image/png -i $f' || error_exit
notify-send --urgency low "Scrot" "Full ScreenShot successfully saved to\n${SAVE_DIR}${TIME}.png." --icon="accessories-screenshot"
