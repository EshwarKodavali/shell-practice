#!bin/bash

if [ $(id -u) -eq 0 ]; then
    echo "it is a root access you can proceed"
else
    echo "Need to run with root access"
    exit 1
fi

dnf install mysql -y

if [ $? -eq 0 ]; then
    echo "Installation is success"
else
    echo "Installation is failed"
fi