if (( $EUID != 0 )); then
    echo -e "${CYAN}Jalankan Script Ini Mengunakan root"
    exit
fi

clear



portuguese(){
    bash <(curl https://raw.githubusercontent.com/Hexel-Hosting/pterodactylthemes/main/instaladorportugues.sh)
}

german(){
    bash <(curl https://raw.githubusercontent.com/Hexel-Hosting/pterodactylthemes/main/instaladorgerman.sh)
}

english(){
    bash <(curl https://raw.githubusercontent.com/Hexel-Hosting/pterodactylthemes/main/instaladorenglish.sh)
}
Indonesia(){
    bash <(curl https://raw.githubusercontent.com/Hexel-Hosting/pterodactylthemes/main/instaladorenglish.sh)
}

    CYAN='\033[0;36m'
    echo -e "${CYAN}Copyright (c) 2023 Hexel-Hosting"
    echo -e "${CYAN}This Software is opensource."
    echo -e "Theme Instalator"
    echo -e "${CYAN} WhatsApp: https://chat.whatsapp.com/CmzVZLZl7xL2TNtd9dUvPc"
    echo -e "Select your Language"
    echo -e "${CYAN}[1] Portuguese"
    echo -e "${CYAN}[2] German"
    echo -e "${CYAN}[3] English"
    echo -e "${CYAN}[4] Indonesia"
    echo -e "${CYAN}[5] Exit"
    
read -p "Silahkan Pilih Bahasa Dibawah: " choice
if [ $choice == "1" ]
    then
    portuguese
fi
if [ $choice == "2" ]
    then
    german
fi
if [ $choice == "3" ]
    then
    english
fi
if [ $choice == "4" ]
    then
    Indonesia
fi
if [ $choice == "5" ]
    then
    exit
fi
