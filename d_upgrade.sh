echo "by Teodor Cucu: ${GREEN}Updating Scripts${NOCOLOR}"

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"


echo

echo "step 1: ${GREEN}Vorkonfigurierung der Paketen${NOCOLOR}"
sudo dpkg --configure -a

echo

echo "step 2: ${GREEN}Mögliche Fehlinstallationen beheben${NOCOLOR}"
sudo apt-get install -f 


echo

echo "step 3: ${GREEN}Updates holen${NOCOLOR}"
sudo apt-get update 


echo

echo "step 4: ${GREEN}Upgrades durchführen${NOCOLOR}"
sudo apt-get upgrade -y

echo

echo "step 5: ${GREEN}Betriebsystem Upgrade${NOCOLOR}"
sudo apt-get dist-upgrade -y

echo

echo "step 6: ${GREEN}Unnötige resourcen löschen...${NOCOLOR}"
sudo apt-get --purge autoremove 

echo

echo "step 7: ${GREEN}Weitere unnötige resourcen löschen${NOCOLOR}"
sudo apt-get autoclean 