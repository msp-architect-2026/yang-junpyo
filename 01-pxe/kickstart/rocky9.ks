#version=RHEL9
text
reboot

url --url=ftp://192.168.0.101/pub

lang ko_KR.UTF-8
keyboard --xlayouts='kr'
timezone Asia/Seoul --utc

network --bootproto=dhcp --device=ens160 --activate

clearpart --all --initlabel
autopart

%packages
@^minimal-environment
%end

firstboot --disable

# Encrypted example password (replace for production)
rootpw --iscrypted $6$example$abcdefghijklmnopqrstuv

%post
systemctl disable --now firewalld
setenforce 0
sed -i 's/^SELINUX=.*/SELINUX=permissive/' /etc/selinux/config
%end
