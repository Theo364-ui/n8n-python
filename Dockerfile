FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    ffmpeg \
    nodejs \
    npm \
    && pip3 install moviepy numpy imageio imageio-ffmpeg \
    && npm install -g n8n \
    && apt-get clean

ENV N8N_PORT=5678
EXPOSE 5678

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s \
    CMD curl -f http://localhost:5678/healthz || exit 1

CMD ["n8n", "start"]
