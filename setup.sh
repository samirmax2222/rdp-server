#!/bin/bash

# Install Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Start Tailscale with auth key
sudo tailscale up --authkey=$TAILSCALE_AUTHKEY --hostname=rdp-codespace

# Install XRDP and desktop environment
sudo apt-get update -y
sudo apt-get install -y xrdp xfce4 xfce4-goodies dbus-x11

# Configure XRDP to use xfce
echo 'startxfce4' > ~/.xsession
sudo chmod +x ~/.xsession

# Set password for codespace user
echo 'codespace:password123' | sudo chpasswd

# Start XRDP
sudo service xrdp start

# Show Tailscale IP
echo '================================'
echo 'Setup Complete!'
echo 'Your Tailscale IP:'
tailscale ip -4
echo 'RDP Password: password123'
echo 'Username: codespace'
echo '================================'
