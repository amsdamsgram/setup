#!/bin/zsh

# use dnsmasq, then Open DNS
# echo_title "Setup DNS with DNSMasq & Open DNS"
# changedns 127.0.0.1 208.67.222.222 208.67.220.220
# if [ ! -e "/usr/local/etc/dnsmasq.conf" ]
# then
#   brewinstall dnsmasq
#   DNSMASQ_CONF=/usr/local/etc/dnsmasq.conf
#   cp /usr/local/opt/dnsmasq/dnsmasq.conf.example $DNSMASQ_CONF
#   echo "\n\naddress=/dev/127.0.0.1\nlisten-address=127.0.0.1" | sudo tee -A $DNSMASQ_CONF
#   sudo brew services start dnsmasq
#   # sudo cp -fv /usr/local/opt/dnsmasq/*.plist /Library/LaunchDaemons
#   # sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.dnsmasq.plist
# fi
