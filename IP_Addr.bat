@echo off
color 0a
title IP Address Modification


:menu
mode 800
cls

echo +@@@@@@@   @@@@@@       @           =@         @                       #@      @                  @               @                             @@@@@@@@   @@@@@@  
echo     @     @@     @     @@@          @@         @                       @@%@  @ @                  @               @                                @      @@       
echo    *@     @@@@@@@@     @ @     @@@@@@@    @@@@@@   @@@@@@@@            @@  @@  @   @@@@@@    @@@@@@               @@@@@@@  -@@    @                @      @@       
echo    *@     @@          @@  @    @    @@   @     @     @                 @@      @   @    .@  @@    @               @     @    @*  @                 @      @@       
echo    *@     @@          @   @    @    @@   @     @     @                 @@      @   @    #@  @@    @               @     @     @ @@                 @      @@       
echo     @     @@         @@@@@@@   @    @@   @     @     @                 @@      @   @    =@  @@    @               @     @      @@                  @      @@     @ 
echo @@@@@@@@  @@         @     @    @@@@@@@   @@@@@@@    @                 @@      @   @@@@@@    @@@@@*@.            @@@@@@@      +@                @@@@@@@@   @@@@@@  
echo                                                                                                                             @@                                     
echo
echo
echo Choose your action:
echo 1. Configure Ethernet or Wi-Fi
echo 2. Ping 8.8.8.8
echo 3. Show IP configuration (ipconfig /all)
echo 4. Exit
set /p action="Enter your choice: "

if %action%==1 (
    goto interface_menu
) else if %action%==2 (
    echo Pinging 8.8.8.8...
    ping 8.8.8.8
    pause
    goto menu
) else if %action%==3 (
    echo Showing IP configuration...
    ipconfig /all
    pause
    goto menu
) else if %action%==4 (
    exit
) else (
    echo Invalid choice.
    pause
    goto menu
)


:interface_menu
cls

echo +@@@@@@@   @@@@@@       @           =@         @                       #@      @                  @               @                             @@@@@@@@   @@@@@@  
echo     @     @@     @     @@@          @@         @                       @@%@  @ @                  @               @                                @      @@       
echo    *@     @@@@@@@@     @ @     @@@@@@@    @@@@@@   @@@@@@@@            @@  @@  @   @@@@@@    @@@@@@               @@@@@@@  -@@    @                @      @@       
echo    *@     @@          @@  @    @    @@   @     @     @                 @@      @   @    .@  @@    @               @     @    @*  @                 @      @@       
echo    *@     @@          @   @    @    @@   @     @     @                 @@      @   @    #@  @@    @               @     @     @ @@                 @      @@       
echo     @     @@         @@@@@@@   @    @@   @     @     @                 @@      @   @    =@  @@    @               @     @      @@                  @      @@     @ 
echo @@@@@@@@  @@         @     @    @@@@@@@   @@@@@@@    @                 @@      @   @@@@@@    @@@@@*@.            @@@@@@@      +@                @@@@@@@@   @@@@@@  
echo                                                                                                                             @@                                     
echo

echo Choose your network interface:
echo 1. Ethernet
echo 2. Wi-Fi
set /p iface="Enter your choice: "

if %iface%==1 (
    set "interface_name=Ethernet"
) else if %iface%==2 (
    set "interface_name=Wi-Fi"
) else (
    echo Invalid choice.
    pause
    goto interface_menu
)


:sub_menu
cls

echo +@@@@@@@   @@@@@@       @           =@         @                       #@      @                  @               @                             @@@@@@@@   @@@@@@  
echo     @     @@     @     @@@          @@         @                       @@%@  @ @                  @               @                                @      @@       
echo    *@     @@@@@@@@     @ @     @@@@@@@    @@@@@@   @@@@@@@@            @@  @@  @   @@@@@@    @@@@@@               @@@@@@@  -@@    @                @      @@       
echo    *@     @@          @@  @    @    @@   @     @     @                 @@      @   @    .@  @@    @               @     @    @*  @                 @      @@       
echo    *@     @@          @   @    @    @@   @     @     @                 @@      @   @    #@  @@    @               @     @     @ @@                 @      @@       
echo     @     @@         @@@@@@@   @    @@   @     @     @                 @@      @   @    =@  @@    @               @     @      @@                  @      @@     @ 
echo @@@@@@@@  @@         @     @    @@@@@@@   @@@@@@@    @                 @@      @   @@@@@@    @@@@@*@.            @@@@@@@      +@                @@@@@@@@   @@@@@@  
echo                                                                                                                             @@                                     
echo


echo Choose IP configuration:
echo 1. Set Apo Pilo Laboratory IP address
echo 2. Enter IP address manually
echo 3. Set to DHCP.
echo 4. Exit
set /p config="Enter your choice: "

if %config%==1 (
    echo Setting Apo Pilo Laboratory IP address...
    netsh interface ip set address name="%interface_name%" static 192.168.10.241 255.255.255.0 192.168.10.254
    netsh interface ip set dnsservers name="%interface_name%" static 8.8.8.8
    netsh interface ipv4 add dnsserver name="%interface_name%" address=8.8.4.4 index=2
) else if %config%==2 (
    set /p ip="Enter IP address: "
    set /p subnet="Enter Subnet Mask: "
    set /p gateway="Enter Default Gateway: "
    echo Setting manually entered IP address...
    netsh interface ip set address name="%interface_name%" static %ip% %subnet% %gateway%
) else if %config%==3 (
    echo Setting to DHCP...
    netsh interface ip set address name="%interface_name%" dhcp
) else if %action%==4 (
    exit
) else (
    echo Invalid choice.
    pause
    goto sub_menu
)

echo IP address configuration complete.
pause
goto menu
