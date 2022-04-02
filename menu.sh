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
echo '|          Dev tools          |' 
echo '|                             |' 
echo '|                             |' 
echo '|||||||||||||||||||||||||||||||' 
echo ''

PS3='Please enter your choice: '
options=("Install-Uninstall APK" "Run Frida Server" "Start Burp Suite" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Install-Uninstall APK")
            sh ./sh/installApk.sh
            ;;
        "Run Frida Server")
            sh ./sh/fridaServerStart.sh
            ;;
        "Start Burp Suite")
            echo '' 
            read -e -p 'Burp Suite Locate: ' data
            echo ''
            nohup java -jar $data &
            sh ./menu.sh
            ;;  
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
