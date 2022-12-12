Expand-Archive ngrok.zip
.\ngrok\ngrok.exe config add-authtoken 1jlQ3vQwtRHGQaZ4lkIhaslLt31_5knGeAyKG3dvVJbt7nuRr
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -name "UserAuthentication" -Value 1
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
Start-Process Powershell -ArgumentList '-Noexit -Command ".\ngrok\ngrok.exe tcp 3389 --region ap"'
copy ngrok.exe C:\Windows\ngrok.exe