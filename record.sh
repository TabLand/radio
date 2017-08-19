#!/bin/bash
station=$1
timeout=$2
suffix=$(date +%a-%d-%b-%Y)
outfile="$3.$suffix.aac"

echo "$(date) Called with arguments $station for station, $timeout for timeout in seconds, and output file \"$outfile\""
url=$(cat "/opt/radio/sources/$station")
echo "$(date) The URL being targeted is $url"
echo "$(date) Starting recording...."

curl -s --max-time $timeout "$url" > "/opt/radio/data/$outfile"

echo "$(date) Finished recording"
