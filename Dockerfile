FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    ffmpeg \
    nodejs \
    npm \
    && pip3 install moviepy numpy imageio imageio-ffmpeg \
    && npm install -g n8n \
    && apt-get clean

EXPOSE 5678
CMD ["n8n", "start"]
