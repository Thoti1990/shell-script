#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo "Script started exequting at $TIMESTAMP " &>> $LOGFILE

VALIDATION(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR:: $2.. $R FAILED $N"
        exit 1
    else
        echo "$2..  $G SUCCESS $N"
    fi
}

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo " $R ERROR:: Please run the script with root user $N"
    exit 1
else
    echo "your are in root user"
fi

yum install git -y &>> $LOGFILE

VALIDATION $? "Installing GIT"

yum install mysql -y &>> $LOGFILE

VALIDATION $? "Installing MySQL"
