#!/bin/bash -vx

# rcpao@rpi4b-04cc-4066:~/Documents/job/sgh/iot-relay $ cat /etc/rpi-issue 
# Raspberry Pi reference 2025-05-13
# Generated using pi-gen, https://github.com/RPi-Distro/pi-gen, f548f25325e28bea61904f5038a9b9fd0c92b07b, stage5

# fail: echo 'deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://nodesource.com nodistro main' | sudo tee /etc/apt/sources.list.d/nodesource.list
# fail: curl -fsSL https://nodesource.com | sudo -E bash -
sudo rm -f /etc/apt/sources.list.d/nodesource.list
sudo rm -f /etc/apt/sources.list.d/nodesource.sources

# fail: curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
# 2026-10-23 14:53:56 - Error: Unsupported architecture: armhf. Only amd64, arm64 are supported. Contact Nodesource for an extended support version https://nodesource.com/pages/contact-us.html. (Exit Code: 1)

sudo apt-get update
# sudo apt-get install -y nodejs 
sudo apt-get install -y nodejs npm # for armhf, 32-bit rpi-os

npm init -y
# sudo npm i onoff
# fail for Bookworm: sudo npm i onoff --unsafe-perm
# fail: sudo npm install rpi-gpio
sudo apt-get install pigpio -y


node hi.js
# node on.js
# node off.js
