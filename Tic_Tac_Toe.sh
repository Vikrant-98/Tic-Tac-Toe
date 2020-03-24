#!/bin/bash 

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
	computer='X'
elif [[ $temp -eq 1 ]]
then
	player_1='X'
	computer='O'
fi
toss=$((RANDOM%2))
if [[ $toss -eq 0 ]]
then
        player=$player_1
	echo "It'a Player_1 turn"
elif [[ $toss -eq 1 ]]
then
        player=$computer
	echo "It's Computer turn"
fi
count=0
while [[ $count -ne 9 ]]
do
((count++))
	echo ""
	echo "|   ${ar[0]}       ${ar[1]}       ${ar[2]}   |"
	echo "|                 	|"
	echo "|                 	|"
	echo "|   ${ar[3]}       ${ar[4]}       ${ar[5]}   |"
	echo "|                 	|"
	echo "|                 	|"
	echo "|   ${ar[6]}       ${ar[7]}       ${ar[8]}   |"
	echo ""

	if [[ $toss -eq 1  ]]
	then
		index=$(($((RANDOM%8))+1))
	elif [[ $toss -eq 0 ]]
	then
		read -p "Enter the position where you want to insert $player" index
	fi
	if [ ${ar[index-1]} == '-' ]
	then
		ar[index-1]=$player
		if [ $player == 'O' ]
		then
			echo "Turn changed to X"
		else
			echo "Turn changed to O"
		fi
	else
		echo "Invalid Entry!!!!!!!!!!!!!! Position is occupied"
		((count--))
		if [ $toss -eq 0 ]
	        then
        	        ((toss++))
        	elif [ $toss -eq 1 ]
        	then
                	((toss--))
        	fi
	fi
	echo ""
        echo "|   ${ar[0]}       ${ar[1]}       ${ar[2]}   |"
        echo "|                 	|"
        echo "|                 	|"
        echo "|   ${ar[3]}       ${ar[4]}       ${ar[5]}   |"
        echo "|                 	|"
        echo "|                 	|"
        echo "|   ${ar[6]}       ${ar[7]}       ${ar[8]}   |"
        echo ""

	if [ $toss -eq 0 ]
	then
		player=$computer
		((toss++))
	elif [ $toss -eq 1 ]
	then
		player=$player_1
		((toss--))
	fi

done
