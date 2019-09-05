#!/bin/bash
set -e

main() {
   echo hello > dingdong.txt
   ls
   node -v
}

# secondfunction() {
#    echo $yeah
# }

main
# secondfunction