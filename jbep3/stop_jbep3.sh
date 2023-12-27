#!/bin/bash
echo Sending quit to screen
screen -S jbserver -X quit
echo Waiting 30 seconds
sleep 30
#echo Sending kill signal
#killall -e srcds_linux
echo Done
