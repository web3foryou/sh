#!/bin/bash
# тайминги: https://crontab.guru/examples.html
# добавление в крон
crontab -e

* * * * * bash /var/log/node/massa.sh - каждую минуту
0 * * * * bash /var/log/node/massa.sh - каждый час
0 * * * * bash /var/log/node/evmosdRank.sh - каждый час

0/10 * * * * bash /var/log/node/evmosdBalance.sh | tac >> /var/log/node/evmosdBalance.log
*/30 * * * * bash /var/log/node/auto_stake.sh | tac >> /var/log/node/auto_stake.log
* * * * * bash /var/log/node/assetMantleTop.sh
