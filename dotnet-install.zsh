#!/usr/bin/env zsh

TOOLS_DIR="$HOME/.tools"
mkdir -p "$TOOLS_DIR"

## Install
echo "Installing dotnet-install"
NAME="dotnet-install"
URL="https://dot.net/v1/$NAME.sh"

curl  -L -o "$TOOLS_DIR/$NAME" $URL
chmod +x  "$TOOLS_DIR/$NAME"
