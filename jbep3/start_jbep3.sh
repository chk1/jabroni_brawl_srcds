#!/bin/bash
cd /home/steam/.steam/steamcmd/jbep3_server
screen -dmS jbserver ./srcds_run.sh -game jbep3 -console -ip 123.xx.xx.xx -port 27015 \
       +map jb_killbox +maxplayers 24 +sv_lan 0 +jb_sv_gamemode deathmatch \
       -sv_steamaccount InsertYourGSLTTokenHere \
       -autoupdate -steam_dir /home/steam/.steam/steamcmd/ -steamcmd_script /home/steam/srcds_autoupdate.txt

echo Started screen session "jbserver", use "screen -r jb" to attach back to it.
