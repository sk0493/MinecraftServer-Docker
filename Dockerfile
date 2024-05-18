FROM ubuntu:22.04

# Setting an env variable so that we dont get user prompt when building ubuntu machine
ENV DEBIAN_FRONTEND=noninteractive 

WORKDIR /minecraft

# Command to run when building the image
# Using package manager to install requirements
RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Using wget to download Minecraft server from the internet
RUN wget -O server.jar https://piston-data.mojang.com/v1/objects/4fb536bfd4a83d61cdbaf684b8d311e66e7d4c49/server.jar

# Requirements for Minecraft server to accept eula
RUN echo "eula=true" > eula.txt

# Port for Minecraft server
EXPOSE 25565

# Arguments being passed to java command
#Minecraft server uses java to configure the server
CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui" ]






