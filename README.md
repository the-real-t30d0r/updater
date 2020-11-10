# Updater Script for Linux Enviroments.

A small but nice shell script to protect you from security gaps caused by forgotten updates.

What it does?

- Fixing broken  packages
- Get the updates from sources (update)
- Upgrade the packages (upgrade)
- Cleans the junk (auto-clean,purge etc..)



A cronjob its built-in to run the script **everyday at 5 AM,** and it **logs as well everyday** at /etc/uptader/logs. You can easily sort the files by date.

 

**Notes**

Make sure you already have configured the cronjob, if not, you need to do this:
   

     crontab -e

Save the file and exit.


**How to use?**

    sudo git clone https://github.com/xalqatraz/updater
    cd updater
    sudo chmod +x updater.sh
    sudo sh updater.sh
