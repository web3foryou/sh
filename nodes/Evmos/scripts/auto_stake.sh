#!/bin/bash
source /root/.bash_profile

pass="wcreFawsevw34f"
validator="evmosvaloper1dkhzfyg9d7gpf0sut5mwn3wspzg6pmxmac3amr"

#echo $pass | evmosd tx distribution withdraw-all-rewards -y --from $evmos_wallet_name --chain-id evmos_9000-2 --gas=300000
echo $pass | evmosd tx distribution withdraw-all-rewards -y --from $evmos_wallet_name --chain-id evmos_9000-2

sleep 30

balance=$(evmosd q bank balances $evmos_wallet_address | grep amount | grep -Eo '[0-9]{1,40}')
let balance2=$balance-10000000
balanceText="${balance2}aphoton";

#echo $balance2
#echo $balanceText

echo "balance:"
echo "scale=4;$balance/1000000000000000000" | bc
if (( balance > 10000000000000000 )); then
  echo $pass | evmosd tx staking delegate $validator $balanceText --chain-id=evmos_9000-2 --gas=200000 -y  --gas-prices="0.025aphoton" --from=$evmos_wallet_name

  echo "make stake"
fi
