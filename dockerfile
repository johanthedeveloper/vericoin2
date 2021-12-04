FROM ubuntu:20.04 AS base

# Install needed software
RUN apt update -y && apt upgrade -y
RUN apt-get install -y nano git wget curl unzip zip

# Copy scripts files
WORKDIR /usr/libexec/
COPY ./scripts/ ./vericoin2/
RUN find ./vericoin2/ -type f -iname "*.sh" -exec chmod +x {} \;

##############################################
### Starting new container for building
FROM base AS build

# Download
WORKDIR /root/git/vericoin2/
RUN wget https://files.vericonomy.com/vrc/2.0/releases/2.0.0/vericoin-2.0.0-arm-linux-gnueabihf.tar.gz
RUN tar xzvf vericoin-2.0.0-arm-linux-gnueabihf.tar.gz

# Copy to /app/publish
WORKDIR /root/git/vericoin2/vericoin-2.0.0/bin/
RUN mkdir -p /app/publish
RUN cp vericoind /app/publish && cp vericoin-cli /app/publish

##############################################
### Starting new container for publish
FROM base AS publish

#copy from build
COPY --from=build /app/publish /usr/bin/

# Add entrypoint
ENTRYPOINT ["/usr/libexec/vericoin2/startup.sh"]
