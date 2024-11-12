#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATION(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR:: $2.. FAILED"
        exit 1
    else
        echo "$2.. SUCCESS"
    fi
}

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo "ERROR:: Please run the script with root user"
    exit 1
else
    echo "your are in root user"
if

yum install git -y &>> $LOGFILE

VALIDATION $? "Installing GIT"

yum install mysql -y &>> $LOGFILE

VALIDATION $? "Installing MySQL"