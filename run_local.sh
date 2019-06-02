#!/bin/bash
sudo cp -r $(pwd)/* /srv/salt/
sudo salt-call --local $*
