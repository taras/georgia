#!/bin/sh
set -e

sh -c "git config --global user.email "tarasm@gmail.com" && git config --global user.name "tarasm" && git add -A && git commit -m '$*' --allow-empty && git push -u origin HEAD"