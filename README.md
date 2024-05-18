
# Introduction

Building a Minecraft server container image using Docker.
The Dockerfile is used to create an image from a vanilla Ubuntu machine and downloading Minecraft server.
Once the container is running, the server is hosted on the local machine. 

## Prerequisites

- Minecraft Launcher + account
- Docker

# Dockerfile

```
# Command to run when building the image
# Using package manager to install openjdk requirement
# wget to retrive files from internet (minecraft server)
# removing uneccesary files from container
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Using wget to download Minecraft server from the internet
RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/4fb536bfd4a83d61cdbaf684b8d311e66e7d4c49/server.jar
```


# Snippets

`docker build -t minecraft:latest .`
Make sure directory is where Dockerfile is

`docker image ls`

`docker run -p 25565:25565 --name minecraft-server -d minecraft:latest`
Need to mention the port mapping, running the 'minecraft-server' container in the background. 
This will start the container and the server will be building, takes a few seconds for the server to finish building.


`docker ps`

If we insepct the files of the container on Docker Desktop, the eula.txt we created is in the correct directory:

![eula](./images/container_file.png)


`docker logs minecraft-server`

Inspecting the logs of the container, we will see which Version of Minecraft we need to run. This is important when we launch the minecraft client, we have to make sure it is the same version.

In the log we will see this:

```
[Server thread/INFO]: Starting minecraft server version 1.20.3
```

![minecraftgame](./images/joining_server.png)


# Next steps

- Have a container volume that is used to store all the server data. This means that if the server fails, player's progression is not lost.
- Include mods, these would be saved inside the container volume
- Deploy to the cloud so that the server is not hosted on local machine.

