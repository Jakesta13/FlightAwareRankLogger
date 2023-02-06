#!/bin/bash
## FlightAware Setup
user=""
feederSiteID=""
## IFTTT Setup
ifttt_event="FlightAware"
ifttt_key=""

### ### ###
while true; do
	data=$(curl --silent "https://flightaware.com/adsb/stats/user/${user}" | grep '{"sites' | sed -e 's/.*var data = //' -e 's/;..script.//' | base64 -)
	input=$(php convertFlightAwareStatsJson.php "${data}" "${feederSiteID}")
	rank=$(echo "${input}" | sed -e 's/ .*//')
	echo "Rank: ${rank}"
	lastCheckIn=$(echo "${input}" | sed -e 's/.* //')
	echo "lastCheckIn: ${lastCheckIn}"
	curl --silent -X POST "https://maker.ifttt.com/trigger/${ifttt_event}/with/key/${ifttt_key}" -d "value1=${rank}&value2=${lastCheckIn}"
	sleep 300
#	sleep 900
done
