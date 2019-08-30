#!/bin/sh
set -e

sh -c touch dingdong.txt && git remote set-url origin https://$GITHUB_TOKEN:github.com/taras/georgia.git && git add -A && git commit -m '$*' --allow-empty && git push -u origin HEAD