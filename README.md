# RG353P
Knowledge for Handheld Device RG353P

CPU / Architecture: Rockchip RK3566 (ARM), same as Anbernic RG353P/M/V/VS, RG503, and Powkiddy RK2023, x55  
Kernel: Rockchip BSP 4.19  
GL driver: Mali  
Interface: KMS/DRM + EmulationStation  

OS:
1. Stock OS (Batocera rip): https://win.anbernic.com/download/233.html  
2. JELOS: https://github.com/JustEnoughLinuxOS/distribution
3. Ark OS: https://github.com/christianhaitian/arkos/wiki  

Set device for the first time:  

Press `START` -> `MAIN MENU` -> `NETWORK SETTINGS`  
`ENABLE WIFI` : change to `ON`  
`WIFI SSID` : change to `Dhani Home`  
`WIFI KEY` : change to `Genteng2202`  

Open ssh IP ADDRESS (192.168.1.X) and execute this command:  
`wget https://raw.githubusercontent.com/leonkasovan/RG353P/main/rg353p_setup_batocera_es.sh -O - | /bin/bash`  

## Apps for RG353P
Mini File Manager (Enhanced) : https://github.com/leonkasovan/351Files  
Custom Emulation Station : https://github.com/leonkasovan/batocera-emulationstation
