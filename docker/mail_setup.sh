#!/bin/bash

# Update and install msmtp
sudo apt-get update
sudo apt-get install -y msmtp msmtp-mta ca-certificates
sudo apt-get install mailutils -y

# Create the msmtp configuration directory
mkdir -p ~/.msmtp

# Create the msmtp configuration file
cat <<EOF > ~/.msmtprc
# Set default values for all accounts.
defaults
auth           on
tls            on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile        ~/.msmtp/msmtp.log

# Gmail account
account        gmail
host           smtp.gmail.com
port           587
from           dhulswar591@gmail.com
user           dhulswar591@gmail.com
password       kmnshoxmfovbmsex

# Set a default account
account default : gmail
EOF

# Set the correct permissions for the msmtp configuration file
chmod 600 ~/.msmtprc

# Create a log file for mstp
touch ~/.msmtp/msmtp.log
chmod 600 ~/.msmtp/msmtp.log

echo "msmtp configuration completed. You can now send emails using the configured Gmail account."
