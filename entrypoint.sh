#!/bin/bash
cd /home/container || exit 1

# Configure colors
CYAN='\033[0;36m'
BLUE= '\033[0;34m'
RED= '\033[1;31m'
GREEN= '\033[1;32m'
RESET_COLOR='\033[0m'

# Set environment variable that holds the Internal Docker IP
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Print Node.js Version
cfonts "HEXEL-HOSTING" -a center -g blue,white
neofetch
printf "${RED}DOCKER VIP BY HEXEL - HOSTING"
printf "${GREEN} [NODEJS V17 BERHASIL TERINSTALL"
printf "${BLUE}INCLUDE PACKAGE: YARN, FFMPEG, IMAGEMAGICK, PYTHON, PM2, PNPM, NODEMON, SPEEDTEST"
node -v

# Replace Startup Variables
# shellcheck disable=SC2086
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo -e "${CYAN}STARTUP /home/container: ${MODIFIED_STARTUP} ${RESET_COLOR}"

# Run the Server
# shellcheck disable=SC2086
eval ${MODIFIED_STARTUP}