#!/bin/bash

LOG_DIR="/var/log"
BACKUP_DIR="/home/sai/backup"
BACK_SRC="/home/sai/documents"
SPACE=80
DAYS=7

# to check disk space and alert the user if its beyond certain level
disk_space() {
	echo "Checking space"
	disk=$(df -h / |tail -1 |awk '{print $5}'|sed 's/%//') #tail get last line, aws gets 5th row, sed remove/replace % in output
	
	if [ $disk -ge $SPACE ]; then
		echo "WARNING: Disk usage is above $SPACE%, Disk space is $disk%"
	else
		echo "Disk usage is $disk%, can continue"
	fi

}

#to backup a directory
backup() {
	echo "Creating backup of $BACK_SRC, find it in $BACKUP_DIR"
	if [ ! -d "$BACKUP_DIR" ]; then
		mkdir "$BACKUP_DIR"
	fi
	timestamp=$(date +'%Y%m%d_%H%M%S') #to print date in year month day_hour min sec order
	tar -czf "$BACKUP_DIR/backup_$timestamp.tar.gz" -C  "$BACK_SRC" .
	echo "Backup create :$BACKUP_DIR/backup_$timestamp.tar.gz"


}
# to cleanup logs that are old then a certain days

log_clean() {
	echo "logs cleanup"
	find "$BACKUP_DIR" -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \; 
	echo "old log files removed"


}

#to display system info like uptime and disk usage and memory usage
system_info() {
	echo "To view system info"
	echo "-------------------"
	uptime
	echo "View of disk uage"
	du -kh
	echo "View of memory uage"
	free -h
}


# to call all the functions

echo "system maintanence script"
echo "---------------------------"
disk_space

backup

log_clean

system_info

echo "completed"
