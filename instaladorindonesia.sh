#!/bin/bash

if (( $EUID != 0 )); then
    echo -e "${CYAN}Jalankan Script Ini Mengunakan root"
    exit
fi

clear

instalartema(){
    cd /var/www/
    tar -cvf pterodactylbackup.tar.gz pterodactyl
    echo -e "${CYAN}Menginstall themes..."
    cd /var/www/pterodactyl
    rm -r pterodactylthemes
    git clone https://github.com/Hexel-Hosting/pterodactylthemes.git
    cd pterodactylthemes
    rm /var/www/pterodactyl/resources/scripts/pterodactylthemes.css
    rm /var/www/pterodactyl/resources/scripts/index.tsx
    mv index.tsx /var/www/pterodactyl/resources/scripts/index.tsx
    mv pterodactylthemes.css /var/www/pterodactyl/resources/scripts/pterodactylthemes.css
    cd /var/www/pterodactyl

    curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    apt update
    apt install -y nodejs

    npm i -g yarn
    yarn

    cd /var/www/pterodactyl
    yarn build:production
    sudo php artisan optimize:clear


}

voltar(){
bash <(curl https://raw.githubusercontent.com/Hexel-Hosting/pterodactylthemes/main/menu.sh)
}

instaladordetemas(){
    while true; do
        read -p "Anda yakin ingin memasang tema [y/n]? " yn
        case $yn in
            [Yy]* ) instalartema; break;;
            [Nn]* ) exit;;
            * ) echo "Tolong jawab ya atau tidak.";;
        esac
    done
}

reparar(){
    bash <(curl https://raw.githubusercontent.com/Hexel-Hosting/pterodactylthemes/main/reparar.sh)
}

restaurarbackup(){
    echo "Restoring Backup..."
    cd /var/www/
    tar -xvf pterodactylbackup.tar.gz
    rm pterodactylthemes.tar.gz

    cd /var/www/pterodactyl
    yarn build:production
    sudo php artisan optimize:clear
}

    CYAN='\033[0;36m'
    echo -e "${CYAN}Copyright 2023 Hexel-Hosting"
    echo -e "${CYAN}Program ini adalah perangkat lunak gratis, Anda dapat memodifikasi dan mendistribusikannya tanpa masalah."
    echo -e ""
    echo -e "${CYAN} WhatsApp: https://chat.whatsapp.com/CmzVZLZl7xL2TNtd9dUvPc"
    echo -e ""
    echo -e "${CYAN} [1] Install Theme"
    echo -e "${CYAN} [2] pulihkan Backup"
    echo -e "${CYAN} [3] Panel perbaikan (gunakan jika Anda memiliki masalah memasang tema)"
    echo -e "${CYAN} [4] kembali"
    echo -e "${CYAN} [5] keluar"

read -p "Enter a number: " choice
if [ $choice == "1" ]
    then
    instaladordetemas
fi
if [ $choice == "2" ]
    then
    restaurarbackup
fi
if [ $choice == "3" ]
    then
    reparar
fi
if [ $choice == "4" ]
    then
    voltar
fi
 
if [ $choice == "5"]
    then
    exit
fi
