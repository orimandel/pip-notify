#!/bin/bash

ID=$1 # project ID
TOKEN=$2 # access token

SHORT_NOTIF=3000 # miliseconds
LONG_NOTIF=8000 # miliseconds
DEBUG="-s" # add -s for slience, leave blank to print output

# Check credentials entered:
if [[ $ID == "yourid" ]]; then
  notify-send "ENTER YOUR USER ID"
  break 2
fi
if [[ $TOKEN == "yourtoken" ]]; then
  notify-send "ENTER YOUR ACCESS TOKEN"
  break 2
fi

while true; do
  output=$(curl $DEBUG --header "PRIVATE-TOKEN: $TOKEN" "https://gitlab.com/api/v4/projects/$ID/pipelines" | jq '.[0] | .status')
  
  if [[ "$output" == "\"running\"" ]]; then
    notify-send -t $SHORT_NOTIF "Pipeline running!" "$(curl $DEBUG --header "PRIVATE-TOKEN: $TOKEN" "https://gitlab.com/api/v4/projects/$ID/pipelines" | jq '.[0] | .web_url')"
    
    while true; do
      output=$(curl $DEBUG --header "PRIVATE-TOKEN: $TOKEN" "https://gitlab.com/api/v4/projects/$ID/pipelines" | jq '.[0] | .status')
      
      if [[ "$output" != "\"running\"" ]]; then
        notify-send -t $LONG_NOTIF "Pipeline $output!" "$(curl $DEBUG --header "PRIVATE-TOKEN: $TOKEN" "https://gitlab.com/api/v4/projects/$ID/pipelines" | jq '.[0] | .web_url')"
        break
      fi
      
      sleep .1
    done
  fi
  
  sleep .1
done

