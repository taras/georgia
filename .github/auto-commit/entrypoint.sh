#!/bin/sh
set -e

sh -c "git remote add origin https://github.com/taras/georgia.git && echo hello > test.txt && git add test.txt && git commit -m '$*' --allow-empty && git push -u origin HEAD"