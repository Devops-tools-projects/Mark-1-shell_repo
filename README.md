# Linux 

Booting process in Linux systems.

### BIOS -->  BootLoader -->  Kernal Initialization --> init System --> Runlevel/Target --> Login Prompt 

## Linux Commands

- **Command to create parent directories in linux**
~~~
mkdir -pv foo/bar/baz
~~~

- **To see the processes that using more memory and more cpu**
~~~
top # we can use M to sort them with high memory
top # we can use C to sort them with high cpu
~~~

- **To see the systemd units**
~~~
systemctl list-units
~~~

- **To copy the files from one system to another, without the duplicates and only the difference**
~~~
rsync -av <file/directory> <server>
~~~

- **To troubleshoot the issues, we can use below command to monitor the system**
~~~
journalctl -f
~~~

## Systemd config changes
Service configurations are stored in "/usr/lib..." path. but Changes to the files inside this path is forbidden so to perform any config chages we need to do them in "/etc/systemd/system/<unit>.d" .

we can create a directory with the units name along with ".d" , so the configuration is going to be applicable there.

- **if we want to perform the changes to the ssnd.service units description value**
~~~
cat /usr/lib/systemd/sshd.service              #check the original path "/usr/lib/systemd/sshd.service" to see which value that you want to change.
mkdir /etc/systemd/system/sshd.service.d       #now we can create a new file in etcd and edit that value.
vim 00-description.conf                        # 00 will make this file execte first and the value we are changing is description of the file.
systemctl daemon-reload                        # This will be used to reload the systemctl and update changes.
~~~
- **Note** : we can also perform authorization activity by only giving server access to user. who are part of a servtain group using this above method.
~~~
vim /etc/systemd/system/sshd.service.d/00-groups.conf    # we can create an update this file so that only certain groups has access to the server(authorization)

AllowGroups admin                                        # this entry is added to only allow users from admin group
~~~

# Firewall in linux

in Linux firewalld is the package and service. we can communicate to firewalld using "firewall-cmd".

***Zone***: in firewall, zones are logical groupings of network interfaces that define trust levels, security policies, and traffic flow rules between different parts of a network.
Firewall zones allow you to assign different trust levels to different parts of your network, such as:

- **Internal (trusted)**

- **External (untrusted)**

- **DMZ (Demilitarized Zone)**

- **Public**

- **Private**

- **Guest**

- **VPN**

Each zone has specific rules about what kind of traffic is allowed to and from other zones.

## My first project
AWS monitoring code using shell scripting

we are first going to connect to the aws from our console using
"aws configure"

Post providing the "access key" and "password". we will execute the scrips used for listing all the detils like s3,ec2,Lambda,IAM users

we can add this script to cron to get details daily.

## Sort script

To sort the proper phone number from teh file.txt in single line command

we have used grep command, along with -e to include multiple regex

"[0-9]\{3\}" represents 3 numbers (\{3\}) between the range 0-9

^ is start of string. $ indicates end of the string.

\ to supress the specialness of the character.

## To Print the 10 lines

To print the 10th lines, we can use awk command. 

we need to provide the file.txt as input, and it will print 10th line

## Network monitor

To monitor and check the network connection, we can observe the connections like internet connection, DNS resolution, latency ,and internet speed

For internet connection we are using commands like ping
~~~
ping -c 4 <TARGET_IP>
~~~

For DNS resolution we are using nslookup
~~~
nslookup <TARGET_DOMAIN>
~~~

For Latency we can using ping as well
~~~
ping -c 4 <LATENCY_TARGET> | tail -n 1 | awk -F '/' '{print $5}'
~~~

For internet speed we are using program like speedtest
~~~
speedtest-cli --simple
~~~

The output is forwarded to the network_troubleshoot.log file

## dashed file (-)

A file name is of - then we cant view or open the file, we need to use fqdn for opening files like that
~~~
cat ./-
~~~
