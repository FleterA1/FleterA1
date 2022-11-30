@echo off

tasklist | find /i "ngrok.exe" && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || goto ngrok

:loop
echo.
tasklist | find /i "ngrok.exe" || goto ngrok
tasklist | find /i "ngrok.exe" && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || goto loop
timeout /T 5 >nul
goto loop

:ngrok
"C:\Windows\ngrok.exe" config add-authtoken 1jlQ3vQwtRHGQaZ4lkIhaslLt31_5knGeAyKG3dvVJbt7nuRr
powershell Start-Process Powershell -ArgumentList '-Noexit -Command ""C:\Users\Fleter\Downloads\ngrok-v3-stable-windows-amd64\ngrok.exe" tcp 3389 --region ap"'
timeout /T 5 >nul
goto loop

:exit
pause >null
exit
