# Mail configuration in linux for notification

## Step 1: Install Required Packages

~~~
sudo apt update
sudo apt install mailutils ##for ubuntu 
~~~

During Postfix installation:

Choose "Internet Site" when prompted.

Enter your system's FQDN or hostname (e.g., yourhostname.localdomain).


## Step 2: Configure Postfix for Gmail Relay

Edit the config file
~~~
sudo nano /etc/postfix/main.cf

#add this to the file

relayhost = [smtp.gmail.com]:587
smtp_use_tls = yes
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt
~~~

## Step 3: Create Authentication File
Create this file sasl_passwd
~~~
sudo nano /etc/postfix/sasl_passwd

#add this line to this
[smtp.gmail.com]:587 <youremail@gmail.com>:<your_app_password>

#To run the chmod
sudo postmap /etc/postfix/sasl_passwd
sudo chmod 600 /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db
~~~

## Step 4: Restart Postfix
restart the postfix service
~~~
sudo systemctl restart postfix
~~~

To get the app password for the email "https://myaccount.google.com/apppasswords"


