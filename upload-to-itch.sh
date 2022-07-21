#!/bin/bash
CURRENT_DIR=$(dirname "$(readlink -f "$0")")
APK="$CURRENT_DIR/build/DarkCity.apk"
WINDOWS="$CURRENT_DIR/build/windows/"

echo Uploading to Itch...
butler -v push "$APK" "malcolmnixon/dark-city:android"
butler -v push "$WINDOWS" "malcolmnixon/dark-city:windows"

echo Done.
