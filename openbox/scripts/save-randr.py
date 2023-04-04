#!/usr/bin/env python
"""
 *  NOTE      - save-randr.py
 *  Author    - Asta
 *
 *  Created   - 2023.04.04
 *  Github    - https://github.com/astaos
 *  Contact   - vine9151@gmail.com
"""

import os
import subprocess


def save_screenrc():
  """ Function to Save Screen RC """
  
  xrandr_current = subprocess.run(["xrandr", "--current"], shell=True, text=True, stdout=subprocess.PIPE).stdout
  xrandr_current_list = xrandr_current.split('\n')
  xrandr_connected_index = []
  command = "xrandr"

  for key, value in enumerate(xrandr_current_list):
    if "connected" in value.split(' '):
      xrandr_connected_index.append(key)

  for i in xrandr_connected_index:
    base_value = xrandr_current_list[i].split(' ')
    output_value = base_value[0]

    if base_value[2] == "primary":
      mode_pos_list = base_value[3]
    else:
      mode_pos_list = base_value[2]

    if not mode_pos_list.startswith('('):
      mode_pos_list = mode_pos_list.split('+')
      mode_value = mode_pos_list[0]
      pos_x_value = mode_pos_list[1]
      pos_y_value = mode_pos_list[2]

      command += " --output {0} --mode {1} --pos {2}x{3}".format(output_value, mode_value, pos_x_value, pos_y_value)
      print(mode_pos_list)
    else:
      command += " --output {0} --off".format(output_value)

  print(command)
  home_directory = os.path.expanduser('~')
  script_file = open(home_directory+"/.config/screenrc", 'w')
  script_file.writelines('\n'.join(["#!/bin/bash", "", command]))
  script_file.close()

if __name__ == '__main__':
  try:
    save_screenrc()
  except:
    raise
