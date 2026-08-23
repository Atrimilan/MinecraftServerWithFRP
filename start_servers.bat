@echo off

start "" wt.exe -w 0 new-tab --title "Minecraft server" -d "./mc_server" cmd /k run.bat ; new-tab --title "FRP client" -d "./frpc" cmd /k run.bat
