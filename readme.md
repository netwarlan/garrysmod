# Garry's Mod | Prop hunt

[![Build](https://img.shields.io/github/actions/workflow/status/netwarlan/garrysmod/build.yaml)](https://github.com/netwarlan/garrysmod/actions)
[![Release](https://img.shields.io/github/v/release/netwarlan/garrysmod)](https://github.com/netwarlan/garrysmod/releases)
[![Discord](https://img.shields.io/badge/Discord-Join-5865F2?logo=discord&logoColor=white)](https://discord.gg/QtqKW9xvzK)

The following repository contains the source files for building a Garry's Mod Prop hunt server.


### Running
To run the container, issue the following example command:
```
docker run -d \
-p 27015:27015/udp \
-p 27015:27015/tcp \
-e GMOD_SERVER_HOSTNAME="Garrys Mod | Prophunt" \
ghcr.io/netwarlan/garrysmod
```

### Downloading Game Files Only
To pre-download game files without starting the server (useful for pre-populating volumes):
```
docker run --rm -v gmod-data:/app/gmod \
-e GMOD_SERVER_UPDATE_ONLY_THEN_STOP=true \
ghcr.io/netwarlan/garrysmod
```

To download and validate game files:
```
docker run --rm -v gmod-data:/app/gmod \
-e GMOD_SERVER_VALIDATE_ONLY_THEN_STOP=true \
ghcr.io/netwarlan/garrysmod
```

### Environment Variables
We can make dynamic changes to our Garry's Mod containers by adjusting some of the environment variables passed to our image.

Below are the ones currently supported and their (defaults):

Environment Variable | Default Value
-------------------- | -------------
GMOD_SERVER_PORT | 27015
GMOD_SERVER_MAXPLAYERS | 12
GMOD_SERVER_MAP | ph_office
GMOD_SERVER_HOSTNAME | Garrys Mod \| Prophunt
GMOD_SVLAN | 0
GMOD_SERVER_PW | No password set
GMOD_SERVER_RCONPW | No password set
GMOD_SERVER_UPDATE_ON_START | true
GMOD_SERVER_VALIDATE_ON_START | false
GMOD_SERVER_UPDATE_ONLY_THEN_STOP | false
GMOD_SERVER_VALIDATE_ONLY_THEN_STOP | false
GMOD_SERVER_REMOTE_CFG | Not set
GMOD_WORKSHOP_COLLECTION | 177117131
GMOD_SERVER_CONFIG | server.cfg
GMOD_GAMEMODE | prop_hunt

Gameplay Variables | Default Value
-------------------| -------------
PH_HUNTER_FIRE_PENALTY | 10
PH_HUNTER_KILL_BONUS | 100
PH_SWAP_TEAMS_EVERY_ROUND | 1
PH_GAME_TIME | 40
PH_HUNTER_BLINDLOCK_TIME | 30
PH_ROUND_TIME | 300
PH_ROUNDS_PER_MAP | 10
PH_WAITFORPLAYERS | 1
PH_MIN_WAITFORPLAYERS | 2 

Player Variables | Default Value
-----------------| -------------
PH_PROP_CAMERA_COLLISIONS | 1
PH_FREEZECAM | 1
PH_PROP_COLLISION | 0
PH_USE_CUSTOM_PLMODEL | 1
PH_USE_CUSTOM_PLMODEL_FOR_PROP | 1 
PH_CUSTOMTAUNTS_DELAY | 1
PH_ENABLE_CUSTOM_TAUNTS | 6
PH_AUTOTAUNT_ENABLED | 0
PH_AUTOTAUNT_DELAY | 45
PH_ALLOW_PROP_PICKUP | 2