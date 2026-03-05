FROM node:22-slim

RUN apt-get update && apt-get install -y \
    python3 python3-pip python3-venv ffmpeg curl \
    && python3 -m venv /opt/venv \
    && /opt/venv/bin/pip install moviepy numpy imageio imageio-ffmpeg \
    && npm install -g n8n \
    && apt-get clean \
    && ln -s /usr/bin/python3 /usr/bin/python

ENV N8N_PORT=5678
ENV PYTHON_PATH=/opt/venv/bin/python
ENV PATH="/opt/venv/bin:$PATH"
EXPOSE 5678

CMD ["n8n", "start"]
