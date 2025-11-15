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

echo -e "$Y This script installs Jenkins and required dependencies on Amazon Linux 2023 $N"

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
echo -e "$Y Installing wget and git... $N"
yum install wget git -y &>>$LOGFILE
VALIDATE $? "wget and git installation"

echo -e "$Y Adding Jenkins repo... $N"
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo &>>$LOGFILE
VALIDATE $? "Jenkins repo added"

echo -e "$Y Importing Jenkins GPG key... $N"
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key &>>$LOGFILE
VALIDATE $? "Jenkins GPG key imported"

echo -e "$Y Upgrading system packages... $N"
yum upgrade -y &>>$LOGFILE
VALIDATE $? "System packages upgraded"

echo -e "$Y Installing fontconfig and Java 21 OpenJDK... $N"
yum install fontconfig java-21-openjdk -y &>>$LOGFILE
VALIDATE $? "fontconfig and Java installed"

echo -e "$Y Installing Jenkins... $N"
yum install jenkins -y &>>$LOGFILE
VALIDATE $? "Jenkins installed"

echo -e "$Y Reloading systemd daemon... $N"
systemctl daemon-reload &>>$LOGFILE
VALIDATE $? "systemd daemon reloaded"

echo -e "$Y Enabling Jenkins service... $N"
systemctl enable jenkins &>>$LOGFILE
VALIDATE $? "Jenkins enabled"

echo -e "$Y Starting Jenkins service... $N"
systemctl start jenkins &>>$LOGFILE
VALIDATE $? "Jenkins started"

echo -e "$Y Checking Jenkins service status... $N"
systemctl status jenkins --no-pager &>>$LOGFILE
VALIDATE $? "Jenkins status verified"

echo -e "$G ✅ Jenkins installation completed successfully! $N"
echo -e "$Y Logs saved to: $LOGFILE $N"
