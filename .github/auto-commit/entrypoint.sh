#!/bin/sh
set -e

sh -c "git config user.email 'minkimcello@gmail.com' && git config user.name 'Min Kim' && echo hello > test.txt && git add test.txt && git commit -m '$*' --allow-empty && git push -u origin HEAD"