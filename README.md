# UNIX System Housekeeping Shell Cron Script

### What It Cleans
- log files (`/var/logs/`) older than 5 days (no truncate, full delete)
- temp files (`/tmp/`) older than 5 days (no truncate, full delete)
- cache dir (`$HOME/.cache/`) files older than 5 days (no truncate, full delete)
- cleans `apt` package management (autoremove, celan, autocelan)
- cleans `npm` (npm clean cache --force, npm prune)

### How to
- `cd` in `/root/`
- run `https://github.com/BakirGracic/linux-bleach`
- `cd` inside `linux-bleach`
- run `sudo chmod +x installer.sh && sudo chmod +x main.sh`
- run installer `./installer.sh`
- check if cron job added with `crontab -e`
- alternatively, run script manually via `./main.sh`
