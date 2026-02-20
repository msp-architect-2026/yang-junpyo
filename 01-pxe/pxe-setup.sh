#!/bin/bash

echo "===== PXE Server Setup Start ====="

# 1. Disable SELinux & Firewalld
echo "[1/6] Disable SELinux and Firewalld"
sed -i 's/^SELINUX=.*/SELINUX=disabled/' /etc/selinux/config
setenforce 0
systemctl disable --now firewalld

# 2. Install Required Packages
echo "[2/6] Install DHCP, TFTP, FTP, Syslinux"
dnf install -y dhcp-server tftp-server syslinux vsftpd

# 3. Enable Services
echo "[3/6] Enable Services"
systemctl enable --now dhcpd
systemctl enable --now tftp.socket
systemctl enable --now vsftpd

# 4. Create TFTP Directory
echo "[4/6] Configure TFTP Root"
mkdir -p /var/lib/tftpboot/pxelinux.cfg
chmod -R 755 /var/lib/tftpboot

# 5. Mount Rocky ISO (Manual Step Required)
echo "[5/6] Mount Rocky Linux ISO to /var/ftp/pub"
mkdir -p /var/ftp/pub
echo ">>> Please mount Rocky ISO manually:"
echo "mount -o loop Rocky-9.x-x86_64-dvd.iso /var/ftp/pub"

# 6. Restart Services
echo "[6/6] Restart Services"
systemctl restart dhcpd
systemctl restart tftp.socket
systemctl restart vsftpd

echo "===== PXE Server Setup Complete ====="
