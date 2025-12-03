#!/bin/bash
clear
echo Hello, what is your name?

 read a
 clear
 echo Hello $a. So tell me, in which year were you born?
 read YOB 
 clear
age=`expr 2025 - $YOB`
 
 echo 

 if [ $age -gt 25 ]
  then
  echo You are qualified to come to the night party
  
  else
  echo Go and play with the newbies
 fi
echo

echo But you still have one more chance to come with us. 
echo
echo  Are you ready $a
echo y/n
clear
read b
if [ $b == 'y' ]
then


echo That is couragous. Be brave by answering the question below.
echo  34/2
ans= `expr 32 / 2` 
echo  Input your response
      read c
        if [ $c -eq $ans ]
        then 

        echo '*********************************'
        echo CONGRATULATIONS $a, YOU ARE COMING WITH US
        echo '*********************************'
        else
        echo Oups..
        fi
elif [ $b == 'n' ]
then 
echo Okay, chill with the newbies
else
echo Invalid Input
fi

echo '==============================
      END OF PROGRAM'


