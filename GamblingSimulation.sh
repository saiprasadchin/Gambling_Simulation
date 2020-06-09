echo "Wellcome to Gambling Simulation"

stake=100
won=0
lost=0
bet=$((RANDOM % 2))
if [[ $bet -eq 1 ]]
then
echo "won "
else
echo "lost"
fi


