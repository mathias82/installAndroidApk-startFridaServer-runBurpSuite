#!/bin/bash
# Basic menu of install apk and run frida server
# Copyright (C) 2022 mstavrou
# Last revised 09/03/2022
clear
echo '' 
echo '' 
echo '' 
echo '|||||||||||||||||||||||||||||||' 
echo '|                             |' 
echo '|          Menu               |' 
echo '|                             |' 
echo '|                             |' 
echo '|||||||||||||||||||||||||||||||' 
echo ''

PS3='Please enter your choice: '
options=("install-uninstall APK" "Run fridaServer" "Start Burp Suite" "Run Frida Default Javascript doc" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "install-uninstall APK")
            sh ./installApk.sh
            ;;
        "Run fridaServer")
            sh ./fridaServerStart.sh
            ;;
        "Start Burp Suite")
            echo '' 
            read -e -p 'Burp Suite Locate: ' data
            echo ''
            nohup java -jar $data &
            sh ./menu.sh
            ;;
        "Run Frida Default Javascript doc")
            sh ./showFridaCommand.sh
            ;;    
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
