#!bin/bash

if [ $(id -u) -eq 0 ]; then
    echo "it is a root access you can proceed"
else
    echo "Need to run with root access"
    exit 1
fi

VALIDATE(){
    if [ $? -eq 0 ]; then
        echo "Installation for $1 is success"
    else
        echo "Installation for $1 is failed"
    fi
}

dnf list installed mysql
if [ $? -nq 0 ]; then
    dnf install mysql -y
    VALIDATE "mysql"
else
    echo "Installation is already done"
fi

dnf list installed nginx
if [ $? -nq 0 ]; then
    dnf install nginx -y
    VALIDATE "nginx"
else
    echo "Installation is already done"
fi

dnf list installed python3
if [ $? -nq 0 ]; then
    dnf install python3 -y
    VALIDATE "python3"
else
    echo "Installation is already done"
fi


