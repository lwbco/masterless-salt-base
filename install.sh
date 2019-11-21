#!/usr/bin/env bash
set -e
[[ -z "$1" ]] && echo "You must specify a [nodename] for salt" && exit
echo "Setting up nodename: $1"
echo "Updating apt..."
apt-get update
echo "Installing curl and git..."
apt-get install -y wget git curl zsh gpg

DIR=/srv/masterless/lwbco
echo "Cloning masterless-lwbco-base into $DIR..."
[[ -e $DIR/.git ]] && rm -rf $DIR
git clone https://github.com/lwbco/masterless-salt-base.git $DIR

echo "Installing Salt..."
# wget -O - https://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
# echo "deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest bionic main" > /etc/apt/sources.list.d/saltstack.list
# chmod 0644 /etc/apt/sources.list.d/saltstack.list

apt-get install -y salt-minion

echo "$1" > /etc/salt/minion_id

cp $DIR/base/salt/config/etc/salt/minion.d/masterless.conf /etc/salt/minion.d/masterless.conf
chmod 0644 /etc/salt/minion.d/masterless.conf

/usr/bin/salt-call --local --file-root=$DIR/base state.highstate
