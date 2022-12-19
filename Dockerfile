# Download base image ubuntu 20.04 
FROM ubuntu:20.04

# LABEL about the custom image
LABEL maintainer="aryanmukerji@gmail.com"
LABEL version="0.5"
LABEL description="This is custom Docker Image for MQTT Server."

# Disable Prompt During Packages Installation
ARG DEBIAN_FRONTEND=noninteractive

# Default Working Directory
WORKDIR /home

# Update Ubuntu Software Repository and Install tzdata
RUN apt-get update && \
    apt-get install -yq tzdata && \
    ln -fs /usr/share/zoneinfo/Asia/Calcutta /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata

# Install python3, pip3, paho-mqtt, schedule
RUN apt-get install -y python3 && \
        apt-get install -y python3-pip && \
        pip3 install paho-mqtt && \
		pip install schedule

# Install and setup MQTT client
RUN apt-get install -y mosquitto mosquitto-clients && \
    service mosquitto start && \
    echo "listener 1883" >> /etc/mosquitto/mosquitto.conf && \
    echo "allow_anonymous true" >> /etc/mosquitto/mosquitto.conf && \
    service mosquitto restart

# Copy and Add dbMQTT.py, script.sh
ADD dbMQTT.py /home
ADD script.sh /home

# Give execute permissions
RUN chmod +x script.sh

# Expose Port for the Application 
EXPOSE 1883

# Start the MQTT service at container creation
ENTRYPOINT ./script.sh && /bin/bash
