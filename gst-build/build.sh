#!/bin/bash
echo "Building Gstreamer"

# change current directory to script's directory
cd "$(dirname "$0")"

# install required packages
apt-get update
apt-get install git

# Clone Cerbero and change to stable branch
git clone https://github.com/GStreamer/cerbero.git -b 1.14

# set git identity
cd cerbero/
git config user.email "example@example.com"
git config user.name "Example"

# cherry-pick necessary commits
git cherry-pick 24c24a82e528ffcea4c1462c24ebc4dc22d13f45 # openssl: set openssl_platform for ARM Linux
git cherry-pick 238067c88ace738e7ec628103473127aa5e85e95 # recipes: new recipe gst-omx
git cherry-pick 02ba4c1a25b5c427b1081177802365478dfc85d8 # gst-omx: Fix typo
cd ../

