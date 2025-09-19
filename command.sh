#!bin/bash

VAR1=$(date +%s)
sleep 5
VAR2=$(date +%s)
TOTAL=$(($VAR2-$VAR1))
echo "$TOTAL"
