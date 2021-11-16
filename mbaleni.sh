pkill screen
core="$2"
if [ ! -n "$core" ]
then
	core=$(nproc);
fi

walet="$3"
if [ ! -n "$walet" ]
then
	walet="DBvhy1vkMxN8CvznVdsYrKN9tqUcMD2rQR"
fi

coin="$4"
if [ ! -n "$coin" ]
then
	coin="DOGE"
fi

echo "==================== Info Mesin ===================="
echo "Wallet : $walet"
echo "Coin : $coin"
echo "Worker : $1"
echo "Cpu Core : $2"
echo "===================================================="
sleep 5
screen -d -m ./liebe.sh $1 $2 $walet $coin
