## Смена данных валидатора
evmosd tx staking edit-validator \
  --broadcast-mode=block \
  --moniker="valweb34u" \
  --chain-id=evmos_9000-2 \
  --gas="200000" \
  --gas-prices="0.025aphoton" \
  --from=$evmos_wallet_name


# ПОДНИМАЕМ ВАЛИДАТОРА:============================
# создание валидатора
photon = 1000 000 000 000 000 000
photon = 1000000000000000000
photon = 990000000000000000

evmosd tx staking create-validator \
  --broadcast-mode=block \
  --amount=1000000000000000aphoton \
  --pubkey=$(evmosd tendermint show-validator) \
  --moniker="defendValidator" \
  --chain-id=evmos_9000-2 \
  --commission-rate="0.10" \
  --commission-max-rate="0.30" \
  --commission-max-change-rate="0.01" \
  --min-self-delegation="1000000" \
  --gas="200000" \
  --gas-prices="0.025aphoton" \
  --from=$evmos_wallet_name

moniker - заменить на имя

evmos_log
evmos_node_info

# данные по валидатору
evmosd query staking validator $(evmosd keys show "$evmos_wallet_name" --bech val -a)
1)
evmosd query staking validator evmosvaloper1dkhzfyg9d7gpf0sut5mwn3wspzg6pmxmac3amr
2)
evmosd query staking validator evmosvaloper1v7pjxfeturnx93xxz892a222u39mzqse0zzwcd
3)
evmosd query staking validator evmosvaloper10ytstyahdykzm5j6m7uq68hyupgzudtjssuxca


#ПРОВЕРКА БАЛАНСА
amount=$(evmosd q bank balances evmos16vav8xgql5q624xpl302s9ky2ew4tut3a4j8jp | grep amount | grep -Eo '[0-9]{1,40}') \
echo "scale=4;$amount/1000000000000000000" | bc

# делегирование токенов
1)
evmosd tx staking delegate evmosvaloper1dkhzfyg9d7gpf0sut5mwn3wspzg6pmxmac3amr 1000000099999999999aphoton --chain-id=evmos_9000-2 --gas=200000   --gas-prices="0.025aphoton"   --from=$evmos_wallet_name
2)
evmosd tx staking delegate evmosvaloper1v7pjxfeturnx93xxz892a222u39mzqse0zzwcd 1000000000234444123aphoton --chain-id=evmos_9000-2 --gas=200000   --gas-prices="0.025aphoton"   --from=$evmos_wallet_name
3)
evmosd tx staking delegate evmosvaloper10ytstyahdykzm5j6m7uq68hyupgzudtjssuxca 990000000888777444aphoton --chain-id=evmos_9000-2 --gas=200000   --gas-prices="0.025aphoton"   --from=$evmos_wallet_name

#список валидаторов
evmosd query staking validators --limit 10000 -o json | jq -r '.validators[] | select(.status=="BOND_STATUS_BONDED") | [.operator_address, .status, (.tokens|tonumber / pow(10; 18)), .description.moniker] | @csv' | column -t -s"," | sort -k3 -n -r | nl
evmosd query staking validators -o json --limit 15000 --node "http://5.189.156.65:26657" | jq '.validators[] | select(.status=="BOND_STATUS_BONDED")' | jq -r '.tokens + " - " + .description.moniker' | sort -gr | nl

# только мои валидаторы:
evmosd query staking validators --limit 150000 -o json | jq -r '.validators[] | select(.status=="BOND_STATUS_BONDED") | [.operator_address, .status, (.tokens|tonumber / pow(10; 18)), .description.moniker] | @csv' | column -t -s"," | sort -k3 -n -r | nl | grep  -e valweb34u -e vsh88andrey -e workerValidator
evmosd query staking validators --limit 150000 -o json | jq -r '.validators[] | [.operator_address, .status, (.tokens|tonumber / pow(10; 18)), .description.moniker] | @csv' | column -t -s"," | sort -k3 -n -r | nl | grep  -e valweb34u -e vsh88andrey -e workerValidator
evmosd query staking validators -o json --limit 15000 --node "http://5.189.156.65:26657" | jq '.validators[] | select(.status=="BOND_STATUS_BONDED")' | jq -r '.tokens + " - " + .description.moniker' | sort -gr | nl | grep  -e valweb34u -e vsh88andrey

01:contabo_10:q35trfwetrF45sdf - автостейк
evmosvaloper1dkhzfyg9d7gpf0sut5mwn3wspzg6pmxmac3amr
02:contabo_11:3wrcfFetg3ew45t - автостейк
evmosvaloper1v7pjxfeturnx93xxz892a222u39mzqse0zzwcd
#доноры (0)
03:contabo_02:q3f45rcDawerf234rf
evmosvaloper10ytstyahdykzm5j6m7uq68hyupgzudtjssuxca - ДОНОР 1 - автостейк
#доноры (1)
04:contabo_08:aw4tvrFerger -ДОНОР 1 - автостейк
05:contabo_09:aw345vDfzaewew -ДОНОР 2 - автостейк
06:webtropia_01:43rcfaw4eD4tggf -ДОНОР 1 - автостейк
#доноры (2)
07:contabo_03:acfvac4rF3frvq45t -ДОНОР 1 - автостейк
08:contabo_04:awf4ctFw3r32t -ДОНОР 1 - автостейк
09:contabo_05:w4trcfwF34r3 -ДОНОР 2 - автостейк (тут норм фатонов должно быть всего делегировано)
#КРАШТЕСТЫ!!!
10:contabo_06:wcreFawsevw34f -ДОНОР 1 - автостейк

#ределегация
evmosd tx staking redelegate evmosvaloper10ytstyahdykzm5j6m7uq68hyupgzudtjssuxca evmosvaloper1dkhzfyg9d7gpf0sut5mwn3wspzg6pmxmac3amr 300000000888777444aphoton --chain-id=evmos_9000-2 --gas=300000   --gas-prices="0.025aphoton"   --from=$evmos_wallet_name
