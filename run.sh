#!/usr/bin/env bash

echo "


╔═══════════════════════════════════════════════╗
║                                               ║
║       _  _____________      _____   ___       ║
║      / |/ / __/_  __/ | /| / / _ | / _ \      ║
║     /    / _/  / /  | |/ |/ / __ |/ , _/      ║
║    /_/|_/___/ /_/   |__/|__/_/ |_/_/|_|       ║
║                                 OFFICIAL      ║
║                                               ║
╠═══════════════════════════════════════════════╣
║ Thanks for using our DOCKER image! Should you ║
║ have issues, please reach out or create a     ║
║ github issue. Thanks!                         ║
║                                               ║
║ For more information:                         ║
║ github.com/netwarlan                          ║
╚═══════════════════════════════════════════════╝
"


## Set default values if none were provided
## ==============================================
[[ -z "$GMOD_SERVER_PORT" ]] && GMOD_SERVER_PORT="27015"
[[ -z "$GMOD_SERVER_MAXPLAYERS" ]] && GMOD_SERVER_MAXPLAYERS="12"
[[ -z "$GMOD_SERVER_MAP" ]] && GMOD_SERVER_MAP="gm_flatgrass"
[[ -z "$GMOD_SVLAN" ]] && GMOD_SVLAN="$GMOD_SVLAN"
[[ -z "$GMOD_SERVER_HOSTNAME" ]] && GMOD_SERVER_HOSTNAME="Garry's Mod | Prophunt"
[[ -z "$GMOD_SERVER_PW" ]] && GMOD_SERVER_PW=""
[[ -z "$GMOD_SERVER_RCONPW" ]] && GMOD_SERVER_RCONPW=""
[[ -z "$GMOD_SERVER_ENABLE_REMOTE_CFG" ]] && GMOD_SERVER_ENABLE_REMOTE_CFG=false
[[ -z "$GMOD_SERVER_UPDATE_ON_START" ]] && GMOD_SERVER_UPDATE_ON_START=true
[[ -z "$GMOD_SERVER_VALIDATE_ON_START" ]] && GMOD_SERVER_VALIDATE_ON_START=false
[[ -z "$GMOD_WORKSHOP_COLLECTION" ]] && GMOD_WORKSHOP_COLLECTION="177117131"


[[ -z "$PH_HUNTER_FIRE_PENALTY" ]] && PH_HUNTER_FIRE_PENALTY=10
[[ -z "$PH_HUNTER_KILL_BONUS" ]] && PH_HUNTER_KILL_BONUS=100
[[ -z "$PH_SWAP_TEAMS_EVERY_ROUND" ]] && PH_SWAP_TEAMS_EVERY_ROUND=1
[[ -z "$PH_GAME_TIME" ]] && PH_GAME_TIME=40
[[ -z "$PH_HUNTER_BLINDLOCK_TIME" ]] && PH_HUNTER_BLINDLOCK_TIME=30
[[ -z "$PH_ROUND_TIME" ]] && PH_ROUND_TIME=300
[[ -z "$PH_ROUNDS_PER_MAP" ]] && PH_ROUNDS_PER_MAP=10
[[ -z "$PH_WAITFORPLAYERS" ]] && PH_WAITFORPLAYERS=1
[[ -z "$PH_MIN_WAITFORPLAYERS" ]] && PH_MIN_WAITFORPLAYERS=2
[[ -z "$PH_PROP_CAMERA_COLLISIONS" ]] && PH_PROP_CAMERA_COLLISIONS=1
[[ -z "$PH_FREEZECAM" ]] && PH_FREEZECAM=1
[[ -z "$PH_PROP_COLLISION" ]] && PH_PROP_COLLISION=0
[[ -z "$PH_USE_CUSTOM_PLMODEL" ]] && PH_USE_CUSTOM_PLMODEL=1
[[ -z "$PH_USE_CUSTOM_PLMODEL_FOR_PROP" ]] && PH_USE_CUSTOM_PLMODEL_FOR_PROP=1
[[ -z "$PH_CUSTOMTAUNTS_DELAY" ]] && PH_CUSTOMTAUNTS_DELAY=1
[[ -z "$PH_ENABLE_CUSTOM_TAUNTS" ]] && PH_ENABLE_CUSTOM_TAUNTS=6
[[ -z "$PH_AUTOTAUNT_ENABLED" ]] && PH_AUTOTAUNT_ENABLED=0
[[ -z "$PH_AUTOTAUNT_DELAY" ]] && PH_AUTOTAUNT_DELAY=45
[[ -z "$PH_ALLOW_PROP_PICKUP" ]] && PH_ALLOW_PROP_PICKUP=2

## Update on startup
## ==============================================
if [[ "$GMOD_SERVER_UPDATE_ON_START" = true ]] || [[ "$GMOD_SERVER_VALIDATE_ON_START" = true ]]; then
echo "
╔═══════════════════════════════════════════════╗
║ Checking for updates                          ║
╚═══════════════════════════════════════════════╝
"
  if [[ "$GMOD_SERVER_VALIDATE_ON_START" = true ]]; then
    VALIDATE_FLAG='validate'
  else
    VALIDATE_FLAG=''
  fi

  ## Install Garry's Mod
  $STEAMCMD_DIR/steamcmd.sh \
  +force_install_dir $GAME_DIR \
  +login $STEAMCMD_USER $STEAMCMD_PASSWORD $STEAMCMD_AUTH_CODE \
  +app_update $STEAMCMD_APP $VALIDATE_FLAG \
  +quit

  ## Install CSS
  $STEAMCMD_DIR/steamcmd.sh \
  +force_install_dir $GAME_DIR/content/css \
  +login $STEAMCMD_USER $STEAMCMD_PASSWORD $STEAMCMD_AUTH_CODE \
  +app_update $STEAMCMD_APP_2 $VALIDATE_FLAG \
  +quit
fi



## Build server config
## ==============================================
echo "
╔═══════════════════════════════════════════════╗
║ Building server config                        ║
╚═══════════════════════════════════════════════╝
"
cat <<EOF > $GAME_DIR/garrysmod/cfg/server.cfg
hostname                        "$GMOD_SERVER_HOSTNAME"
rcon_password                   "$GMOD_SERVER_RCONPW"
sv_password                     "$GMOD_SERVER_PW"
sv_downloadurl                  "$DOWNLOAD_URL"
sv_allowdownload                0
sv_allowupload                  0
sv_lan                          $GMOD_SVLAN

// PH: Enhanced - Gameplay settings
ph_hunter_fire_penalty          "$PH_HUNTER_FIRE_PENALTY"
ph_hunter_kill_bonus            "$PH_HUNTER_KILL_BONUS"
ph_swap_teams_every_round       "$PH_SWAP_TEAMS_EVERY_ROUND"
ph_game_time                    "$PH_GAME_TIME"
ph_hunter_blindlock_time        "$PH_HUNTER_BLINDLOCK_TIME"
ph_round_time                   "$PH_ROUND_TIME"
ph_rounds_per_map               "$PH_ROUNDS_PER_MAP"
ph_waitforplayers               "$PH_WAITFORPLAYERS"
ph_min_waitforplayers           "$PH_MIN_WAITFORPLAYERS"

// PH: Enhanced - Props/Player settings
ph_prop_camera_collisions       "$PH_PROP_CAMERA_COLLISIONS"
ph_freezecam                    "$PH_FREEZECAM"
ph_prop_collision               "$PH_PROP_COLLISION"
ph_use_custom_plmodel           "$PH_USE_CUSTOM_PLMODEL"
ph_use_custom_plmodel_for_prop  "$PH_USE_CUSTOM_PLMODEL_FOR_PROP" 
ph_customtaunts_delay           "$PH_CUSTOMTAUNTS_DELAY"
ph_enable_custom_taunts         "$PH_ENABLE_CUSTOM_TAUNTS"
ph_autotaunt_enabled            "$PH_AUTOTAUNT_ENABLED"
ph_autotaunt_delay              "$PH_AUTOTAUNT_DELAY"
ph_allow_prop_pickup            "$PH_ALLOW_PROP_PICKUP"
EOF



## Download config if needed (this will overwrite the server config built above)
## ==============================================
if [[ "$GMOD_SERVER_ENABLE_REMOTE_CFG" = true ]]; then
echo "
╔═══════════════════════════════════════════════╗
║ Downloading remote config                     ║
╚═══════════════════════════════════════════════╝
"
  if [[ -z "$GMOD_SERVER_REMOTE_CFG" ]]; then
    echo "  Remote config enabled, but no URL provided..."
  else
    echo "  Downloading config..."
    wget -q $GMOD_SERVER_REMOTE_CFG -O $GAME_DIR/garrysmod/cfg/server.cfg
  fi

fi


## Print Variables
## ==============================================
echo "
╔═══════════════════════════════════════════════╗
║ Server set with provided values               ║
╚═══════════════════════════════════════════════╝
"
printenv | grep GMOD



## Run
## ==============================================
echo "
╔═══════════════════════════════════════════════╗
║ Starting server                               ║
╚═══════════════════════════════════════════════╝
"
echo "resource.AddWorkshop(\"$GMOD_WORKSHOP_COLLECTION\")" > ${GAME_DIR}/garrysmod/lua/autorun/server/workshop.lua

${GAME_DIR}/srcds_run -game garrysmod -console \
+maxplayers $GMOD_SERVER_MAXPLAYERS \
+host_workshop_collection $GMOD_WORKSHOP_COLLECTION \
+gamemode "prop_hunt" \
+map $GMOD_SERVER_MAP
