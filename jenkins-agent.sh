#!/bin/bash

# ------------------ Colors ------------------
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# ------------------ Variables ------------------
USERID=$(id -u)
DATE=$(date +%F-%H-%M-%S)
LOGSDIR=/tmp
SCRIPT_NAME=$(basename "$0")
LOGFILE=$LOGSDIR/$SCRIPT_NAME-$DATE.log

echo -e "$Y This script installs Git and Java (for Jenkins agent) on Amazon Linux 2023 $N"

# ------------------ Root Check ------------------
if [[ "$USERID" -ne 0 ]]; then
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1
fi

# ------------------ Validation Function ------------------
VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$2 ... $R FAILURE $N"
        echo -e "$R Check log: $LOGFILE $N"
        exit 1
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi
}

# ------------------ Script Starts ------------------
echo -e "$Y Installing Git... $N"
yum install git -y &>>$LOGFILE
VALIDATE $? "Git installation"

echo -e "$Y Installing Java 21 OpenJDK... $N"
yum install java-21-openjdk -y &>>$LOGFILE
VALIDATE $? "Java installation"

echo -e "$G ✅ Jenkins agent prerequisites installed successfully! $N"
echo -e "$Y Logs saved to: $LOGFILE $N"
