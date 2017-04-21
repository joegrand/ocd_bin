#!/bin/bash

# File...... ocd_bin.sh
# Author.... Joe Grand, @joegrand [www.grandideastudio.com]
# Updated... 20 Apr 2017

# This script takes the ASCII results from OpenOCD's mdw/mdh/mdb commands and converts it
# to a binary image. The address location is stripped from each line before conversion.
# No attempt is made to fill or otherwise handle non-contiguous memory regions.
#
# Usage: ./ocd_bin.sh file_in file_out
#
# Example input:
# 0x00000000: 2e2f3031 3233343536 3738394142 4344454647 48494a4b4c 4d4e4f50 51525354
# 0x00000020: 55565758 595a616263 6465666768 696a6b6c6d 6e6f707172 73747576 7778797a

if [ $# -eq 2 ]; then  # if exactly two arguments exist
  cat "$1"         |     # print file_in to stdout
  sed 's/.*://'    |     # remove all text prior to and including the separator
  xxd -r -p - "$2"       # convert ASCII hex dump into binary, write to file_out
else
  echo "Error: Invalid number of arguments."
fi
