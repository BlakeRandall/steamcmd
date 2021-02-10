FROM ubuntu:latest
ARG OVERLAY_VERSION="v2.1.0.2"
ARG OVERLAY_ARCH="amd64"
ADD https://github.com/just-containers/s6-overlay/releases/download/${OVERLAY_VERSION}/s6-overlay-${OVERLAY_ARCH}-installer /tmp/
RUN chmod +x /tmp/s6-overlay-${OVERLAY_ARCH}-installer && /tmp/s6-overlay-${OVERLAY_ARCH}-installer / && rm /tmp/s6-overlay-${OVERLAY_ARCH}-installer
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y bash curl ca-certificates lib32z1 libsdl2-2.0-0 lib32gcc1 lib32stdc++6 && \
    rm -rf /var/lib/apt/lists/*
RUN useradd -u 1001 -U -d /app/ -s /bin/false user && \
 usermod -G users user && \
 mkdir -p /app
WORKDIR /
COPY root/ /
ENV PUID=1001
ENV PGID=1001
ENV STEAM_USERNAME=anonymous
ENV STEAM_PASSWORD=
ENV APP_ID=232370
ENV APP_NAME=hl2mp
ENV SRCDS_OPTIONS="-game hl2mp +map dm_overwatch +maxplayers 8 -maxplayers 8"
ENV SRCDS_EXTRAS=
ENV METAMOD_SOURCE_VERSION=1.11
ENV SOURCEMOD_VERSION=1.10
ENV MMS=1
ENV SM=1
EXPOSE 27015/udp
EXPOSE 27015/tcp
ENTRYPOINT ["/init"]
