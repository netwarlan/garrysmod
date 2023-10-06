# Garry's Mod | Prop hunt          
The following repository contains the source files for building a Garry's Mod Prop hunt server.


### Running
To run the container, issue the following example command:
```
docker run -d \
-p 27015:27015/udp \
-p 27015:27015/tcp \
-e GMOD_SERVER_NAME="Garry Prop hunt" \
ghcr.io/netwarlan/garrysmod
```

### Environment Variables
We can make dynamic changes to our Rust containers by adjusting some of the environment variables passed to our image.

Below are the ones currently supported and their (defaults):

Environment Variable | Default Value
-------------------- | -------------
GMOD_SERVER_PORT | 27015
GMOD_SERVER_MAXPLAYERS | 12
GMOD_SERVER_MAP | gm_flatgrass
GMOD_SERVER_HOSTNAME | Garry Prop hunt
GMOD_SVLAN | 0
GMOD_SERVER_PW | No password set
GMOD_SERVER_RCONPW | No password set
GMOD_SERVER_UPDATE_ON_START | true
GMOD_SERVER_VALIDATE_ON_START | false
GMOD_SERVER_ENABLE_REMOTE_CFG | false
GMOD_SERVER_REMOTE_CFG | No url set

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