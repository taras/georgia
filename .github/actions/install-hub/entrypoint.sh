#!/bin/bash
set -e

apt-get install sudo -y
wget https://github.com/github/hub/releases/download/v2.12.3/hub-linux-amd64-2.12.3.tgz
tar -zxvf hub-linux-amd64-2.12.3.tgz
cd hub-linux-amd64-2.12.3
sudo ./install