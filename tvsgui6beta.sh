#!/bin/bash
ver=v6
#спрашиваем, что надо делать
echo "enter option:"
read ban
case "$ban" in

info) toilet tvs gui && toilet $ver && echo by Valerik228 4pda 2018 ;;

start)   toilet tvsgui --metal && toilet $ver --metal && echo tvsgui v2 by valerik_228 && vncserver -geometry 1920x1080 :1 && DISPLAY=:1 lxpanel && DISPLAY=:1 openbox && DISPLAY=:1 pcmanfm && toilet server --metal && toilet started --metal && echo tvsgui v2.0 by valerik_228   ;; 

setup)clear && clear && clear && echo "setup. " && 
echo installing/updatimg components... && apt update && apt install dillo lxpanel tightvncserver pcmanfm openbox nano toilet  && toilet components && toilet installed && rm /usr/local/bin/tvsgui ;;
esac

#пишем скрипты

echo writing launchscript... && cat >/usr/local/bin/tvsgui<<-EOM

ver=v6
clear
 clear
 clear
toilet tvsgui --metal
 toilet $ver --metal 
 echo tvsgui $ver by valerik_228 
vncserver -geometry 1920x1080 :1 
 DISPLAY=:1 lxpanel & 
DISPLAY=:1 openbox &
 DISPLAY=:1 pcmanfm &
clear
toilet server --metal 
toilet started --metal 
 echo tvsgui $ver by valerik_228

EOM

echo writing killscript... && cat >/usr/local/bin/killtvsgui<<-EOM
#!/bin/bash

ver=v6

clear && clear && clear && vncserver -kill :1 && toilet server --metal && toilet down --metal

EOM

echo writing infoscript... && cat >/usr/local/bin/infotvsgui<<-EOM
#!/bin/bash

ver=v6

clear && clear && clear && toilet tvs gui --metal && toilet $ver && echo tvsgui $ver by valerik_228 4pda. 2018. это заняло 3 дня.

EOM

echo writing helpscript... && cat >/usr/local/bin/helptvsgui<<-EOM
#!/bin/bash

ver=v6

clear && clear && clear && toilet tvs gui --metal
echo Usage:
echo tvsgui - start server
echo killtvsgui - kill server
echo helptvsgui - help
echo confatvs - conf part a
echo confbtvs - conf part b
echo confalw - conf without dillo

EOM

echo writing confscript... && cat >/usr/local/bin/confatvs<<-EOM
echo configurating... 
adduser vnc
apt install dillo lxpanel tightvncserver pcmanfm openbox nano toilet

clear

echo 'setup complete. Type su - vnc, then Type confbtvs' 

EOM

echo writing confscript... && cat >/usr/local/bin/confbtvs<<-EOM
vncserver :1
vncserver -kill :1

clear

echo 'conf complete. Type tvsgui to start server' 

EOM

echo writing conflwscript... && cat >/usr/local/bin/confalw<<-EOM
apt install lxpanel openbox tightvscserver nano toilet pcmanfm

clear

echo 'setup complete. Type su - vnc, then Type confbtvs' 

EOM

#Делаем файлы исполняемыми

chmod +x /usr/local/bin/confbtvs

chmod +x /usr/local/bin/confatvs

chmod +x /usr/local/bin/tvsgui

chmod +x /usr/local/bin/killtvsgui

chmod +x /usr/local/bin/infotvsgui

chmod +x /usr/local/bin/helptvsgui

chmod +x /usr/local/bin/confalw

clear

echo скрипт записан. Введите confatvs для конфигурации
echo или confalw для легковесной конфигурации
echo script complected. Type confatvs for configuration 
echo and confalw for lightweight configuration