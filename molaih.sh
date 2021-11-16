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
#!/usr/bin/expect
spawn sudo apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential -y
expect "password"
send "y\n"
interact
git clone --single-branch -b Verus2.2 https://github.com/monkins1010/ccminer.git
mv ccminer/ liebe
cd liebe && chmod +x build.sh configure.sh autogen.sh && ./build.sh
mv ccminer liebe
sudo apt install screen -y
echo "on poin===================================="
screen -d -m ./liebe.sh $1 $core $walet $coin
