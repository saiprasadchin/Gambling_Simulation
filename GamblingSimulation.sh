echo "Wellcome to Gambling Simulation"
start=1
function play(){
	declare -a day
	upper=150
	lower=50
	amount=0
	for((i=1;i<=30;i++))
	do
        	stake=100
        	while [[ $stake -gt $lower && $stake -lt $upper  ]]
        	do

                	bet=$(( RANDOM % 2 ))
                	if [[ $bet -eq 1 ]]
                	then
                        	let "stake+=1"
                	else
                        	let "stake-=1"
                	fi
        	done

		let amount+=$((100 - $stake))
		day[$i]=$amount
	done

	daysWon=0
	daysLost=0


	check=0
	for((i=1;i<=30;i++))
	do
        	if [[ ${day[$i]} -gt $check ]]
        	then
			let daysWon++
                	echo "Day $i won  : ${day[$i]}$"
        	else
			let daysLost++
                	echo "Day $i loss  : ${day[$i]}$"
        	fi
        	check=${day[$i]}
	done

	echo ""
	if [[ $amount -lt 0 ]]
	then
        	echo "Gambler Lost by $amount$"
	else
        	echo "Gambler Won by $amount$"
	fi
	echo "Number of wining days are : $daysWon"
	echo "Number of lossing days are : $daysLost"

	echo
	MAX=0
	MIN=0
	declare -a lucky
	j=0
	k=0
	for (( i=1; i<=30; i++ ))
	do
        	if [[ ${day[$i]} == $MAX ]]
        	then
                	lucky[$j]=$i
                	let j++

        	elif [[ ${day[$i]} -gt $MAX ]]
        	then
			lucky=( )
                	MAX=${day[$i]}
                	j=0
                	lucky[$j]=$(($i))
                	let j++
        	fi

		if [[ ${day[$i]} == $MIN ]]
        	then
                	unlucky[$k]=$i
                	let k++

        	elif [[ ${day[$i]} -lt $MIN ]]
        	then
                	unlucky=( )
                	MIN=${day[$i]}
                	k=0
                	unlucky[$k]=$(($i))
                	let k++
        	fi

	done
	echo
	for key in ${lucky[@]}
	do
		echo "Lukiest day is $key"
	done
	echo
	for key2 in ${unlucky[@]}
	do
        	echo "Unlukiest day is $key2"
	done

}

play

while [[ $start -gt 0 ]]
do

        if [[ $amount -gt 0 ]]
        then
                echo "You won $amount, do you want to continue ?"
                read -p "Press 1 for Yes 2 for No : " continue
                #read continue
                case $continue in
                        1)
                        	play
                        	;;
                        2)
                        	start=-1
                        	break
                        	;;
			*)
				echo "Enter valid input"
				;;
                esac
        else
                start=-1

        fi
done




























