#!/bin/sh
set -e

sh -c "git config --global user.email "minkimcello@gmail.com" && git config --global user.name "minkimcello" && git add -A && git commit -m '$*' --allow-empty && git push -u origin HEAD"