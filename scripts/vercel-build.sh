#!/usr/bin/env bash
set -euo pipefail

if ! command -v flutter >/dev/null 2>&1; then
  git clone https://github.com/flutter/flutter.git --depth 1 -b stable .flutter
  export PATH="$PATH:$(pwd)/.flutter/bin"
  flutter config --enable-web
  flutter precache --web
fi

flutter pub get
flutter build web --release
