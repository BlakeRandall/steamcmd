#!/usr/bin/with-contenv bash
mkdir -p /opt/steamcmd/
curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf - -C /opt/steamcmd/
mkdir -p /{root,app}/.steam/sdk32/
ln -s /opt/steamcmd/linux32/steamclient.so /root/.steam/sdk32/steamclient.so
ln -s /opt/steamcmd/linux32/steamclient.so /app/.steam/sdk32/steamclient.so
ln -s /opt/steamcmd/linux32/steamclient.so /usr/lib/i386-linux-gnu/steamclient.so
ln -s /opt/steamcmd/linux64/steamclient.so /usr/lib/x86_64-linux-gnu/steamclient.so
chown user:user -R /app/.steam
