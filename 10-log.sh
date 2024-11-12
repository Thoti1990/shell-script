#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)

LOGFILE="/tmp/$0-$TIMESTAMP.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

echo -e "Script started exequting at $Y $TIMESTAMP $N " &>> $LOGFILE

VALIDATION(){
    if [ $1 -ne 0 ]
    then
        echo -e "ERROR:: $2.. $R FAILED $N"
        exit 1
    else
        echo -e "$2..  $G SUCCESS $N"
    fi
}

ID=$(id -u)

if [ $ID -ne 0 ]
then 
    echo -e " $R ERROR:: Please run the script with root user $N"
    exit 1
else
    echo "your are in root user"
fi

yum install git -y &>> $LOGFILE

VALIDATION $? "Installing GIT"

yum install mysql -y &>> $LOGFILE

VALIDATION $? "Installing MySQL"
