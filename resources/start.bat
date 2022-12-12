@echo off
net config server /srvcomment:"Fleter.." > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v Wallpaper /t REG_SZ /d D:\a\wallpaper.bat
net user Fleter Admin@ys?0235 /add >nul
net localgroup administrators Fleter /add >nul
net user Fleter /active:yes >nul
net user installer /delete >nul
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant Fleter:F >nul
ICACLS C:\Windows\installer /grant Fleter:F >nul
echo Successfully installed!
echo IP:
curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url
echo Username: Fleter
echo Password: Admin@ys?0235
exit