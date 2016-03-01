#!/bin/bash
set -e

export DEBIAN_FRONTEND=noninteractive
unset PACKAGES

#begin
#your awesome provisioning here
#PACKAGES=""
#sudo -E apt-get clean
#sudo -E -H apt-get update
#sudo -E -H apt-get install -y -q --no-install-recommends ${PACKAGES}
#
#end

sed -i '/tty/!s/mesg n/tty -s \&\& mesg n/' /home/vagrant/.profile
sudo sed -i '/tty/!s/mesg n/tty -s \&\& mesg n/' /root/.profile

sudo -E -H apt-get clean
[ -f /etc/udev/rules.d/70-persistent-net.rule ] && sudo rm -f /etc/udev/rules.d/70-persistent-net.rule || true
