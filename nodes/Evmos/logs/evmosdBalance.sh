#!/bin/bash

#!/bin/bash

echo "01) evmos1dkhzfyg9d7gpf0sut5mwn3wspzg6pmxmsk7d67"
amount=$(evmosd q bank balances evmos1dkhzfyg9d7gpf0sut5mwn3wspzg6pmxmsk7d67 | grep amount | grep -Eo '[0-9]{1,40}')
echo "scale=4;$amount/1000000000000000000" | bc

echo "02) evmos1v7pjxfeturnx93xxz892a222u39mzqsezvd7es"
amount=$(evmosd q bank balances evmos1v7pjxfeturnx93xxz892a222u39mzqsezvd7es | grep amount | grep -Eo '[0-9]{1,40}')
echo "scale=4;$amount/1000000000000000000" | bc

echo "03) evmos10ytstyahdykzm5j6m7uq68hyupgzudtja7nkeq"
amount=$(evmosd q bank balances evmos10ytstyahdykzm5j6m7uq68hyupgzudtja7nkeq | grep amount | grep -Eo '[0-9]{1,40}')
echo "scale=4;$amount/1000000000000000000" | bc

echo "04) evmos180kuuxetjw005gphlslde6kclcu8jtj5utyv6d"
amount=$(evmosd q bank balances evmos180kuuxetjw005gphlslde6kclcu8jtj5utyv6d | grep amount | grep -Eo '[0-9]{1,40}')
echo "scale=4;$amount/1000000000000000000" | bc

echo "05) evmos12xkhc9qr4wzdwh202pmnwwwp3a66hgrand2sha"
amount=$(evmosd q bank balances evmos12xkhc9qr4wzdwh202pmnwwwp3a66hgrand2sha | grep amount | grep -Eo '[0-9]{1,40}')
echo "scale=4;$amount/1000000000000000000" | bc

echo "06) evmos1hxw292mjzpw9tpv6wa9396ejhx49w6y92lh75m"
amount=$(evmosd q bank balances evmos1hxw292mjzpw9tpv6wa9396ejhx49w6y92lh75m | grep amount | grep -Eo '[0-9]{1,40}')
echo "scale=4;$amount/1000000000000000000" | bc

echo "07) evmos1uy8fhfdvn4k0m0u2tdx85yhs0x5lvqqysnqu9a"
amount=$(evmosd q bank balances evmos1uy8fhfdvn4k0m0u2tdx85yhs0x5lvqqysnqu9a | grep amount | grep -Eo '[0-9]{1,40}')
echo "scale=4;$amount/1000000000000000000" | bc

echo "08) evmos1zwwrhe74edhwm7fkllzl02alv66yfl4dg5yysm"
amount=$(evmosd q bank balances evmos1zwwrhe74edhwm7fkllzl02alv66yfl4dg5yysm | grep amount | grep -Eo '[0-9]{1,40}')
echo "scale=4;$amount/1000000000000000000" | bc

echo "09) evmos16vav8xgql5q624xpl302s9ky2ew4tut3a4j8jp"
amount=$(evmosd q bank balances evmos16vav8xgql5q624xpl302s9ky2ew4tut3a4j8jp | grep amount | grep -Eo '[0-9]{1,40}')
echo "scale=4;$amount/1000000000000000000" | bc

echo "10) evmos1cd2j7xe9r634xw3azv29cl80tpncsm2tpeqlwj"
amount=$(evmosd q bank balances evmos1cd2j7xe9r634xw3azv29cl80tpncsm2tpeqlwj | grep amount | grep -Eo '[0-9]{1,40}')
echo "scale=4;$amount/1000000000000000000" | bc


echo "========================"

