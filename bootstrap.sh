#!/bin/bash  -x

#   configure and mount second disk 
#
yum install -y parted
parted /dev/sdb mklabel msdos
parted /dev/sdb mkpart primary 512 100%
mkfs.xfs /dev/sdb1
mkdir /var/lib/mysql
echo `blkid /dev/sdb1 | awk '{print$2}' | sed -e 's/"//g'` /var/lib/mysql   xfs   noatime,nobarrier   0   0 >> /etc/fstab
mount /var/lib/mysql

yum -y install net-tools git zsh htop wget
firewall-cmd --permanent --zone=public --add-service=mysql
firewall-cmd --reload
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s /bin/zsh
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum -y install mysql-server
systemctl start mysqld
echo "run ; mysql_secure_installation" ;

