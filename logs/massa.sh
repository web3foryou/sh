#!/bin/bash
echo "===============" >> /var/log/node/massa.log
cd /root/massa/massa-client/
./massa-client wallet_info | tac | grep -e ro -e ba >> /var/log/node/massa.log
echo "===============" >> /var/log/node/massa.log

# это запускается в кроне