#!/bin/bash

wget https://repo.percona.com/apt/percona-release_0.1-4.$(lsb_release -sc)_all.deb
sudo dpkg -i percona-release_0.1-4.$(lsb_release -sc)_all.deb
sudo apt-get update
sudo apt-get -y install libaio1 percona-xtradb-cluster-client-5.5 percona-xtradb-cluster-server-5.5 percona-xtrabackup percona-toolkit;
sudo mysql -e "CREATE FUNCTION fnv1a_64 RETURNS INTEGER SONAME 'libfnv1a_udf.so'";
sudo mysql -e "CREATE FUNCTION fnv_64 RETURNS INTEGER SONAME 'libfnv_udf.so'";
sudo mysql -e "CREATE FUNCTION murmur_hash RETURNS INTEGER SONAME 'libmurmur_udf.so'";
sudo mysql -u root -e "CREATE USER 'root'@'%'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;";
sudo mysql -u root -e "CREATE USER 'sstuser'@'localhost' IDENTIFIED BY 's3cretPass'; GRANT RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'sstuser'@'localhost'; FLUSH PRIVILEGES;";
sudo mysql -u root -e "GRANT process ON *.* to 'clusterCheck'@'localhost' IDENTIFIED BY 'clusterpwd!'; FLUSH PRIVILEGES;";

echo "Bind MySQL Address to 0.0.0.0"

sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf && \
  sed -Ei 's/#bind-address\s+=\s+127.0.0.1/bind-address=0.0.0.0/g' /etc/mysql/my.cnf

sudo /etc/init.d/mysql restart
