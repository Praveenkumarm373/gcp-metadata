#!/bin/bash

sed -i 's/#Port 22/Port 22/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication  yes/g' /etc/ssh/sshd_config
systemctl restart sshd
echo 'zippyops' | passwd --stdin root
echo '35.239.170.248 instance-1.us-central1-a.c.chef-244409.internal instance-1' >> /etc/hosts
ip=$(curl icanhazip.com)
echo "ssh-keygen -R $ip" > /home/bootstrap.sh
echo "knife bootstrap $ip -x root -P zippyops -N node" >> /home/bootstrap.sh
yum install ssh* -y
