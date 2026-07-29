#simple deployment script to install nginx and start thee service
#!/bin/bash
apt-get update
apt install -y nginx
systemctl start nginx
systemctl enable nginx
