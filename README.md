# Description

Help starting IPFS in a container and allow using a custom announcement port (when behind a NAT or in K8S).

- It will contact https://checkip.foilen.com to find out the public IP.
- It will announce the port 4001 or the one specified in the environment variable `ANNOUNCE_PORT`.

## Usage

```bash

docker run -ti --rm \
    -p 4001:4001 -p 8080:8080 \
    -e ANNOUNCE_PORT=44001 \
    fdi-ipfs:master-SNAPSHOT

```
