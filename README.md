# nexus433 Docker container for 
This repository provides a Docker container for the easy to use 433-to-MQTT nexus bridge from aquaticus found here:  
https://github.com/aquaticus/nexus433  

I was looking for a 433Mhz bridge to MQTT to run on a raspberry pi and this seemed the best option.  
As I like to containerize every service and I didn't find a premade one for this project I created one.  

## Usage
clone from git using 
```
git clone https://github.com/Brassn/nexus433-docker-rpi  
cd nexus433-docker-rpi
```  
Now set the MQTT_SERVER variable inside the docker-compose.yml file to point to your existing MQTT server instead of "mqtt". If a port other than 1883 needs to be specified look at the configuration chapter.  
If you do not have an existing server uncomment the preconfigured mosquitto server already provided in the lines beneath. 
If you choose to enable the preconfigured server you do not need to change the MQTT_SERVER variable.  
To build and start the container(s) execute 
```
sudo docker-compose up -d
```

## Configuration
So far only the MQTT_SERVER is easy to configure using docker environment variables. The port 1883 is assumed and cannot be canged this way.  
If you need to access the entire configuration you can provide a nexus433.ini file to /etc/nexus433.ini using docker volumes using the docker-compose.yml file.

## Compatibility
nexus433 tries to lookup the hardware using /sys/firmware/devicetree/base/model but this is not possible from inside the container. 
Therefore I disabled this detection to always assume a Raspberry Pi. 
As it seems this would otherwise only change the default port from 17 to 1 on the Orange Pi, which can also be achieved by changing the configuration file accordingly.

## Tested hardware
Tested on an Raspberry Pi 4 Model B running on Arch Linux using a superheterodyne RXB6 433Mhz receiver. 
I used the code from https://github.com/jorgegarciadev/Arduinonexus to quickly create a compatible sender using a Arduino nano.
