sudo iptables -I INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 9090 -j ACCEPT
sudo apt-get -y install iptables-persistent
sudo netfilter-persistent save

# проверить открытые порты
sudo apt install net-tools
netstat -ntlp | grep LISTEN