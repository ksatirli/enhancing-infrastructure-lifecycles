#!/bin/sh

az \
  vm \
    image \
      list-offers \
        --location "westus" \
        --publisher "MicrosoftWindowsServer" \
| \
jq ".[].name"
