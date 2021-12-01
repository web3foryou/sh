#!/bin/bash

cd /home/

wget https://github.com/gauss-project/aurorafs/releases/download/v1.1.7/aurora-linux-amd64.tar.gz
tar xvzf aurora-linux-amd64.tar.gz
chmod +x ./aurora
./aurora printconfig &> ./aurora.yaml
cd aurora
bash start.sh --config ./aurora.yaml

curl http://localhost:1635/health

62.171.136.13:1633/aurora/93e9a8c48461f9984a855b1a4e0ecde937c495ffb7975829375d7a28de88ee8b

62.171.136.13:1633/aurora/612243459d85e4921c44927581e10fae2add178fe01677bc9f56bc0461291033

62.171.136.13:1633/aurora/274e4958f0f70ee73dd39d12852ea63f0be895a07a9ff112ecb71d5c5054967c

62.171.136.13:1633/aurora/83acc9482b08bc9385ef323e16e7ba3c3ef8367fc54ea098e9dc31bcf4063dc5

62.171.136.13:1633/aurora/f77d0ca320dbd1e102c16bc7500c75ef8e2d4b52e7934aedf9e2ff39bd812b36
#=========================
git clone https://github.com/gauss-project/aurorafs.git

cd aurorafs/

chmod +x install.sh

bash install.sh

aurora start

#вводим пассворд
curl http://localhost:1635/health
curl 62.171.136.13:1635/health