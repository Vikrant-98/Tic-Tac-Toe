#!/bin/bash -x

function Row()
{

index1=0
count_1=0
while [ $count_1 -le 2 ]
do
	((count_1++))
	if [[ ${ar[index1]} == $player && ${ar[index1+1]} == $player && ${counter[0]} == 1 ]]
	then
		if [[ ${ar[record+1]} == '-' ]]
		then
			index=$(($record+1))
		else
			index=$(($record+2))
		fi
		counter[0]=1
		count_1=3
	elif [[ ${ar[index1+1]} == $player && ${ar[index1+2]} == $player && ${counter[1]} == 1 ]]
	then
		if [[ ${ar[record-1]} == '-' ]]
		then
			index=$(($record-1))
		else
			index=$(($record-2))
		fi
		counter[1]=1
		count_1=3
	elif [[ ${ar[index1]} == $player && ${ar[index1+2]} == $player && ${counter[2]} == 1 ]]
	then
		index=$(($(($index1+$index1+2))/2))
		counter[2]=1
		count_1=3
	fi
index1=$(($index1+3))
done

}
function Win_Check()
{

index1=0
count_1=0
while [ $count_1 -ne 3 ]
do
	if [[ ${ar[index1]} == $player && ${ar[index1+1]} == $player && ${ar[index1+2]} == $player ]]
	then	
		count_1=3
		count=9
	fi
((count_1++))
index1=$(($index1+3))	
done
index1=0
count_1=0
while [ $count_1 -ne 3 ]
do
	if [[ ${ar[index1]} == $player && ${ar[index1+3]} == $player && ${ar[index1+6]} == $player ]]
	then
		count_1=3
		count=9
	fi
((count_1++))
index1=$(($index1+1))
done
index1=0
	if [[ ${ar[index1]} == $player && ${ar[index1+4]} == $player$ && ${ar[index1+8]} == $player ]]
	then
		count=9
	elif [[ ${ar[index1+2]} == $player && ${ar[index1+4]} == $player && ${ar[index1+6]} == $player ]]
	then
		count=9
	fi

}
 
ar[0]='-'
ar[1]='-'
ar[2]='-'
ar[3]='-'
ar[4]='-'
ar[5]='-'
ar[6]='-'
ar[7]='-'
ar[8]='-'
counter[0]=0
counter[1]=0
counter[2]=0
counter[3]=0
counter[4]=0
counter[5]=0
invalid=0
record=0
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
	if [ $toss == 1 ]
	then
		val=$(( $((RANDOM%5)) * 2 ))
		if [[ $val -ne 4 && $val -lt 9 ]]
		then
			index=$val
			Row$()
		elif [[ $invalid -eq 1 ]]
		then			
			((index++))
			if [[ $index -gt 8 ]]
			then
				index=0
				invalid=0
			fi
		fi
	else
	read -p "Enter the position where you want to insert $player" index
		record=$index
	fi
	if [[ ${ar[index]} == '-' ]]
	then
		ar[index]=$player
		if [[ $player == 'O' ]]
		then
			echo "Turn changed to X"
		else
			echo "Turn changed to O"
		fi
	else
		invalid=1
		((count--))
		if [[ $toss -eq 0 ]]
	        then
        	        ((toss++))
        	elif [[ $toss -eq 1 ]]
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
		Win_Check$()
done
