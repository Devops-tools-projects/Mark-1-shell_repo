#!/bin/bash

TARGET_IP="8.8.8.8"
TARGET_DOMAIN="example.com"
LATENCY_TARGET="google.com"
LOG_FILE="network_troubleshoot.log"

# function to check the internet connection

check_connection() {
	echo "checking internet connection"
	ping -c 4 $TARGET_IP >> $LOG_FILE  #it sends pings 4 times and send them to logfile
	if [ $? -eq 0 ]; then   	#it will check if last command run properly or not
		echo "internet connection is GOOD"
	else
		echo "No interent connection"
	fi
}

# funtion to check DNS resolution

check_dns() {
	echo "checking DNS resolution for $TARGET_DOMAIN..."
	nslookup $TARGET_DOMAIN >> $LOG_FILE
	if [ $? -eq 0 ]; then
		echo "DNS resolution for $TARGET_DOMAIN is GOOD" 
	else
		echo "DNS resolution failed for $TARGET_DOMAIN"
	fi
}

# function to check latency

check_latency() {
	echo "chekcing latency to $LATENCY_TARGET..."
	latency=$(ping -c 4 $LATENCY_TARGET | tail -n 1 | awk -F '/' '{print $5}')
	if [ $? -eq 0 ]; then
		echo "latency to $LATENCY_TARGET is $latency ms" >> $LOG_FILE
	else
		echo "latency check failed for $LATENCY_TARGET" >> $LOG_FILE
	fi
}

# funtion to check internet speed (download and upload speed)

check_speed() {
	echo "checking internet speed..."
	speedtest-cli --simple | tee -a $LOG_FILE
}

log_datetime() {
	echo "Network troubleshoot - $(date)" > $LOG_FILE
	echo "===============================" >> $LOG_FILE
}

log_datetime
check_connection
check_dns
check_latency
check_speed
echo "Network troubleshooting completed. Check the log file ($LOG_FILE) for details."

