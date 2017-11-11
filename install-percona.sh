#!/bin/bash

sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A;
echo "deb http://repo.percona.com/apt `lsb_release -cs` main" >> /etc/apt/sources.list.d/percona.list;
echo "deb-src http://repo.percona.com/apt `lsb_release -cs` main" >> /etc/apt/sources.list.d/percona.list;
sudo apt-get update;
sudo apt-get -y install percona-xtradb-cluster-client-5.5 percona-xtradb-cluster-server-5.5 percona-xtrabackup percona-toolkit;
sudo mysql -e "CREATE FUNCTION fnv1a_64 RETURNS INTEGER SONAME 'libfnv1a_udf.so'";
sudo mysql -e "CREATE FUNCTION fnv_64 RETURNS INTEGER SONAME 'libfnv_udf.so'";
sudo mysql -e "CREATE FUNCTION murmur_hash RETURNS INTEGER SONAME 'libmurmur_udf.so'";
sudo mysql -u root -e "CREATE USER 'root'@'%'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;";
sudo mysql -u root -e "CREATE USER 'sstuser'@'localhost' IDENTIFIED BY 's3cretPass'; GRANT RELOAD, LOCK TABLES, REPLICATION CLIENT ON *.* TO 'sstuser'@'localhost'; FLUSH PRIVILEGES;";
sudo mysql -u root -e "GRANT process ON *.* to 'clusterCheck'@'localhost' IDENTIFIED BY 'clusterpwd!'; FLUSH PRIVILEGES;";