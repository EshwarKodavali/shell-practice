#!bin/bash
ADDRESS=$1
SUBJECT=$2
TO_TEAM=$3
ALERT_TYPE=$4
IP_ADDRESS=$5
MAIN_BODY=$6
FORMATTED_BODY=$(printf '%s\n' "$MAIN_BODY" | sed -e 's/[]\/$*.^[]/\\&/g')
TEMPLATE_BODY=$(sed -e "s/TO_TEAM/$TO_TEAM/g" -e "s/ALERT_TYPE/$ALERT_TYPE/g" -e "s/IP_ADDRESS/$IP_ADDRESS/g" -e "s/MESSAGE/$FORMATTED_BODY/g" template.html )


{
echo "To: $ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$TEMPLATE_BODY"
} | msmtp "$ADDRESS"