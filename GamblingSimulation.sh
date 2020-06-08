echo "Wellcome to Gambling Simulation"
upper=150
lower=50
total_amount=0
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
MAX=0 #${day[0]}
MIN= #${day[0]}
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
