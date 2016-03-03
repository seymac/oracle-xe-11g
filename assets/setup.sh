#!/bin/bash

# avoid dpkg frontend dialog / frontend warnings
export DEBIAN_FRONTEND=noninteractive

cat /assets/oracle-xe_11.2.0-1.0_amd64.deba* > /assets/oracle-xe_11.2.0-1.0_amd64.deb

# Install OpenSSH
apk --update add openssh
mkdir /var/run/sshd &&
echo 'root:admin' | chpasswd &&
/bin/ash /etc/init.d/sshd start &&
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config &&
# sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd &&
echo "export VISIBLE=now" >> /etc/profile &&

# Prepare to install Oracle
apk add libaio net-tools bc &&
ln -s /usr/bin/awk /bin/awk &&
mv /assets/chkconfig /sbin/chkconfig &&
chmod 755 /sbin/chkconfig &&

# Install Oracle
# dpkg --install /assets/oracle-xe_11.2.0-1.0_amd64.deb
