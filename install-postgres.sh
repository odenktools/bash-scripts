#!/bin/bash

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update -y
sudo apt-get -y install postgresql-9.5 postgresql-contrib-9.5
sudo apt-get -y install postgresql-client-common postgresql-common

###############################################
# No Password For Developing
###############################################
cat > /etc/postgresql/9.5/main/pg_hba.conf <<EOF

local   all             all                                    md5
local   all             all                                    trust
host    all             all             127.0.0.1/32           md5
host    all             all             127.0.0.1/32           trust

EOF
