#!/bin/bash

RUN=1
ORIGINAL=$(gsettings get org.gnome.desktop.interface cursor-size)

function getX(){
    local  __resultvar=$1
    local  myresult=$(xdotool getmouselocation | cut -d" " -f 1 | cut -d":" -f 2)
    eval $__resultvar="'$myresult'"
}

function getY(){
    local  __resultvar=$1
    local  myresult=$(xdotool getmouselocation | cut -d" " -f 2 | cut -d":" -f 2)
    eval $__resultvar="'$myresult'"
}

function calculateDistance() {
    local __result=$1
    getX X1
    getY Y1
    sleep 0.02
    getX X2
    getY Y2
    SQUARE=$(bc <<< "($X1- $X2)*($X1- $X2) + ($Y1 - $Y2)*($Y1 - $Y2)")
    DISTANCE=$(bc <<< "sqrt($SQUARE)")
    eval $__result="$DISTANCE"
}

function sleepMode(){
  SLEEP=0
  while [ $SLEEP -lt 1 ]
  do
    sleep 0.5
    calculateDistance SLEEP
  done
}

while [ $RUN -gt 0 ]
do
    i=0
    PASS=0
    SLEEPMODE=0
    while [ $i -lt 5 ]
    do
      calculateDistance DISTANCE
      if [ $DISTANCE -eq 0 ]; then
        ((SLEEPMODE++))
      fi
      if [ $SLEEPMODE -eq 4 ]; then
        sleepMode
      fi
      if [ $DISTANCE -gt 100 ]; then
        ((PASS++))
      fi
      ((i++))
    done

    if [ $PASS -gt 3 ]; then
      gsettings set org.gnome.desktop.interface cursor-size 115
      sleep 1
      gsettings set org.gnome.desktop.interface cursor-size $ORIGINAL
    fi

done
