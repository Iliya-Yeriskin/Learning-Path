#!/bin/bash


echo -e "Container IP Address: `ip add | grep eth0 | awk 'NR==2 {print $2}' | cut -d "/" -f1`:`sudo docker ps -a | grep -e ::: | cut -d "-" -f3 | awk 'NR==1 {print$2}' | cut -d ":" -f4`\n==================================================" >CONT.txt
echo -e "Container Image ID: `sudo docker ps -a | grep ::: | awk 'NR==1 {print$2}'`\n==================================================" >>CONT.txt
echo -e "Container ID: `sudo docker ps -a | grep ::: | awk 'NR==1 {print$1}'`\n==================================================" >>CONT.txt
echo -e "Container name: `sudo docker ps -a | grep -e ::: | cut -d "-" -f4 | awk 'NR==1 {print$2}' | cut -d ":" -f4`\n==================================================" >>CONT.txt
cat CONT.txt