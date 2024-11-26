FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    wget \
    && apt-get clean

COPY requirements.txt .

RUN pip install --no-cache-dir --break-system-packages -r requirements.txt

WORKDIR /app