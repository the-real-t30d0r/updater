
# Updater Script for Linux Enviroments.

A small but nice shell script to protect us from security gaps caused by forgotten updates.

What it does?

- Fixing broken  packages
- Get the updates from sources (update)
- Upgrade the packages (upgrade)
- Cleans the junk (auto-clean,purge etc..)

**

A cronjob its built-in to run the script **everyday at 5 AM,** and it **logs as well everyday** at /etc/uptader/logs. You can easily sort the files by date.

** 

**How to use?**

    git clone [https://github.com/teodorcucu/updater]
    cd updater
    sh updater.sh
