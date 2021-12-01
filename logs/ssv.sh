#!/bin/bash

docker logs ssv_node --follow --tail=50 >> /var/log/node/ssv.log