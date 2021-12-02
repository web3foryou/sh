#!/bin/bash

cd ~/pontem-bootstrap && docker-compose logs -f --tail 10 >> /var/log/node/pontem.log