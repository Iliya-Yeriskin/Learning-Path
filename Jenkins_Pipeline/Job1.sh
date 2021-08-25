#!/bin/bash

echo "Creating new user: net4u"
sleep 2
sudo useradd net4u
echo "User net4u created..."
sudo mkdir net4u
echo "made a folder net4u"
sleep 1
echo "Adding net4u user to sudo group"
sleep 1
sudo usermod -aG sudo net4u
sleep 1
echo "User net4u Added to sudo group"
echo "Creating 5 files inside net5u folder and tgz them"
cd net4u ; for i in {1..5} ; do sudo touch $i.txt ; sleep 1 ; echo "Created file #$i" ; done
sudo tar -zcf net4u.tgz *.txt ; sudo rm *.txt
sleep 1.5
echo "Done making files and compressing them to tgz"
echo "This is the files in the folder:"
pwd
ls -lh