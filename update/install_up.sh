#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/scvpn/theme/color.conf)
export NC="\e[0m"
export YELLOW='\033[0;33m';
export RED="\033[0;31m" 
export COLOR1="$(cat /etc/scvpn/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
export COLBG1="$(cat /etc/scvpn/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"                    
###########- END COLOR CODE -##########

echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Remove Old Script"
sleep 2
echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Downloading New Script"
wget -q -O /usr/bin/about "https:https://raw.githubusercontent.com/godtrex99/v4/main/update/about.sh" && chmod +x /usr/bin/about
wget -q -O /usr/bin/auto-reboot "https:https://raw.githubusercontent.com/godtrex99/v4/main/update/auto-reboot.sh" && chmod +x /usr/bin/auto-reboot
wget -q -O /usr/bin/bw "https:https://raw.githubusercontent.com/godtrex99/v4/main/update/bw.sh" && chmod +x /usr/bin/bw
wget -q -O /usr/bin/clearcache "https:https://raw.githubusercontent.com/godtrex99/v4/main/update/clearcache.sh" && chmod +x /usr/bin/clearcache
wget -q -O /usr/bin/menu "https:https://raw.githubusercontent.com/godtrex99/v4/main/update/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/menu-domain "https:https://raw.githubusercontent.com/godtrex99/v4/main/update/menu-domain.sh" && chmod +x /usr/bin/menu-domain
wget -q -O /usr/bin/menu-set "https:https://raw.githubusercontent.com/godtrex99/v4/main/update/menu-set.sh" && chmod +x /usr/bin/menu-set
wget -q -O /usr/bin/menu-ssh "https:https://raw.githubusercontent.com/godtrex99/v4/main/update/menu-ssh.sh" && chmod +x /usr/bin/menu-ssh
wget -q -O /usr/bin/menu-trgo "https:https://raw.githubusercontent.com/godtrex99/v4/main/update/menu-trgo.sh" && chmod +x /usr/bin/menu-trgo
wget -q -O /usr/bin/menu-trojan "https:https://raw.githubusercontent.com/godtrex99/v4/main/update/menu-trojan.sh" && chmod +x /usr/bin/menu-trojan
wget -q -O /usr/bin/menu-vless "https:https:https://raw.githubusercontent.com/godtrex99/v4/main/update/menu-vless.sh" && chmod +x /usr/bin/menu-vless
wget -q -O /usr/bin/menu-vmess "https:https://raw.githubusercontent.com/godtrex99/v4/main/update/menu-vmess.sh" && chmod +x /usr/bin/menu-vmess
wget -q -O /usr/bin/menu-webmin "https:https://raw.githubusercontent.com/godtrex99/v4/main/update/menu-webmin.sh" && chmod +x /usr/bin/menu-webmin
wget -q -O /usr/bin/restart "https:https://raw.githubusercontent.com/godtrex99/v4/main/update/restart.sh" && chmod +x /usr/bin/restart
wget -q -O /usr/bin/running "https:https://raw.githubusercontent.com/godtrex99/v4/main/update/running.sh" && chmod +x /usr/bin/running
sleep 2
echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Download Changelog File"
wget -q -O /root/clog.txt "https://raw.githubusercontent.com/kamunikan/update/main/update_file/clog.txt" && chmod +x /root/clog.txt
echo -e "$COLOR1│${NC}  $COLOR1[INFO]${NC} Read Clog? ./root/clog.txt"
sleep 2

cat> /etc/cron.d/cleaner << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 */2 * * * root /usr/bin/cleaner
END

service cron restart > /dev/null 2>&1

#wget https://raw.githubusercontent.com/godtrex99/v4/main/update/install_up.sh && chmod +x install_up.sh && ./install_up.sh