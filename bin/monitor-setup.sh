#!/bin/bash

sleep .5

if [[ $MONITOR_SETUP == "desktop" ]]; then
    desktop.sh
else
    laptop.sh
fi
