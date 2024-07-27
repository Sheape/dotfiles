#!/usr/bin/env bash
#set -euo pipefail

# Because certain programs like to insert their own newlines and messed up my format (im looking at you thunderbird)
# We need to crunch each input to ensure that each component is its own line in the log file

crunch_appname=$(echo "$1" | sed '/^$/d')
crunch_summary=$(echo "$2" | sed '/^$/d' | xargs)
crunch_body=$(echo "$3" | sed '/^$/d' | xargs)
crunch_icon=$(echo "$4" | sed '/^$/d')
crunch_urgency=$(echo "$5" | sed '/^$/d')
timestamp=$(date +"%I:%M %p")

echo -en "$timestamp\n$crunch_urgency\n$crunch_icon\n$crunch_body\n$crunch_summary\n$crunch_appname\n" >> /tmp/dunstlog
