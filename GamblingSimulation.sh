echo "Wellcome to Gambling Simulation"


stake=100
upper=150
lower=50

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
echo "satke of  $ $stake"

