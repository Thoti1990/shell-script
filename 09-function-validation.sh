#!/bin/bash

VALIDATION(){

    if=[ $1 -ne 0 ]
    then 
        echo "ERROR::$2 ... FAILED "
        exit 1
    else
        echo "$2... SUCCESS"
    fi  

}

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run the script with root user"
    exit 1
else
    echo "Your are in root user"
fi

yum install git -y

VALIDATION $? "Installing GIT"

yum install mysql -y

VALIDATION $? "Installing MySQL"