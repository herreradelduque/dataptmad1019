#!/bin/bash

echo 'I have created a variable with my name: '


name='-- Víctor --'


echo $name


echo '...and I have created the directory  "Bonus" too'


mkdir Bonus


rm -rf Bonus/


echo '...but, unfortunately I have deleted it right now!...sorry'


cd lorem/


echo ----------

for i in $( ls ); do

	echo $i

	echo -n $i | wc -c
	
	cadena1=$(echo -n $i | wc -c)  
	
	cadena2="lorem has $cadena1  characters lenght"
	
	echo $cadena2
	echo ------
done


htop


ps -eo args

sysctl -n machdep.cpu.brand_string


