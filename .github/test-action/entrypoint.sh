#!/bin/sh
set -e
IFS=$'\n\t'

echo $GITHUB_HEAD_REF

if [[ "$GITHUB_HEAD_REF" = "features-2" ]]
  then
    echo matches
  else
    echo does not match
fi