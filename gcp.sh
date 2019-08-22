#!/bin/bash

sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication  yes/g' /etc/ssh/sshd_config
systemctl restart sshd
echo 'zippyops' | passwd --stdin root
ip=$(curl icanhazip.com)
echo "ssh-keygen -R $ip" > /home/bootstrap.sh
echo "knife bootstrap $ip -x root -P zippyops -N node --run-list 'role[java]'" >> /home/bootstrap.sh
yum install ssh* -y
