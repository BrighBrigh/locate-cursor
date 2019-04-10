#!/bin/bash

RUN=1

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
    sleep 0.05
    getX X2
    getY Y2
    SQUARE=$(bc <<< "($X1- $X2)*($X1- $X2) + ($Y1 - $Y2)*($Y1 - $Y2)")
    DISTANCE=$(bc <<< "sqrt($SQUARE)")
    eval $__result="$DISTANCE"
}

while [ $RUN -gt 0 ]
do
    i=0
    PASS=0

    while [ $i -lt 10 ]
    do
      calculateDistance DISTANCE
      if [ $DISTANCE -gt 300 ]; then
        ((PASS++))
      fi
      ((i++))
    done

    if [ $PASS -gt 5 ]; then
      gsettings set org.gnome.desktop.interface cursor-size 115
      sleep 1
      gsettings set org.gnome.desktop.interface cursor-size 24
    fi

done
