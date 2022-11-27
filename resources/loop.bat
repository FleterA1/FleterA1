@echo off

:loop
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || "C:\Windows\ngrok.exe" config add-authtoken 2I55cjy6KzjkPA6nrl0pyEGvEna_pQTqNjemjvXp7xWDCg2s | "C:\Windows\ngrok.exe" tcp 3389 --region ap
goto loop
exit
