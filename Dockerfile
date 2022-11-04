# Download base image ubuntu 20.04 
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="aryanmukerji@gmail.com"
LABEL version="0.1"
LABEL description="This is custom Docker Image for MQTT Server."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Update Ubuntu Software repository
RUN apt-get update

# Install and setup MQTT client
RUN apt-get install -y mosquitto mosquitto-clients && \
    service mosquitto start && \
    echo "listener 1883" >> /etc/mosquitto/mosquitto.conf && \
    echo "allow_anonymous true" >> /etc/mosquitto/mosquitto.conf && \
    service mosquitto restart

# Expose Port for the Application 
EXPOSE 1883

# Start the MQTT service at container creation
ENTRYPOINT service mosquitto start && /bin/bash
