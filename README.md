# Elastic Stack via Saltstack


---

## add users
    
    # admin user
    /usr/share/elasticsearch/bin/elasticsearch-users useradd qbadmin -p PASSWORD -r superuser

    # service account
    /usr/share/elasticsearch/bin/elasticsearch-users useradd qbmetrics -p PASSWORD -r kibana_user,beats_system,monitoring_user,kibana_system,ingest_admin,apm_system,logstash_system,watcher_user,
    
    # to change user pw
    /usr/share/elasticsearch/bin/elasticsearch-users passwd qbadmin

# BEATS
filebeat setup --dashboards
metricbeat setup --dashboards
auditbeat setup --dashboards

# Backup data
/home/elastic/data

## enable Users & Security
generate certs
    
    root@elk /e/elasticsearch# /usr/share/elasticsearch/bin/elasticsearch-certutil cert

generate passwords (save them)
    
    root@elk /e/elasticsearch# /usr/share/elasticsearch/bin/elasticsearch-setup-passwords auto --allow-root

vi /etc/elasticsearch/elasticsearch.yml
add

    xpack.security.enabled: true
    discovery.type: single-node
    
    # restart elasticsearch & kibana service
    
login to kibana using 'elasticsearch' user + pw

## reclaim disk space
go to Kibana > Settings > Index Management, select Index name > Manage > Flush Index

## start / stop

    systemctl restart elasticsearch
    systemctl restart metricbeat
    
### Dashboards & Visualizations
all dashboards are saved in files/export.ndjson