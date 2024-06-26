#!/bin/bash

function fuggveny() {
    echo "$1"
    
}
fuggveny "Bela"

function sum {
    let sum = $1+$2
    echo $sum
}
sum 2 3

mkdir mappa
if [[$? -eq 0]] ; then
    echo "Sikeres"
else
    echo "Sikertelen"
    exit
fi

osszeg=0
valtozo=0

while true do
    let valtozo=$valtozo + 1
    echo "aktuális változó: $valtozo"

    if [[$osszeg -ge 100]] ; then
        break
    fi

    let maradek = $valtozo%5
    if [[maradek -eq 0]] ; then
        continue
    fi

    let osszeg=$osszeg+$valtozo
    echo "Aktuális összeg $osszeg"
done

echo $osszeg
    
done

    
