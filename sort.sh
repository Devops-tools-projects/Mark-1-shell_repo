#!/bin/bash


#############################
#author: saikamal
#To write a single line script to order the numbers inside file.txt file
#############################

grep -e "^[0-9]\{3\}\-[0-9]\{3\}\-[0-9]\{4\}$" -e "^([0-9]\{3\}) [0-9]\{3\}\-[0-9]\{4\}$" file.txt
