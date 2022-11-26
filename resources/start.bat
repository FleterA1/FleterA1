@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Server 2019 By LittleFox" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v Wallpaper /t REG_SZ /d D:\a\wallpaper.bat
net user Fleter Admin@ys?0504 /add >nul
net localgroup administrators Fleter /add >nul
net user Fleter /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant Fleter:F >nul
ICACLS C:\Windows\installer /grant Fleter:F >nul
echo Successfully installed! If RDP is dead, rebuild again.
echo IP:
cd "D:\a\ngrok-rdp-one\ngrok-rdp-one\ngrok\"
ngrok.exe authtoken 2I55cjy6KzjkPA6nrl0pyEGvEna_pQTqNjemjvXp7xWDCg2s
powershell Start-Process Powershell -ArgumentList '-Noexit -Command ".\ngrok\ngrok.exe tcp 3389 --region ap"'
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Failed to retreive NGROK authtoken - check again your authtoken"
echo Username: Fleter
echo Password: admin
echo You can login now
ping -n 10 127.0.0.1 >nul
