#!/bin/bash
set -e

main() {
   echo hello > dingdong.txt
   ls
   yarn -v
}

# secondfunction() {
#    echo $yeah
# }

main
# secondfunction