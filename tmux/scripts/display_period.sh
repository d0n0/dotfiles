#!/bin/bash

hour=`date +%H%M`

if [ $hour -ge 850 -a $hour -le 1020 ]; then
  echo " 1限"

elif [ $hour -gt 1020 -a $hour -lt 1030 ]; then
  echo " 休み(->2限)"

elif [ $hour -ge 1030 -a $hour -le 1200 ]; then
  echo " 2限"

elif [ $hour -gt 1200 -a $hour -lt 1245 ]; then
  echo " 昼休み"

elif [ $hour -ge 1245 -a $hour -le 1415 ]; then
  echo " 3限"

elif [ $hour -gt 1415 -a $hour -lt 1425 ]; then
  echo " 休み(->4限)"

elif [ $hour -ge 1425 -a $hour -le 1555 ]; then
  echo " 4限"

elif [ $hour -gt 1555 -a $hour -lt 1605 ]; then
  echo " 休み(->5限)"

elif [ $hour -ge 1605 -a $hour -le 1735 ]; then
  echo " 5限"

fi
