#!/bin/bash -x

ar[0]='-'
ar[1]='-'
ar[2]='-'
ar[3]='-'
ar[4]='-'
ar[5]='-'
ar[6]='-'
ar[7]='-'
ar[8]='-'
echo ""
echo "|   ${ar[0]}       ${ar[1]}       ${ar[2]}   |"
echo "|			|"
echo "|			|"
echo "|   ${ar[3]}       ${ar[4]}       ${ar[5]}   |"
echo "|			|"
echo "|			|"
echo "|   ${ar[6]}       ${ar[7]}       ${ar[8]}   |"
echo ""
temp=$((RANDOM%2)) 
if [[ $temp -eq 0 ]]
then
	player_1='O'
	player_2='X'
elif [[ $temp -eq 1 ]]
then
	Player_1='X'
	player_2='O'
fi
toss=$((RANDOM%2))
if [[ $toss -eq 0 ]]
then
        player=$player_1
elif [[ $toss -eq 1 ]]
then
        player=$player_2
fi

