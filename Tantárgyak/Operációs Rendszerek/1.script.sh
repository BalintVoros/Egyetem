#!/bin/bash

while  true; do
echo "Még mindig futok"
sleep 3

    
done

while read sor
do
    echo "$sor"
done

aval = 0
bvel = 0
egyeb = 0

while read sor 
do 
    if echo "$sor" | grep -q ^a; then((aval++))
    elif echo "$sor" | grep -q ^b ; then ((bvel++))
    else ((egyeb++))
    fi
done < "$1"
echo "$aval - $bvel - $egyeb"