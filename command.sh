#!bin/bash

VAR1=$(date +%s)
sleep 5
VAR2=$(date +%s)
TOTAL=$(($VAR1-$VAR2))
echo "$TOTAL"
