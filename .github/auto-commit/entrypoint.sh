#!/bin/sh
set -e

sh -c "git config user.name 'minkimcello' && git config user.email 'minkimcello@gmail.com' && echo hello > test.txt && git add test.txt && git commit -m '$*' --allow-empty && git push -u origin HEAD"