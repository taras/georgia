#!/bin/bash
set -e

if [[ "${#$*}" -eq "0" ]]
  then
    echo $* does not exist
else
  then
    $*
fi