#!/bin/bash

# Download Flutter
if [ ! -d "flutter" ]; then
  git clone https://github.com/flutter/flutter.git -b stable --depth 1
fi

# Add to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Build Web
flutter config --enable-web
flutter build web --release

# Note: Vercel should be configured to serve 'build/web' as the output directory.
