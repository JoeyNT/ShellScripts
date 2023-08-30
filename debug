#!/bin/bash

declare -i setvar=666
echo "enter a number"
read mynum;

function specialnum()
{
        declare -i result
        result=$mynum*$setvar
        echo "$result"
}

specialnum

ctrlc_count=0

function no_ctrlc()
{
    let ctrlc_count++
    echo
    if [[ $ctrlc_count == 1 ]]; then
        echo "Stop process."
    elif [[ $ctrlc_count == 2 ]]; then
        echo "Once more and I quit."
    else
        echo "That's it.  I quit."
        exit
    fi
}

function guesswht()
{
        echo "Guess the multyplier of you entry"
        read anum

        until [ $anum = "666" ]
        do
          	echo "Guess the multyplier of you entry"
                read anum
                trap no_ctrlc SIGINT
                if [ -z $anum ]; then
                        echo "you have to enter a number"
                        echo "to quit Ctrl-C"
                        exec 2> /dev/null
                fi
        done
}
function extfile()
{
        echo "enter a file and I will output the extention"
        read fext
        if [ -f $fext ]; then
                ls $fext | cut -f 2- -d '.'
        fi
}

fu
nction no_ext()
{
        echo "enter a file I will output the base"
        read noext
        echo $noext | rev | cut -f 2- -d '.' | rev
}

guesswht
clear

alias somefun='$specialnum'
alias setthat='$guesswhr'
alias that='$clear'

somefun
setthat
that

extfile

no_ext

exit
