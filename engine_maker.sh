#!/usr/bin/expect
spawn sudo apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential screen -y
expect "password"
send "y\n"
interact
