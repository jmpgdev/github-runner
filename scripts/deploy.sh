#!/bin/bash
if [ -z "$GITHUB_TOKEN" ]; then
  echo "Error: GITHUB_TOKEN environment variable is not set."
  exit 99
fi

./config.sh --url https://github.com/JMPG-Developer --token "$GITHUB_TOKEN"
./run.sh