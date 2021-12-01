#!/bin/bash

journalctl -fn 100 -u evmosd >> /var/log/node/evmosd_log.log

evmosd query staking validators --limit 150000 -o json | jq -r '.validators[] | select(.status=="BOND_STATUS_BONDED") | [.operator_address, .status, (.tokens|tonumber / pow(10; 18)), .description.moniker] | @csv' | column -t -s"," | sort -k3 -n -r | nl | grep  -e valweb34u -e vsh88andrey -e workerValidator >> /var/log/node/evmosd_position.log
