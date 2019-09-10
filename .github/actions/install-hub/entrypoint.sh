#!/bin/bash
set -e

wget https://github.com/github/hub/releases/download/v2.12.3/hub-linux-amd64-2.12.3.tgz
tar -zxvf hub-linux-amd64-2.12.3.tgz
cd hub-linux-amd64-2.12.3
sudo ./install

# for the purpose of:
# labels=$(hub pr list -s merged -L 1 -f %L)