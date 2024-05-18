# linux-bleach

### About
- cleans `/var/logs/`
- cleans `/tmp/`
- cleans `$HOME/.cache/`
- cleans log files older than 5 days (no truncate, full delete)
- cleans temp files older than 5 days (no truncate, full delete)
- cleans cache dir files older than 5 days (no truncate, full delete)
- cleans apt package management (autoremove, celan, autocelan)
- cleans node cache (npm clean cache --force, npm prune)

### How to
- ssh to server, go in root user's home directory
- make sure you are loggen in as root
- run `https://github.com/BakirGracic/linux-bleach.git`
- go inside `cd linux-bleach`
- enable execution, run `sudo chmod +x installer.sh && sudo chmod +x main.sh`
- run installer `./installer.sh`
- check if cron job added with `crontab -e`
- alternatively, run script manually via `./main.sh`

### Feel free to modify this script to your needs
