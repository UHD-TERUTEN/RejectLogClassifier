@echo off
set root=%HOMEDRIVE%%HOMEPATH%
echo 1. Copy send.bat to %root%...
set SOURCE_PATH=%~dp0%send.bat
copy "%SOURCE_PATH%" "%root%"
echo Register send.bat to taskschd...
schtasks /create /tn "Whitelist Sender" /sc "DAILY" /rl HIGHEST /st 13:00 /tr "%root%\send.bat"
echo Install Succeeded. This window will be closed automatically after 10 seconds..."
timeout 10 > NUL