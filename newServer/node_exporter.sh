#!/bin/bash
cd /tmp
wget https://github.com/prometheus/node_exporter/releases/download/v1.3.0/node_exporter-1.3.0.linux-amd64.tar.gz
tar xvf node_exporter-1.3.0.linux-amd64.tar.gz
cd node_exporter-1.3.0.linux-amd64/
cp node_exporter /usr/local/bin

printf "[Unit]
Description=Prometheus Node Exporter
After=network.target

[Service]
Type=simple
Restart=always
User=prometheus
Group=prometheus
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target" > /etc/systemd/system/node_exporter.service

groupadd --system prometheus
useradd --system -g prometheus -s /bin/false prometheus

chown -R prometheus:prometheus /usr/local/bin/node_exporter

systemctl daemon-reload
systemctl start node_exporter.service
systemctl enable node_exporter.service
#systemctl status node_exporter.service
#systemctl restart node_exporter.service
#journalctl -fn 100 -u node_exporter.service

sudo iptables -I INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 9100 -j ACCEPT
sudo iptables -I INPUT -p tcp --dport 16349 -j ACCEPT
sudo apt-get -y install iptables-persistent
sudo netfilter-persistent save

# проверить открытые порты
sudo apt install net-tools
netstat -ntlp | grep LISTEN
