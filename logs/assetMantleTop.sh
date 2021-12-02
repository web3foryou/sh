#!/bin/bash
source /root/.bash_profile

assetClient q staking validators -o json | jq -r '.[] | [.operator_address, .status, (.tokens|tonumber / pow(10; 6)), .description.moniker] | @csv' | column -t -s"," | sort -k3 -n -r | nl | grep  -e nodeweb34u
 >> /var/log/node/assetMantleTop.log
