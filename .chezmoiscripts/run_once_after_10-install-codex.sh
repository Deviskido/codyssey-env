#!/bin/zsh

set -e

if ! command -v codex >/dev/null 2>&1; then
    echo "Installing Codex..."
    curl -fsSL https://chatgpt.com/codex/install.sh | sh
else
    echo "Codex already installed."
fi