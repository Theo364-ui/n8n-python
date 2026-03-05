FROM node:22-slim

RUN apt-get update && apt-get install -y \
    python3 python3-pip ffmpeg curl \
    && pip3 install moviepy numpy imageio imageio-ffmpeg --break-system-packages \
    && npm install -g n8n \
    && apt-get clean \
    && ln -s /usr/bin/python3 /usr/bin/python

ENV N8N_PORT=5678
ENV PYTHON_PATH=/usr/bin/python3
EXPOSE 5678

CMD ["n8n", "start"]
