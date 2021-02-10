#!/usr/bin/with-contenv bash
mkdir -p /app/
cat <<- EOF > /app/steamcmd.txt
@ShutdownOnFailedCommand 1
@NoPromptForPassword 1
login ${STEAM_USERNAME:-anonymous} ${STEAM_PASSWORD:-}
force_install_dir /app/
app_update ${APP_ID:-232370}
quit
EOF
cat <<- EOF > /app/steamcmd_validate.txt
@ShutdownOnFailedCommand 1
@NoPromptForPassword 1
login ${STEAM_USERNAME:-anonymous} ${STEAM_PASSWORD:-}
force_install_dir /app/
app_update ${APP_ID:-232370} validate
quit
EOF
/opt/steamcmd/steamcmd.sh +runscript /app/${STEAM_SCRIPT:-steamcmd.txt}
chown user:user -R /app/
