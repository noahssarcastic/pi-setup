#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "not running as root; exiting"
    exit
fi

sudo apt-get update
sudo apt-get upgrade

python -m venv /usr/local/bin/OctoPrint
source /usr/local/bin/OctoPrint/bin/activate
pip install OctoPrint
deactivate

git clone https://github.com/jacksonliam/mjpg-streamer.git /usr/local/bin
sudo apt-get install -y cmake libjpeg8-dev gcc g++
(
  cd /usr/local/bin/mjpg-streamer/mjpg-streamer-experimental
  make
  sudo make install
)

sudo cp ./octoprint.service /etc/systemd/system/
sudo cp ./mjpg-streamer.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable octoprint --now
sudo systemctl enable mjpg-streamer --now
