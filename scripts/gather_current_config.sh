#!/bin/bash
set -v
# store the current dir
CUR_DIR=$(pwd)

# Store the default .config file location
CFG=$HOME"/.config"

for VAR in "/nvim" "/alacritty" "/zellij"; do
  NEW_CFG=$CFG$VAR
  if [ -d $NEW_CFG ]; then
    rm -rf $CUR_DIR$VAR
    cp -r $NEW_CFG $CUR_DIR$VAR
  fi
done

# lets get back to the CUR_DIR
cd $CUR_DIR

echo "Complete!"
