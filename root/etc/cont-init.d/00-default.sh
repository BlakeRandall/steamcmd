#!/usr/bin/with-contenv bash
PUID=${PUID:-1001}
PGID=${PGID:-1001}
groupmod -o -g "$PGID" user
usermod -o -u "$PUID" user
chown user:user /app
