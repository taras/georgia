#!/bin/bash
set -e
set -o pipefall
main() {
   jq --raw-output . "$GITHUB_EVENT_PATH"
}
main