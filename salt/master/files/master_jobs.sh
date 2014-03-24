#!/bin/sh

# nightly jobs

# update the salt-master and minions

# update the salt master itself

cd /srv/
git pull
salt master state.highstate
