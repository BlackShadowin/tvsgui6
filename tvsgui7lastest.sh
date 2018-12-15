#!/bin/bash
ver=v7
#спрашиваем, что надо делать
echo "enter option:"
read ban

#старые варианты загрузки остались для совместимости с #v1 и v3 подобными tvsgui

case "$ban" in

info) toilet tvs gui && toilet $ver && echo by Valerik228 4pda 2018 ;;

start)   toilet tvsgui --metal && toilet $ver --metal && echo tvsgui v2 by valerik_228 && vncserver -geometry 1920x1080 :1 && DISPLAY=:1 lxpanel && DISPLAY=:1 openbox && DISPLAY=:1 pcmanfm && toilet server --metal && toilet started --metal && echo tvsgui v2.0 by valerik_228   ;; 

setup)clear && clear && clear && echo "setup. " && 
echo installing/updating components... && apt update && apt install dillo lxpanel tightvncserver pcmanfm openbox nano toilet  && toilet components && toilet installed && rm /usr/local/bin/tvsgui ;;
esac

#пишем скрипты

echo writing launchscript... && cat >/usr/local/bin/tvsgui<<-EOM
ver=v7
clear
 clear
 clear
toilet tvsgui --metal
 toilet $ver --metal 
 echo tvsgui $ver by valerik_228 
USER=vnc vncserver -geometry 1920x1080 :1 
clear
 USER=vnc DISPLAY=:1 lxpanel & 
clear
USER=vnc DISPLAY=:1 openbox &
clear
USER=vnc  DISPLAY=:1 pcmanfm &
clear
USER=vnc  DISPLAY=:1 xterm &
clear
toilet server --metal 
toilet started --metal 
 echo tvsgui $ver by valerik_228

EOM

echo writing killscript... && cat >/usr/local/bin/killtvsgui<<-EOM
#!/bin/bash

ver=v6

clear && clear && clear && USER=vnc vncserver -kill :1 && toilet && clear && server --metal && toilet down --metal

EOM

echo writing infoscript... && cat >/usr/local/bin/infotvsgui<<-EOM
#!/bin/bash

ver=v7

clear && clear && clear && toilet tvs gui --metal && toilet $ver && echo tvsgui $ver by valerik_228 4pda. 2018. это заняло 2 нед.

EOM

echo writing helpscript... && cat >/usr/local/bin/helptvsgui<<-EOM
#!/bin/bash

ver=v7

clear && clear && clear && toilet tvs gui --metal
echo Usage:
echo tvsgui - start server
echo killtvsgui - kill server
echo helptvsgui - help
echo confatvs - conf part a
echo confbtvs - conf part b
echo confalw - conf without midori

EOM

echo writing confscript... && cat >/usr/local/bin/confatvs<<-EOM
echo configurating... 
adduser vnc
apt install midori xterm lxpanel tightvncserver pcmanfm openbox nano toilet

clear

echo 'setup p1 complete'
echo 'configurating vncserver'
confbtvs

EOM

echo writing confscript... && cat >/usr/local/bin/confbtvs<<-EOM
USER=vnc vncserver :1
USER=vnc vncserver -kill :1

clear

echo setup complete.
helptvsgui

EOM

echo writing conflwscript... && cat >/usr/local/bin/confalw<<-EOM
apt install lxpanel xterm openbox tightvscserver nano toilet pcmanfm

clear

echo 'setup p1 complete'
echo 'configurating vncserver'
confbtvs

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

echo
echo
echo скрипт записан. Введите confatvs для конфигурации
echo
echo или confalw для легковесной конфигурации
echo
echo
echo script complected. Type confatvs for configuration 
echo
echo and confalw for lightweight configuration
echo
echo