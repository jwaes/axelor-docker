#!/bin/bash

if grep -q "^$1[\s]*" $3
then
        sed -i "s|$1 *=.*|$1 = $2|" $3
else
        echo "$1 = $2" >> $3
fi

sed -i "s:#.*$::g" $3
sed -i "/^$/d" $3
sort -o $3 $3