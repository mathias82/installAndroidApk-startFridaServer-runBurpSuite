#!/bin/bash
# Basic adb commands for install apk and uninstall apk
# Copyright (C) 2022 mstavrou
# Last revised 09/03/2022

clear

START=$(date +"%s")

function ShowElapsedTime {
echo '' 
end=$(date +"%s")
elapsed=$(($end-$START))
echo "$(($elapsed / 60)) minutes $(($elapsed % 60)) seconds"
echo '' 
}

echo '' 
echo '' 
echo '' 
echo '|||||||||||||||||||||||||||||||' 
echo '|                             |' 
echo '|          Frida Commands     |' 
echo '|                             |' 
echo '|                             |' 
echo '|||||||||||||||||||||||||||||||' 
echo ''
echo ''
echo ''
echo ''
echo '1 – Frida fake location'
echo '2 – Back'
echo '' 
echo '' 
read -n 1 -s -r -p 'Select operation type, ESC to cancel...' key
echo ''
if [ "$key" == $'\e' ]; then
echo '' 
echo '' 
echo 'Operation canceled!'
echo '' 
echo '' 
exit 1
fi
clear
case $key in
1)
echo '' 
echo '' 
echo 'Enter app package name to start fake location and press Enter, Ctrl+C to cancel...'
echo '' 
echo 'Packages Latest List of Installed Application'
echo '' 
adb shell pm list packages -3 | cut -f 2 -d ":"
echo '' 
read -e -p 'Package name: ' data
echo ''
echo 'Frida started'
echo '-------------------------'
frida -U -f $data -l js/fakeLocation.js --no-pause
;;
2)
echo '' 
echo '' 
echo '' 
echo ''
sh ./menu.sh
;;
*)
echo '' 
echo '' 
echo 'Unknown operation type!'
echo '' 
echo '' 
exit 1
;;
esac
ShowElapsedTime
