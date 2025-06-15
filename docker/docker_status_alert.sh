#!/bin/bash

EMAIL="manojdevopstest@gmail.com"
SUBJECT="Docker Service alert..!!!"
RESTART_SUBJECT="Docker service restart attempted.."

#Get the docker status and version and time

dockerStatus=$(systemctl is-active docker)
dockerVersion=$(docker --version | awk '{print $3}' | tr -d ",")
cdate=$(date)


#print the varibales

echo "Current time is   :$cdate"
echo "Current Docker version is :$dockerVersion"
echo "Status of docker is  :$dockerStatus"

#If docker is not active send an email

if [[ "$dockerStatus" != "active" ]]; then 
 MESSESGE="ALERT..!!! DOCKER service is not healthy.\n\nVersion:$dockerVersion\n Date: $cdate"
 echo -e "$MESSESGE" | mail -s "$SUBJECT" "$EMAIL"
 echo "Docker is not active email is sent"

 sleep 5

 sudo systemctl restart docker

 sleep 5

 #Refresh the date and recheck docker 
 restartTime=$(date)
 newStatus=$(systemctl is-active docker)
 RESTART_MESSAGE="Docker restart attempted and its succusefull\n\n restarted_time=$restartTime \n\nNewStatus=$newStatus"
 echo -e "$RESTART_MESSAGE" | mail -s "$RESTART_SUBJECT" "$EMAIL"
 echo "Docker restarted and sent email"
else
 echo "Docker is running normally"
fi
