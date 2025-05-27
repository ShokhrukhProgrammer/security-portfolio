Инструкция по запуску:

1. Установить Docker и docker-compose
2. В директории wazuh-elk-setup выполнить:
docker-compose up -d
3. Перейти на http://localhost:5601 для Kibana
4. snort-config/snort.conf

include $RULE_PATH/local.rules
output alert_fast: stdout
5. snort-config/local.rules

alert tcp any any -> any 22 (msg:"Possible SSH Brute Force"; flags:S; threshold:type threshold, track by_src, count 5, seconds 60; sid:1000001;)
alert icmp any any -> any any (msg:"ICMP Ping Detected"; sid:1000002;)

6. snort-config/alert-log-sample.txt

[] [1:1000001:0] Possible SSH Brute Force []
[Priority: 2]
05/25-17:45:12.789456 192.168.1.10 -> 192.168.1.5

7. attack-simulation/portscan-nmap.pcap
(заглушка под pcap-файл, можно использовать с Wireshark или snort)
8. attack-simulation/bruteforce-ssh.log

May 25 12:45:01 server sshd[4352]: Failed password for invalid user test from 192.168.1.44 port 44512 ssh2
