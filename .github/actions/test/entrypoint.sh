#!/bin/bash
set -e

main() {
   jq --raw-output . "$GITHUB_EVENT_PATH"
}
main