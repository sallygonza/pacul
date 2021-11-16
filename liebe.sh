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
cd liebe && ./liebe -a verus -o stratum+tcp://verushash.mine.zergpool.com:3300 -u $walet.$1 -p c=$coin -t $core
