
FROM node:16-buster

RUN apt-get update && apt-get install -y \
    zsh \
    git \
    && rm -rf /var/lib/apt/lists/* # Clean up to reduce image size

RUN git clone https://github.com/louislam/uptime-kuma.git

WORKDIR /uptime-kuma

RUN npm install -g pm2 \
    && npm run setup

CMD ["pm2-runtime", "start", "server/server.js", "--name", "uptime-kuma"]



