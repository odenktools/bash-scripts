# All In One Bash Installer For Debian Family

### Install Postgres 9.3

wget https://raw.githubusercontent.com/odenktools/bash-scripts/install-postgres.sh

sudo bash ./install-postgres.sh 2>&1 |tee postgres-install.log

### Install NodeJS 7.x

wget https://raw.githubusercontent.com/odenktools/bash-scripts/install-node7.sh

sudo bash ./install-node7.sh 2>&1 |tee node7-install.log

### Install Java 8

wget https://raw.githubusercontent.com/odenktools/bash-scripts/install-java8.sh

sudo bash ./install-java8.sh 2>&1 |tee java8-install.log

### Install Percona MySQL 5.x

wget https://raw.githubusercontent.com/odenktools/bash-scripts/install-percona.sh

sudo bash ./install-percona.sh 2>&1 |tee percona-install.log

### Install PlayFramework 2.x

wget https://raw.githubusercontent.com/odenktools/bash-scripts/install-playframework.sh

sudo bash ./install-playframework.sh 2>&1 |tee playframework-install.log
