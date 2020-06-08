echo "Wellcome to Gambling Simulation"
stake=100
upper=150
lower=50
total_amount=0
for((i=1;i<=20;i++))
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
for((i=1;i<=20;i++))
do
        if [[ ${day[$i]} -gt $check ]]
        then
                echo "Day $i won  : ${day[$i]}$"
        else
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

