FROM ubuntu:24.04

# Tools
RUN export TERM=dumb ; export DEBIAN_FRONTEND=noninteractive ; apt-get update && apt-get install -y \
    curl \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

# IPFS
COPY _assets/go-ipfs/ipfs /usr/bin/
RUN chmod 755 /usr/bin/ipfs

# Start script
COPY assets /app

# Command
CMD /app/start.sh
