FROM resin/rpi-raspbian:wheezy

RUN apt-get update && apt-get install -y \
    python3 \
    python3-dev \
    python3-pip \
    python3-six \
    --no-install-recommends \
    && pip3 install slackclient \
    && rm -rf /var/lib/apt/lists/*

COPY . /app

WORKDIR /app
CMD ["transmission-telegram.py", "--config=config.ini"]