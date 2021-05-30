@echo off
set root=%HOMEDRIVE%%HOMEPATH%
for /F "tokens=* USEBACKQ" %%F in (%root%\account.txt) do (
set ssh_account=%%F
)
set id_rsa_location=%root%\.ssh\id_rsa
echo start uploading
echo uploading whitelist
echo ssh connects to %ssh_account%...
set insert_query="insert into Whitelist(Version) values('%DATE%');"
ssh -i %id_rsa_location% %ssh_account% "mkdir Whitelists & sqlite3 %root%\Desktop\UHDControlServer\db.sqlite \"%insert_query%\""
scp -i %id_rsa_location% "%root%\Whitelists\%DATE%.sqlite" "%ssh_account%:Whitelists"
echo.
echo whitelist have been uploaded!
echo finish
