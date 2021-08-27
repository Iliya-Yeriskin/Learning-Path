#!/bin/bash

echo "Pulling Nginx Image...."
sudo docker pull nginx
echo "This is the images that installed on the machine:"
sudo docker images
sleep 2.5
echo "Delpoying Nginx containers"
sleep 1.5
echo -n "How many containers: "
count=1
while [ $count -le $many ]
do
	echo "Please Enter port number:"
    for i in `sudo docker ps -a | grep ::: | awk '{print$1}'`
    do
		check="`sudo docker port $i | grep ::: | awk "NR==1" | cut -d ":" -f4`"
        touch ports11.txt
        echo $check >>ports11.txt
    done
    while grep $port ports11.txt
    do
		echo -e "**Sorry this port is used**\n___________________________\nEnter new port number: "
        read port
        continue
    done
    rm ports11.txt
    sudo docker run -d -p $port:80 nginx
    echo "Container #$count Running"
    let count++
done

ip=`ip add | grep eth0 | awk 'NR==2 {print $2}' | cut -d "/" -f1`
echo "Check connectivity\nPlease enter specific port to check:"
sleep 3
sudo curl $ip:$port2