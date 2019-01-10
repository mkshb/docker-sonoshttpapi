sudo mkdir /opt/sonoshttpapi && \
sudo chown pi:pi /opt/sonoshttpapi && \
cd /opt/sonoshttpapi && \
mkdir clips && \
mkdir settings && \
mkdir cache && \
mkdir presets && \
curl https://raw.githubusercontent.com/jishi/node-sonos-http-api/master/presets/example.json > presets/example.json && \
echo {} > settings/settings.json
