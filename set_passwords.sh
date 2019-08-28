#!/bin/bash
./credentials.txt

sed -i "s/elasticsearch.username: elastic/elasticsearch.username: kibana/g" ./kibana/config/kibana.yml
sed -i "s/elasticsearch.password: changeme/elasticsearch.password: ${KIBANA_PASSWORD}/g" ./kibana/config/kibana.yml

sed -i "s/xpack.monitoring.elasticsearch.username: elastic/xpack.monitoring.elasticsearch.username: logstash_system/g" ./logstash/config/logstash.yml
sed -i "s/xpack.monitoring.elasticsearch.password: changeme/xpack.monitoring.elasticsearch.password: ${LOGSTASH_SYSTEM_PASSWORD}/g" ./logstash/config/logstash.yml

echo "Passwords changed successfully. Now run 'docker-compose restart kibana logstash'."
