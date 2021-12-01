#!/bin/bash

kira >> /var/log/node/kira.log
docker logs validator -fn 100 >> /var/log/node/kira_log.log