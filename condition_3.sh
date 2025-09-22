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
dnf install mysql -y
VALIDATE "mysql"

dnf install nginx -y
VALIDATE "nginx"

dnf install python3 -y
VALIDATE "python"

