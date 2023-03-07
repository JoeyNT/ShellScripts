#!/bin/bash/

#Author: JoeyNT
#Date: 02/19/2019

echo ""
date
echo ""

DIGIT="^[0-9]+$"

case $1 in
  -n )
if [[ -z "$2" ]]; then
        echo ""
elif ! [[ $2 =~ $DIGIT ]]; then
        echo " Is NOT a Number"
        echo " "
else    
    echo "The number of people in $2 is:"
    grep -i "^c$2:" /etc/group |tr "," " " | wc -w
    echo " " 
fi

if [[ -z "$3" ]]; then
        echo ""
elif ! [[ $3 =~ $DIGIT ]]; then
        echo " Is NOT a Number"
        echo " "
else
    echo "The number of people in $3 is:"
    grep -i "^c$3:" /etc/group |tr "," " " | wc -w
    echo " "
fi

if [[ -z "$4" ]]; then
        echo ""
elif ! [[ $4 =~ $DIGIT ]]; then
        echo " Is NOT a Number"
        echo " "
else
    echo "The number of people in $4 is:"
    grep -i "^c$4:" /etc/group |tr "," " " | wc -w
    echo " " 
fi    
    ;;
 -t )
if [[ -z "$2" ]]; then
        echo ""
elif ! [[ $2 =~ $DIGIT ]]; then
        echo " Is NOT a Number"
        echo " "
else
    echo "The teacher from $2 is:"
    grep -i "^c$2:" /etc/group |tr "," "\n " | head -n 1 |tr ":" "\n" | tail -n 1  
    echo " "  
fi

if [[ -z "$3" ]]; then
        echo ""
elif ! [[ $3 =~ $DIGIT ]]; then
    echo " Is NOT a Number"
    echo " "
else
    echo "The teacher from $3 is:"
    grep -i "^c$3:" /etc/group |tr "," "\n " | head -n 1 |tr ":" "\n" | tail -n 1
    echo " " 
fi    
if [[ -z "$4" ]]; then
        echo ""
elif ! [[ $4 =~ $DIGIT ]]; then
    echo " Is NOT a Number"
    echo " "
else
    echo "The teacher from $4 is:"
    grep -i "^c$4:" /etc/group |tr "," "\n " | head -n 1 |tr ":" "\n" | tail -n 1
    echo " " 
fi    
    ;;
    * )
if [[ -z "$1" ]]; then
        echo ""
elif ! [[ $1 =~ $DIGIT ]]; then
        echo " Is NOT a Number"
        echo " "
else
    echo "The people in $1 are:"
    grep -i "^c$1:" /etc/group |tr "," "\n " |tr ":" "\n" | tail -n +4
    echo " " 
fi

if [[ -z "$2" ]]; then
        echo ""
elif ! [[ $2 =~ $DIGIT ]]; then
        echo " Is NOT a Number"
        echo " "
else    
    echo "The people in $2 are:"
    grep -i "^c$2:" /etc/group |tr "," "\n " |tr ":" "\n" | tail -n +4
    echo " " 
fi

if [[ -z "$3" ]]; then
        echo ""
elif ! [[ $3 =~ $DIGIT ]]; then
        echo " Is NOT a Number"
        echo " "
else 
    echo "The people in $3 are:"
    grep -i "^c$3:" /etc/group |tr "," "\n " |tr ":" "\n" | tail -n +4
fi
    ;;
esac
(END)

