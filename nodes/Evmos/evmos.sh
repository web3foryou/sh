#!/bin/bash

. <(wget -qO- https://raw.githubusercontent.com/SecorD0/Evmos/main/multi_tool.sh)

. <(wget -qO- https://raw.githubusercontent.com/SecorD0/utils/main/installers/golang.sh)

go install github.com/cosmos/cosmos-sdk/cosmovisor/cmd/cosmovisor@latest; \
mv `which cosmovisor` /usr/bin

mkdir -p $HOME/.evmosd/cosmovisor/genesis/bin $HOME/.evmosd/cosmovisor/upgrades; \
cp `which evmosd` $HOME/.evmosd/cosmovisor/genesis/bin

. <(wget -qO- https://raw.githubusercontent.com/SecorD0/utils/main/miscellaneous/insert_variable.sh) -n evmos_moniker

evmosd config chain-id evmos_9000-2
evmosd config keyring-backend file

rm -rf $HOME/.evmosd/config/app.toml $HOME/.evmosd/config/config.toml

evmosd unsafe-reset-all

. <(wget -qO- https://raw.githubusercontent.com/SecorD0/utils/main/miscellaneous/insert_variable.sh) -n evmos_wallet_name

evmosd init "$evmos_moniker" --chain-id evmos_9000-2

#СОХРАНИТЬ КОНФИГИ!!!

evmosd keys add "$evmos_wallet_name" --keyring-backend file

wget -qO $HOME/.evmosd/config/genesis.json https://raw.githubusercontent.com/tharsis/testnets/main/olympus_mons/genesis.json

sed -i -e "s%^moniker *=.*%moniker = \"$evmos_moniker\"%; "\
"s%^seeds *=.*%seeds = \"`wget -qO - https://raw.githubusercontent.com/tharsis/testnets/main/olympus_mons/seeds.txt | tr '\n' ',' | sed 's%,$%%'`\"%; "\
"s%^persistent_peers *=.*%persistent_peers = \"847e72f31e1f87e8059231b4b9e3302989c22d3a@5.189.156.65:26656,`wget -qO - https://raw.githubusercontent.com/SecorD0/Evmos/main/peers.txt | tr '\n' ',' | sed 's%,$%%'`\"%; " $HOME/.evmosd/config/config.toml

sudo tee <<EOF >/dev/null /etc/systemd/system/evmosd.service
[Unit]
Description=Evmos node
After=network.target

[Service]
User=$USER
Environment="DAEMON_NAME=evmosd"
Environment="DAEMON_HOME=$HOME/.evmosd"
Environment="DAEMON_ALLOW_DOWNLOAD_BINARIES=false"
Environment="DAEMON_RESTART_AFTER_UPGRADE=true"
ExecStart=`which cosmovisor` start
Restart=on-failure
RestartSec=3
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl enable evmosd
sudo systemctl restart evmosd

. <(wget -qO- https://raw.githubusercontent.com/SecorD0/utils/main/miscellaneous/insert_variable.sh) -n evmos_log -v "sudo journalctl -fn 100 -u evmosd" -a

. <(wget -qO- https://raw.githubusercontent.com/SecorD0/utils/main/miscellaneous/insert_variable.sh) -n evmos_node_info -v ". <(wget -qO- https://raw.githubusercontent.com/SecorD0/Evmos/main/node_info.sh) -l RU 2> /dev/null" -a

#ПОЛЕЗНЫЕ КОМАНДЫ:

evmos_log

evmos_node_info


# активные валидаторы
evmosd query staking validators --limit 10000 -o json | jq -r '.validators[] | select(.status=="BOND_STATUS_BONDED") | [.operator_address, .status, (.tokens|tonumber / pow(10; 6)), .description.moniker] | @csv' | column -t -s"," | sort -k3 -n -r | nl

# данные кошелька - валопер адрес
evmosd keys show $evmos_wallet_name --bech val

# не работает - получение ревардов
evmosd tx distribution withdraw-all-rewards --from $evmos_wallet_name --chain-id evmos_9000-2

# выход из тюрьмы
evmosd tx slashing unjail --chain-id $EVMOS_CHAIN --from $EVMOS_WALLET



#АКТУАЛЬНЫЕ ПОЛЕЗНЫЕ КОМАНДЫ:
https://github.com/pirimpompito/evmos-commands

# получить данные по транзакции по хэшу:
evmosd query tx 786AAD22C95E82A6DCE7ACF043A66C6B3F88EB3E661AE73AFFAFDEACB43018C0

evmosd query staking validator evmosvaloper1x8ja0jf5f7cf9jq65w79wzty9gzyvwadekr934



. <(wget -qO- https://raw.githubusercontent.com/SecorD0/utils/main/miscellaneous/insert_variable.sh) -n evmos_node_info -v ". <(wget -qO- https://raw.githubusercontent.com/SecorD0/Evmos/main/node_info.sh) -l RU 2> /dev/null" -a


amount=$(evmosd q bank total evmos16vav8xgql5q624xpl302s9ky2ew4tut3a4j8jp | grep amount | grep -Eo '[0-9]{1,40}') \
echo "scale=4;$amount/1000000000000000000" | bc


## Удаление старых данных:
ГЕНЕЗИС НАДО ЕЩЕ УДАЛЯТЬ!!!
Поностью папку конфига сносить
.bash_profile - почистить от лишнего
evmosd init "$evmos_moniker" --chain-id evmos_9000-2

evmosd tx distribution withdraw-all-rewards --from $evmos_wallet_name --chain-id evmos_9000-2

evmosd q bank balances evmos1dkhzfyg9d7gpf0sut5mwn3wspzg6pmxmsk7d67 | grep amount | grep -Eo '[0-9]{1,40}' | "scale=4;$amount/1000000000000000000" | bc
echo
6503392690550811
10000000000000000
#пробуем запбрать с валидатора
evmosd tx staking delegate evmosvaloper1dkhzfyg9d7gpf0sut5mwn3wspzg6pmxmac3amr 400000000888777444aphoton --chain-id=evmos_9000-2 --gas=200000   --gas-prices="0.025aphoton"   --from=$evmos_wallet_name

0.4 + 1.4 +

04+ 1.3

# Не анбондится
evmosd tx staking unbond evmosvaloper10ytstyahdykzm5j6m7uq68hyupgzudtjssuxca 400000000888777444aphoton --chain-id=evmos_9000-2 --gas=200000   --gas-prices="0.025aphoton"   --from=$evmos_wallet_name
evmosd query tx 3E00AA61E62B8C5A516CCFDE2B6F8676632C44459137814795498D1AAE19796B

evmosd tx delegate