core="$1"
if [[ $core -gt 4 ]]
then
	echo "> 4"
else
	if [[ $core -gt 2 ]]
	then
		echo "> 2"
	else
		echo "< 2"
	fi		
fi
