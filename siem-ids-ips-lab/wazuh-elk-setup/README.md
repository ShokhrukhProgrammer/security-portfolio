Инструкция по запуску:

Установить Docker и docker-compose

В директории wazuh-elk-setup выполнить:
docker-compose up -d

Перейти на http://localhost:5601 для Kibana

snort-config/snort.conf

include $RULE_PATH/local.rules
output alert_fast: stdout
