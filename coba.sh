#!/usr/bin/expect
spawn sudo apt-get update
expect "password"
send "y\n"
interact

