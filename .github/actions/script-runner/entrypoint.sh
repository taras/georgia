#!/bin/bash
set -euo pipefail

if [[ "${#$*}" -eq "0" ]]
  then
    echo $* does not exist
  else
    echo hello?
fi