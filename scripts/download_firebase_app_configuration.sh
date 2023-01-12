#!/bin/bash -eu
# Flutterのプロジェクトルートで実行すること
# Do execute on project root directory.

function fetchAndroid() {
  JSON_PATH=android/app/src/$1/google-services.json
  rm -f $JSON_PATH
  firebase apps:sdkconfig android $2 --out $JSON_PATH
}

function fetchIOS() {
  PLIST_PATH=ios/Runner/Firebase/GoogleService-Info-$1.plist
  rm -f $PLIST_PATH
  firebase apps:sdkconfig ios $2 --out $PLIST_PATH
}

echo "==== development ===="

# fetchIOS development <YOUR_APP_ID>
# fetchAndroid development <YOUR_APP_ID>

echo "==== production ===="

# fetchIOS production <YOUR_APP_ID>
# fetchAndroid production <YOUR_APP_ID>
