#!/bin/bash
zeitgeist_log >> /var/log/node/zeitgeist_log.log
zeitgeist_log


sudo journalctl -fn 100 -u zeitgeistd >> /var/log/node/zeitgeist.log


docker logs streamr_node -fn 100 >> /var/log/node/streamr.log

journalctl -u assetd -f >> /var/log/node/assetMantle.log


sudo journalctl -fn 100 -u joystream-node >> /var/log/node/joystream.log

kira >> /var/log/node/kira.log
docker logs validator -fn 100 >> /var/log/node/kira_log.log

docker logs ssv_node --follow --tail=50 >> /var/log/node/ssv.log

journalctl -u fluxd -f

journalctl -u fluxd -f >> /var/log/node/fluxd.log

journalctl -u anomad -f >> /var/log/node/anomad.log
journalctl -u minima -f >> /var/log/node/minima.log

docker logs kyve-cosmos-node --follow --tail=50

journalctl -fn 100 -u evmosd >> /var/log/node/evmosd_log.log