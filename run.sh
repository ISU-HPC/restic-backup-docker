#!/bin/sh

echo "Removing old container names 'backup-test' if exists"
sudo docker rm -f -v backup-test || true

echo "Start backup-test container. Backup of ~/test-data/ to repository ~/test-repo/ every minute"
sudo docker run --privileged --name backup-test \
-e "RESTIC_PASSWORD=test" \
-e "RESTIC_TAG=test" \
-e "BACKUP_CRON=* * * * *" \
-e "RESTIC_FORGET_ARGS=--keep-last 10" \
-v ~/test-data:/data \
-v ~/test-repo/:/mnt/restic \
-t restic-backup


