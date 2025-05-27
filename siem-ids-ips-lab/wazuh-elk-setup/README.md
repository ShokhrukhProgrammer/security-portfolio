Инструкция по запуску:

1. Установить Docker и docker-compose
2. В директории wazuh-elk-setup выполнить:
docker-compose up -d
3. Перейти на http://localhost:5601 для Kibana
4. snort-config/snort.conf

include $RULE_PATH/local.rules
output alert_fast: stdout
5. snort-config/local.rules
