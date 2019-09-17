#!/bin/sh
set -e

if [[ "${#$*}" -eq "0" ]]
  then
    echo $* does not exist
  else
    sh -c "$*"
fi