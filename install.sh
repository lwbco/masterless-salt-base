#!/usr/bin/env bash
set -e
[[ -z "$1" ]] && echo "You must specify a [nodename] for salt" && exit
echo "Setting up nodename: $1"
echo "Updating apt..."
apt-get update
echo "Installing wget and git..."
apt-get install -y wget git
DIR=/srv/masterless/lwbco-base
echo "Cloning masterless-lwbco-base into $DIR..."
[[-e $DIR/.git ]] && rm -rf $DIR
git clone https://github.com/lwbco/masterless-salt-base.git $DIR

echo "Installing Salt..."
curl -L https://bootstrap.saltstack.com -o install_salt.sh
sudo sh install_salt.sh -P -M

echo "$1" > /etc/salt/minion_id

cp $DIR/base/salt/config/etc/salt/minion.d/masterless.conf /etc/salt/minion.d/masterless.conf
chmod 0644 /etc/salt/minion.d/masterless.conf

/usr/bin/salt-call --local --file-root=$DIR/base state.highstate
