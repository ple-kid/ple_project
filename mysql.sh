 #!/bin/bash
tar -zxf mysql-5.6.35-linux-glibc2.5-x86_64.tar.gz
mv mysql-5.6.35-linux-glibc2.5-x86_64 /usr/local/mysql
useradd -r -s /sbin/nologin mysql
chown -R mysql.mysql /usr/local/mysql
cd /usr/local/mysql
yum remove mariadb-libs -y
scripts/mysql_install_db --user=mysql
cp support-files/mysql.server /etc/init.d/mysql
service mysql start
# 追加/usr/local/mysql/bin目录到环境变量
echo 'export PATH=$PATH:/usr/local/mysql/bin' >> /etc/profile
source /etc/profile
echo "你看还需要source7一下/etc/profile文件"
