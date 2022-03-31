#!/bin/bash
# Basic adb commands login as root and execute command shell to start frida
# Copyright (C) 2022 mstavrou
# Last revised 09/03/2022

echo 'Running fridaServer';
adb root; 
echo '' 
echo '' 
adb devices;
echo '' 
adb shell "chmod 755 /data/local/tmp/fridaServer"; 
echo ''
echo 'Start Frida Server'
echo '-------------------------'
adb shell "/data/local/tmp/fridaServer &";