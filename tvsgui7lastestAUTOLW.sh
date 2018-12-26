#пишем скрипты

echo writing launchscript... && cat >/usr/local/bin/tvsgui<<-EOM
ver=v7
 clear
 clear
 clear
toilet tvsgui --metal
echo tvsgui v7 by valerik_228
splash start
exec &> /dev/null 
USER=vnc vncserver -geometry 1920x1080 :1 
USER=vnc DISPLAY=:1 lxpanel &  
USER=vnc DISPLAY=:1 openbox & 
USER=vnc  DISPLAY=:1 pcmanfm & 
USER=vnc  DISPLAY=:1 xterm & 


EOM

echo writing killscript... && cat >/usr/local/bin/killtvsgui<<-EOM

ver=v7
exec 6> /dev/null
clear && clear && clear
cd /	
stop=$(cat /root/.vnc/localhost:1.pid)

echo '*ERROR*: can not find server. server start?'
toilet *ERROR* --metal
kill $stop && clear &&  splash stop


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

echo writing splashscript... && cat >/usr/local/bin/splash<<-EOM

case $1 in
start) toilet server --metal
toilet started --metal
echo tvsgui v7 by valerik_228
;;
stop) toilet server --metal
toilet down --metal
;;
*) toilet sPlAsH --gay
esac


EOM

echo writing updaterscript...
cat >/usr/local/bin/updatetvsgui<<-EOM

rm -r ./tvsgui6/
git clone https://github.com/tvsclass/tvsgui6/
cd ./tvsgui6
chmod +x ./tvsgui6/tvsgui7stable.sh
./tvsgui6/tvsgui7stable.sh update


EOM


#Делаем файлы исполняемыми

chmod +x /usr/local/bin/confbtvs

chmod +x /usr/local/bin/updatetvsgui

chmod +x /usr/local/bin/splash

chmod +x /usr/local/bin/confatvs

chmod +x /usr/local/bin/tvsgui

chmod +x /usr/local/bin/killtvsgui

chmod +x /usr/local/bin/infotvsgui

chmod +x /usr/local/bin/helptvsgui

chmod +x /usr/local/bin/confalw

clear

confalw