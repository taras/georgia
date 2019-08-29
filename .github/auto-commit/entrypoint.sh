#!/bin/sh
set -e

sh -c "git add -A && git commit -m '$*' --allow-empty \
      && git push -u origin HEAD"