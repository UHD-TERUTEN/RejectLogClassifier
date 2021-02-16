@echo off
echo Register send.bat to taskschd...
schtasks /create /tn "Whitelist Sender" /sc "DAILY" /rl HIGHEST /st 00:00 /ru system /tr "%~dp0%\send.bat"
echo Install Succeeded. This window will be closed automatically after 10 seconds..."
timeout 10 > NUL