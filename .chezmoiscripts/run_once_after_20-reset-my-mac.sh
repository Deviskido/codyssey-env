#!/bin/zsh

echo "=== Restoring my macOS settings ==="

# --------------------------------------------------
# 1. Preferred language: English → Korean
# --------------------------------------------------
defaults write NSGlobalDomain AppleLanguages \
  -array "en-KR" "ko-KR"

defaults write NSGlobalDomain AppleLocale \
  -string "en_KR"

# --------------------------------------------------
# 2. First day of week: Monday
# 1 = Sunday
# 2 = Monday
# --------------------------------------------------
defaults write NSGlobalDomain AppleFirstWeekday \
  -dict gregorian -int 2

# --------------------------------------------------
# 3. Natural Scrolling: OFF
# --------------------------------------------------
defaults write NSGlobalDomain \
  com.apple.swipescrolldirection \
  -bool false

# --------------------------------------------------
# 4. Automatic Capitalization: OFF
# --------------------------------------------------
defaults write NSGlobalDomain \
  NSAutomaticCapitalizationEnabled \
  -bool false

# --------------------------------------------------
# 5. Fn / Globe key: Change Input Source
# --------------------------------------------------
defaults write com.apple.HIToolbox \
  AppleFnUsageType \
  -int 1

# --------------------------------------------------
# 6. Caps Lock -> Fn
#
# Current keyboard:
# com.apple.keyboard.modifiermapping.1452-591-0
#
# Caps Lock = 30064771129
# Fn        = 1095216660483
# --------------------------------------------------
defaults -currentHost write NSGlobalDomain \
  "com.apple.keyboard.modifiermapping.1452-591-0" \
  -array \
  '<dict>
      <key>HIDKeyboardModifierMappingSrc</key>
      <integer>30064771129</integer>
      <key>HIDKeyboardModifierMappingDst</key>
      <integer>1095216660483</integer>
   </dict>'

echo ""
echo "=== Restore complete ==="
echo "English                     : configured"
echo "First day of week            : Monday"
echo "Natural Scrolling            : OFF"
echo "Automatic Capitalization     : OFF"
echo "Fn key                       : Change Input Source"
echo "Caps Lock                    : Fn"
echo ""
echo "Log out and back in if the language does not update immediately."


echo ""
echo "=== Verification ==="

echo "[Languages]"
defaults read NSGlobalDomain AppleLanguages

echo ""
echo "[Locale]"
defaults read NSGlobalDomain AppleLocale

echo ""
echo "[First weekday]"
defaults read NSGlobalDomain AppleFirstWeekday

echo ""
echo "[Natural scrolling]"
defaults read NSGlobalDomain com.apple.swipescrolldirection

echo ""
echo "[Automatic capitalization]"
defaults read NSGlobalDomain NSAutomaticCapitalizationEnabled

echo ""
echo "[Fn behavior]"
defaults read com.apple.HIToolbox AppleFnUsageType

echo ""
echo "[Caps Lock mapping]"
defaults -currentHost read NSGlobalDomain \
  "com.apple.keyboard.modifiermapping.1452-591-0"
