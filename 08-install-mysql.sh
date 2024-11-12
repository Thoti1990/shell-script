#!/bin/bash

ID=$( id  -u)

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run the script with root access"
    exit 1
else
    echo "Your are in root user"
fi

yum install mysql -y

if [ $? -ne 0 ]
then
    echo "ERROR:: Installing Mysql is FAILED"
    exit 1
else
    echo "Installing Mysql SUCCESS"
fi
