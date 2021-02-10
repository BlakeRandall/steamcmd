#!/usr/bin/with-contenv bash
if [[ ${MMS} -eq 1 || ${SM} -eq 1 ]]; then
  METAMOD_SOURCE_LATEST_VERSION=$(curl -sqL https://mms.alliedmods.net/mmsdrop/${METAMOD_SOURCE_VERSION:-1.11}/mmsource-latest-linux)
  curl -sqL "https://mms.alliedmods.net/mmsdrop/${METAMOD_SOURCE_VERSION:-1.11}/${METAMOD_SOURCE_LATEST_VERSION}" | tar zxvf - -C /app/${APP_NAME:-hl2mp}/
fi

if [[ ${SM} -eq 1 ]]; then
  SOURCEMOD_LATEST_VERSION=$(curl -sqL https://sm.alliedmods.net/smdrop/${SOURCEMOD_VERSION:-1.10}/sourcemod-latest-linux)
  if [[ -d "/app/${APP_NAME:-hl2mp}/addons/sourcemod/" ]]; then
    curl -sqL "https://sm.alliedmods.net/smdrop/${SOURCEMOD_VERSION:-1.10}/${SOURCEMOD_LATEST_VERSION}" | tar zxvf - -C /app/${APP_NAME:-hl2mp}/ \
    --exclude "addons/sourcemod/scripting" \
    --exclude "addons/sourcemod/configs"
  else
    curl -sqL "https://sm.alliedmods.net/smdrop/${SOURCEMOD_VERSION:-1.10}/${SOURCEMOD_LATEST_VERSION}" | tar zxvf - -C /app/${APP_NAME:-hl2mp}/ \
    --exclude "addons/sourcemod/scripting"
  fi
fi
chown user:user -R /app/
