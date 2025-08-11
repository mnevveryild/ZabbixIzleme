#!/bin/bash
# Zabbix Agent otomatik kurulum scripti

if [ "$EUID" -ne 0 ]
  then echo "Lütfen root yetkisi ile çalıştırın."
  exit
fi

echo "Zabbix Agent kurulumu başlatılıyor..."
apt update
apt install -y zabbix-agent

read -p "Zabbix Server IP adresini girin: " SERVER_IP
read -p "Bu sunucunun hostname bilgisini girin: " HOSTNAME

sed -i "s/^Server=.*/Server=$SERVER_IP/" /etc/zabbix/zabbix_agentd.conf
sed -i "s/^Hostname=.*/Hostname=$HOSTNAME/" /etc/zabbix/zabbix_agentd.conf

systemctl enable zabbix-agent
systemctl restart zabbix-agent

echo "Zabbix Agent kurulumu tamamlandı."
