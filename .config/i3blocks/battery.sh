#!/bin/bash

BAT="BAT1"

CAPACITY="$(cat /sys/class/power_supply/$BAT/capacity)"
STATUS="$(cat /sys/class/power_supply/$BAT/status)"

STATUS_COLOUR=""
STATUS_TEXT=""

if [[ "$STATUS" == "Discharging" ]]
then 
	STATUS_TEXT="BAT"

	if [[ "$CAPACITY" -lt 20 ]]
	then
		STATUS_COLOUR="color='#FFA500'" # orange
	fi
else 
	STATUS_TEXT="CHG"

	if [[ "$CAPACITY" -ne 100 ]]
	then
		STATUS_COLOUR="color='#01A252'" # green`
	fi
fi


echo -e "<span $STATUS_COLOUR>$STATUS_TEXT: $CAPACITY%</span>\n"
