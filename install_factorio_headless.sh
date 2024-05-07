wget -O factorio_headless.tar.gz https://factorio.com/get-download/stable/headless/linux64
sudo tar -xf ./factorio_headless.tar.gz -C /opt/
rm factorio_headless.tar.gz

sudo adduser --disabled-login --no-create-home --gecos factorio factorio
sudo chown -R factorio:factorio /opt/factorio

sudo cp /opt/factorio/data/server-settings.example.json server-settings.json
sudo ln server-settings.json /opt/factorio/data/server-settings.json
sudo cp /opt/factorio/data/map-gen-settings.example.json map-gen-settings.json
sudo ln map-gen-settings.json /opt/factorio/data/map-gen-settings.json
sudo cp /opt/factorio/data/server-whitelist.example.json server-whitelist.json
sudo ln server-whitelist.json /opt/factorio/data/server-whitelist.json
sudo cp /opt/factorio/data/map-settings.example.json map-settings.json
sudo ln map-settings.json /opt/factorio/data/map-settings.json

sudo touch /etc/systemd/system/factorio.service

echo "[Unit]
Description=Factorio Headless Server

[Service]
Type=simple
User=factorio
ExecStart=/opt/factorio/bin/x64/factorio --start-server-load-latest --server-settings /opt/factorio/data/server-settings.json
" >> /etc/systemd/system/factorio.service
