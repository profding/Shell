#! /bin/sh

echo "Please enter a score."
read score

if [ -z "$score" ];then
	echo "You enter nothing. Please enter a score."
	read score
else
	if [ "$score" -gt 100 -o "$score" -lt 0 ];then
		echo "The score should be between 0 and 100.Please enter again."
		read score
	else
		if [ "$score" -ge 90 ];then
			echo "The grade is A."
		elif [ "$score" -ge 80 ];then
			echo "The grade is B."
		elif [ "$score" -ge 70 ];then
			echo "The grade is C."
		elif [ "$score" -ge 60 ];then
			echo "The grade is D."
		else
			echo "The grade is E."
		fi
	fi
fi
