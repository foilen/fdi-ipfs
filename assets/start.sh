#!/bin/bash

set -e

echo ----[ Find the public IP ]----
PUBLIC_IP=$(curl  --http1.1 https://checkip.foilen.com 2> /dev/null)
echo PUBLIC_IP=$PUBLIC_IP

echo ----[ Find public port to use ]----
if [ -z "$ANNOUNCE_PORT" ]; then
    ANNOUNCE_PORT=4001
fi
echo ANNOUNCE_PORT=$ANNOUNCE_PORT

echo ----[ Init IPFS ]----
set +e
ipfs init
set -e

echo ----[ Set the extra announcement ]----
ipfs config --json Addresses.AppendAnnounce "[\"/ip4/${PUBLIC_IP}/tcp/${ANNOUNCE_PORT}\"]"

echo ----[ Start IPFS ]----
ipfs daemon
