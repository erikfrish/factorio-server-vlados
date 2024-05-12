# FROM debian:stable-slim
FROM alpine:latest


ARG USER=factorio
ARG GROUP=factorio
ARG PUID=845
ARG PGID=845
ARG BOX64_VERSION=v0.2.4

# version checksum of the archive to download
ARG VERSION
ARG SHA256

# RUN apt-get update && apt-get install -y wget tar xz-utils
RUN apk update && apk upgrade && apk add fish tar xz

# Install Factorio
# RUN wget -O ~/factorio_headless.tar.gz https://factorio.com/get-download/stable/headless/linux64
# RUN tar -xf ~/factorio_headless.tar.gz -C /opt/
# RUN rm factorio_headless.tar.gz

ADD ./ /factorio_headless 
RUN /bin/tar -xf /factorio_headless/factorio_headless.tar.gz -C /opt/
# RUN ls -la /opt/factorio

# RUN mkdir /factorio_headless/test2
# RUN /bin/tar -xf /factorio_headless/factorio_headless.tar.gz -C /factorio_headless/test

# RUN adduser --disabled-login --no-create-home --gecos factorio factorio
# RUN chown -R factorio:factorio /opt/factorio

# ADD ./saves /opt/factorio/saves
# ADD ./data /opt/factorio/data
# ADD ./config /opt/factorio/config/

# CMD ["/opt/factorio/bin/x64/factorio --start-server-load-latest --server-settings /opt/factorio/data/server-settings.json"]
CMD ["/opt/factorio/bin/x64/factorio --start-server /opt/factorio/saves/init.zip --server-settings /opt/factorio/data/server-settings.json"]
# CMD [ "/bin/sh" ]