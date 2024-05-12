FROM alpine:latest


ARG USER=factorio
ARG GROUP=factorio
ARG PUID=845
ARG PGID=845
ARG BOX64_VERSION=v0.2.4

# version checksum of the archive to download
ARG VERSION
ARG SHA256

# Install Factorio
RUN wget -O factorio_headless.tar.gz https://factorio.com/get-download/stable/headless/linux64
RUN tar -xf ./factorio_headless.tar.gz -C /opt/
RUN rm factorio_headless.tar.gz
# RUN adduser --disabled-login --no-create-home --gecos factorio factorio
# RUN chown -R factorio:factorio /opt/factorio

ADD ./saves /opt/factorio/saves
ADD ./data /opt/factorio/data
ADD ./config /opt/factorio/config/

# CMD ["/opt/factorio/bin/x64/factorio --start-server-load-latest --server-settings /opt/factorio/data/server-settings.json"]
CMD ["/opt/factorio/bin/x64/factorio --start-server /opt/factorio/saves/init.zip --server-settings /opt/factorio/data/server-settings.json"]
# CMD [ "-f", "/bin/sh" ]