#!/bin/bash

sudo journalctl -fn 100 -u joystream-node >> /var/log/node/joystream.log
