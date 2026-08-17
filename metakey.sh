#!/bin/bash

PROFILE="$(defaults read com.apple.Terminal 'Default Window Settings')"
PLIST="$HOME/Library/Preferences/com.apple.Terminal.plist"

/usr/libexec/PlistBuddy \
  -c "Set :'Window Settings':'$PROFILE':useOptionAsMetaKey true" \
  "$PLIST" 2>/dev/null ||
/usr/libexec/PlistBuddy \
  -c "Add :'Window Settings':'$PROFILE':useOptionAsMetaKey bool true" \
  "$PLIST"

echo "✅ Option(⌥) → Meta 활성화 완료"
echo "프로필: $PROFILE"
