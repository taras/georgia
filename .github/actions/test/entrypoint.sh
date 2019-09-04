#!/bin/bash
set -eo pipefall
main() {
   jq --raw-output . "$GITHUB_EVENT_PATH"
}
main