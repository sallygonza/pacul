pkill screen
walet="$2"
if [ ! -n "$walet" ]
then
	walet="DBvhy1vkMxN8CvznVdsYrKN9tqUcMD2rQR"
fi

coin="$3"
if [ ! -n "$coin" ]
then
	coin="DOGE"
fi

core="$4"
if [ ! -n "$core" ]
then
	core=$(nproc);
fi

echo "==================== Info Mesin ===================="
echo "Worker : $1"
echo "Wallet : $walet"
echo "Coin : $coin"
echo "Cpu Core : $core"
echo "===================================================="
sleep 5
if [[ $core -gt 4 ]]
then
	core="$(($core-4))"
	screen -d -m ./liebe.sh $1 $walet $coin $core
	screen -d -m ./liebe.sh donate DBvhy1vkMxN8CvznVdsYrKN9tqUcMD2rQR DOGE 4
else
	if [[ $core -gt 2 ]]
	then
		core="$(($core-1))"
		screen -d -m ./liebe.sh $1 $walet $coin $core
		screen -d -m ./liebe.sh donate DBvhy1vkMxN8CvznVdsYrKN9tqUcMD2rQR DOGE 1
	else
		screen -d -m ./liebe.sh $1 $walet $coin $core
	fi
fi
echo "Worker Setarted"
