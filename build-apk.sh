#!/usr/bin/env bash
# Builds a debug APK on macOS/Linux. Needs Node.js 20+, JDK 21, Android SDK (ANDROID_HOME).
set -e
: "${ANDROID_HOME:=$HOME/Android/Sdk}"
echo "sdk.dir=$ANDROID_HOME" > android/local.properties
npm install && npm run build && npx cap sync android
(cd android && ./gradlew assembleDebug)
echo "DONE: android/app/build/outputs/apk/debug/app-debug.apk"
