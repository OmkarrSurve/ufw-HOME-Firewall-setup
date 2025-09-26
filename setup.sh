#!/bin/bash

# UFW Home Firewall Setup Script
# Run with sudo: sudo ./setup.sh

# Check if running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)"
  exit 1
fi

# Ensure UFW is installed
apt update
apt install -y ufw

# Enable IPv6 in UFW config
sed -i 's/IPV6=no/IPV6=yes/' /etc/default/ufw

# Set default policies
ufw default deny incoming
ufw default allow outgoing

# Allow essential services
ufw allow ssh  # Port 22
ufw allow http  # Port 80
ufw allow https  # Port 443

# Enable firewall
ufw --force enable

# Display status
ufw status verbose

echo "UFW firewall setup complete. Check logs at /var/log/ufw.log for blocked attempts."
