# jbep3 scripts and configs

## System configuration

I've used Ubuntu 20.04 on a Hetzner VPS with 3 cores on an AMD CPU and 4 GB RAM. JBEP developers recommend using a high-frequency CPU, which the VPS probably does not offer, but I had no issues with 16 players at peak times. But keep in mind that killbox on deathmatch mode is a fairly simple configuration compared to the other available maps and modes in JBEP. 

### Automations

Configured [Ubuntu auto-updates](https://help.ubuntu.com/community/AutomaticSecurityUpdates), and enabled reboot if needed, set reboot time to 3 at night.

A cronjob starts SRCDS after boot and also restarts the server every night. The game server updates itself (see next chapter below).

Relevant crontab lines:

```
SHELL=/bin/bash
@reboot sleep 60 && /home/steam/start_jbep3.sh
0 5 * * * /home/steam/stop_jbep3.sh && /home/steam/start_jbep3.sh
```

## SRCDS Installation

Install the game server using [SteamCMD](https://developer.valvesoftware.com/wiki/SteamCMD) like you would with any other Source game server, using app id `869800`. There is also a very good guide on the Steam Community: [Jabroni Brawl: Episode 3 - The Dedicated Server Guide](https://steamcommunity.com/sharedfiles/filedetails/?id=1527732439)

Create a GSLT Token on the [Steam Game Server Account Management](https://steamcommunity.com/dev/managegameservers) for use in the start script. 

## Starting and Stopping SRCDS

My start and stop scripts rely on `screen`, which you might have to install with `apt-get screen`.

Add your server's public IP and your GSLT token into [`start_jbep3.sh`](start_jbep3.sh).

* Use `start_jbep3.sh` to start the server. If a game update is released, SteamCMD will use [`srcds_autoupdate.txt`](srcds_autoupdate.txt) to update the server automatically using the `-autoupdate -steamcmd_script` switches.
* Use `stop_jbep3.sh` to stop the server.
* Use `update_jbep3.sh` to manually update the server.

## Jabroni Brawl Configs 

Find the config files for your game server, in my case at `~/.steam/steamcmd/jbep3_server/jbep3`. 

Update `admin.txt` with your SteamID. 

Copy `mapcycle_killbox.txt` into that folder, it contains a modified `mapcycle.txt` with only one map. Just modifying `mapcycle.txt` may lead to it being overwritten when a new game update is released. The mapcycle file is specified in `server.cfg` via `mapcyclefile mapcycle_killbox.txt`.

Server config file [`server.cfg`](server.cfg) contains all the settings to restrict the game mode to deathmatch, disables the modifiers, disables map and game mode voting and some other things. 
