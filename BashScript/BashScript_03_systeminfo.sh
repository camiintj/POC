#!/bin/bash

echo "Welcome $USER on $HOSTNAME."
echo "########################################"

FREE_RAM=$(free -m | grep Mem | awk '{print $4}')
LOAD=$`uptime | awk '{print $9}'`
ROOTFREE=$(df -h | grep '/dev/vda2' | awk '{print $4}')

echo "###########################################"
echo "Memoria disponivel $FREE_RAM mb."
echo "###########################################"
echo "Atual Load Average $LOAD"
echo "###########################################"
echo "Espaço livre $ROOTFREE"

