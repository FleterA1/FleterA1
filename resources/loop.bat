@echo off

tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || goto exit
:loop
tasklist | find /i "ngrok.exe" >Nul | || goto exit
goto loop
:exit
