# Download base image ubuntu 20.04 
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="aryanmukerji@gmail.com"
LABEL version="0.2"
LABEL description="This is custom Docker Image for MQTT Server."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Default Working Directory
WORKDIR /home

# Update Ubuntu Software Repository
RUN apt-get update

# Install python3, pip3, paho-mqtt
RUN apt-get install -y python3 && \
        apt-get install -y python3-pip && \
        pip3 install paho-mqtt

# Install and setup MQTT client
RUN apt-get install -y mosquitto mosquitto-clients && \
    service mosquitto start && \
    echo "listener 1883" >> /etc/mosquitto/mosquitto.conf && \
    echo "allow_anonymous true" >> /etc/mosquitto/mosquitto.conf && \
    service mosquitto restart

# Copy and Add dbMQTT.py
ADD dbMQTT.py /home

# Expose Port for the Application 
EXPOSE 1883

# Start the MQTT service at container creation
ENTRYPOINT service mosquitto start && /bin/bash && \
           python3 dbMQTT.py&
