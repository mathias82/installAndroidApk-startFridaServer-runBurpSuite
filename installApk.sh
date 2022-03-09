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
echo '|          Dev Tools          |' 
echo '|                             |' 
echo '|                             |' 
echo '|||||||||||||||||||||||||||||||' 
echo ''
echo ''
echo ''
echo ''
echo '1 – Uninstall app'
echo '2 – All Installed Packages'
echo '3 – Install app simple apk'
echo '4 – Install-multiple apk'
echo '5 – Uninstall & install app'
echo '6 – Back'
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
echo 'Enter app package name to uninstall, e.g. com.games.XXX and press Enter, Ctrl+C to cancel...'
echo '' 
echo 'Packages Latest List of Installed Application'
echo '' 
adb shell pm list packages -3 | cut -f 2 -d ":"
echo '' 
read -e -p 'Package name: ' data
echo ''
echo 'Uninstall started'
echo '-------------------------'
adb devices | tail -n +2 | cut -sf 1 | xargs -I {} adb -s {} uninstall $data
;;
2)
echo '' 
echo '' 
echo 'Show all installed packages' 
echo ''
echo 'All installed packages started'
echo '-------------------------'
adb shell pm list packages
;;  
3)
echo '' 
echo '' 
echo 'Enter path to APK file to install and press Enter, Ctrl+C to cancel...' 
echo '' 
read -e -p 'Path to APK: ' data
echo ''
echo 'Install started'
echo '-------------------------'
adb devices | tail -n +2 | cut -sf 1 | xargs -I {} adb -s {} install $data
;; 
4)
echo '' 
echo '' 
echo 'Enter path to APK file to install and press Enter, Ctrl+C to cancel...' 
echo '' 
read -e -p 'Path to APK: ' data
echo ''
echo 'Install started'
echo '-------------------------'
adb devices | tail -n +2 | cut -sf 1 | xargs -I {} adb -s {} install-multiple $data
;;
5)
echo '' 
echo '' 
echo 'Enter app package name to uninstall, e.g. com.games.XXX and press Enter, Ctrl+C to cancel...'
echo '' 
read -e -p 'Package name: ' data
echo ''
echo 'Enter path to APK file to install, e.g. and press Enter, Ctrl+C to cancel...' 
echo '' 
read -e -p 'Path to APK: ' data2
echo ''
echo 'Uninstall started'
echo '-------------------------'
adb devices | tail -n +2 | cut -sf 1 | xargs -I {} adb -s {} uninstall $data
echo ''
echo 'Install started'
echo '-------------------------'
adb devices | tail -n +2 | cut -sf 1 | xargs -I {} adb -s {} install $data2
;;
6)
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