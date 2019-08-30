#!/bin/sh
set -e

sh -c "git remote set-url origin https://{GITHUB_TOKEN}github.com/taras/georgia.git && git config user.email 'minkimcello@gmail.com' && git config user.name 'minkimcello' && echo hello > test.txt && git add test.txt && git commit -m '$*' --allow-empty && git push -u origin HEAD"