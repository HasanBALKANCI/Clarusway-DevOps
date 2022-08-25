#!/bin/sh
# Purpose: Monitor Linux disk space and send an email alert to $ADMIN
THRESHOLD=30 # alert level 
ADMIN="awsdevopshasan@gmail.com" # dev/sysadmin email ID
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read -r output;
do
  echo "$output"
  usep=$(echo "$output" | awk '{ print $1}' | cut -d'%' -f1 )
  partition=$(echo "$output" | awk '{ print $2 }' )
  if [ $usep -ge $THRESHOLD ]; then
    echo "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)" |
    mail -s "Alert: Disk uses $usep%" "$ADMIN"
  fi
done