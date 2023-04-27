#!/bin/sh

# This script displays battery icon according to the charge level and charging state

# Author: Piotr Miller
# e-mail: nwg.piotr@gmail.com
# Website: http://nwg.pl
# Project: https://github.com/nwg-piotr/tint2-executors
# License: GPL3

# Dependencies: `acpi`

bat=$(acpi -b)
state=$(echo ${bat} | awk '{print $3}')
svg_dir=$HOME/.config/tint2/images

if [[ "$state" = "Not" ]]; then
  level=$(echo ${bat} | awk '{print $5}')
  level=${level::-1}

else
  level=$(echo ${bat} | awk '{print $4}')
  if [[ "$state" == *"Unknown"* ]]; then
    level=${level::-1}
  else
    if [[ "$level" == "100%" ]]; then
      level=${level::-1}
    else
      level=${level::-2}
    fi
  fi
fi

if [[ "$bat" == *"until"* ]]; then

  if [[ "$level" -ge "95" ]]; then
    echo ${svg_dir}/bat-full-charging.svg
  elif [[ "$level" -ge "75" ]]; then
    echo ${svg_dir}/bat-threefourth-charging.svg
  elif [[ "$level" -ge "35" ]]; then
    echo ${svg_dir}/bat-half-charging.svg
  elif [[ "$level" -ge "15" ]]; then
    echo ${svg_dir}/bat-quarter-charging.svg
  else
    echo ${svg_dir}/bat-empty-charging.svg
  fi
else
  if [[ "$level" -ge "95" ]]; then
    echo ${svg_dir}/bat-full.svg
  elif [[ "$level" -ge "75" ]]; then
    echo ${svg_dir}/bat-threefourth.svg
  elif [[ "$level" -ge "35" ]]; then
    echo ${svg_dir}/bat-half.svg
  elif [[ "$level" -ge "15" ]]; then
    echo ${svg_dir}/bat-quarter.svg
  else
    echo ${svg_dir}/bat-empty.svg
  fi
fi
if  [[ $1 = "-l" ]]; then
    echo ${level}%
fi
