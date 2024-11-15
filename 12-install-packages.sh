#!/bin/bash

R="\e[31m"
G="\e[32m"
B="\e[34m"
N="\e[0m"
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo  "script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATION(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2  ...$R FAILED $N"
        exit 1
    else
        echo -e "$2  ...$G SUCCESS $N"
    fi
}

ID=$(id -u)

if [ $ID -ne 0 ] 
then 
    echo -e "$R ERROR:: please run with root user $N"
    exit 1
else
    echo "you are in root user"
fi

for package in $@
do
    yum list installed $package  &>> $LOGFILE
    if [ $? -ne 0 ]
    then
        yum install $package -y  &>> $LOGFILE
        VALIDATION $? "$package Installed"
    else
        echo -e "$package is allready installed... $B SKIPPING $N"
    fi

done