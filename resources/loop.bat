@echo off

tasklist | find /i "ngrok.exe" && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || goto ngrok

:loop
tasklist | find /i "ngrok.exe" || goto exit
tasklist | find /i "ngrok.exe" >nul && curl -s localhost:4040/api/tunnels >nul | jq -r .tunnels[0].public_url || goto exit
echo.
TIMEOUT /T 2 >nul >nobreak
goto loop

:ngrok
"C:\Windows\ngrok.exe" config add-authtoken 2I55cjy6KzjkPA6nrl0pyEGvEna_pQTqNjemjvXp7xWDCg2s
powershell Start-Process Powershell -ArgumentList '-Noexit -Command ""C:\Users\Fleter\Downloads\ngrok-v3-stable-windows-amd64\ngrok.exe" tcp 3389 --region ap"'
goto loop

:exit
pause >null
exit
