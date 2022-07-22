#!/usr/bin/env zsh

TOOLS_DIR="$HOME/.tools"
mkdir -p "$TOOLS_DIR"

## Install
echo "Installing dotnet-install"
NAME=dotnet-install
URL="https://dot.net/v1/$NAME"

curl  -L -o "$TOOLS_DIR/$NAME" $URL
chmod +x  "$TOOLS_DIR/$NAME"
echo

## Remove
# echo "Installing dotnet-core-uninstall"
# NAME="dotnet-core-uninstall.tar.gz"
# VERSION="1.5.255402"
# URL="https://github.com/dotnet/cli-lab/releases/download/$VERSION/$NAME"

# TEMP_DIR=`mktemp -d`
# curl -L -o "$TEMP_DIR/$NAME" $URL
# tar -zxf "$TEMP_DIR/$NAME"  -C "$HOME/.tools/"
