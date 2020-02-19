#!/bin/bash
echo "by Teodor Cucu: ${GREEN}Updating Scripts${NOCOLOR}"
RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"
dt=$(date '+%d-%m-%Y')
echo "Create a dir /etc/updater/"
mkdir -p "/etc/updater/"
echo "Copy the script to the dir"
cp updater.sh "/etc/updater/"
echo "Set up a cronjob for everyday at 5am"
if grep -q "0 5 * * * /etc/updater/updater.sh" "/var/spool/cron/crontabs/$USER"; 
then
	echo "Cronjob allready set up"
else
echo "0 5 * * * /etc/updater/updater.sh" >> /var/spool/cron/crontabs/$USER 
fi
echo "Create a new dir for the updater logs"
mkdir -p "/etc/updater/logs/"
echo "step 1: ${GREEN}Configure the Packages${NOCOLOR}"
sudo dpkg --configure -a >> "/etc/updater/logs/updaterlog.$dt.log"
echo "step 2: ${GREEN}Fix broken installs${NOCOLOR}"
sudo apt-get install -f >> "/etc/updater/logs/updaterlog.$dt.log"
echo "step 3: ${GREEN}Get the updates${NOCOLOR}"
sudo apt-get update >> "/etc/updater/logs/updaterlog.$dt.log"
echo "step 4: ${GREEN}Upgrade the packages${NOCOLOR}"
sudo apt-get upgrade -y >> "/etc/updater/logs/updaterlog.$dt.log"
echo "step 5: ${GREEN}Distribution Upgrade${NOCOLOR}"
sudo apt-get dist-upgrade -y >> "/etc/updater/logs/updaterlog.$dt.log"
echo "step 6: ${GREEN}Remove Junk....${NOCOLOR}"
sudo apt-get --purge autoremove >> "/etc/updater/logs/updaterlog.$dt.log"
echo "step 7: ${GREEN}Remove more Junk...${NOCOLOR}"
sudo apt-get autoclean >> "/etc/updater/logs/updaterlog.$dt.log"
echo "${GREEN}Done${NOCOLOR}"
echo "${GREEN}For more information check out the logs in /etc/updater/logs${NOCOLOR}"