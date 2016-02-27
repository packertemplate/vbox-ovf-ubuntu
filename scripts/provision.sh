#!/bin/bash

export DEBIAN_FRONTEND=noninteractive
unset PACKAGES

#begin
#your awesome provisioning here
#PACKAGES=""
#sudo -E -H apt-get update
#sudo -E -H apt-get install -y -q --no-install-recommends ${PACKAGES}
#
#end

sudo -E -H apt-get clean
[ -f /etc/udev/rules.d/70-persistent-net.rule ] && sudo rm -f /etc/udev/rules.d/70-persistent-net.rule || true
