#!/usr/bin/env bash
set -e
[[ -z "$1" ]] && echo "You must specify a [nodename] for salt" && exit
echo "Setting up nodename: $1"
apt-get update
apt-get install -y wget git
git clone https://github.com/lwbco/masterless-salt-base.git /srv/salt

wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
cp /srv/salt/base/salt/config/etc/apt/sources.list.d/saltstack.list /etc/apt/sources.list.d/saltstack.list
chmod 0644 /etc/apt/sources.list.d/saltstack.list

apt-get update
apt-get install -y salt-minion git

echo "$1" > /etc/salt/minion_id

cp /srv/salt/base/salt/config/etc/salt/minion.d/masterless.conf /etc/salt/minion.d/masterless.conf
chmod 0644 /etc/salt/minion.d/masterless.conf

/usr/bin/salt-call state.highstate --local
