# ElastAlert

https://github.com/Yelp/elastalert

pipenv --python 3.6 install

pipenv install elastalert

Requires AUDITBEAT!!

## create index

    root@elk:elastalert $ elastalert-create-index
    Enter Elasticsearch host: 192.168.40.24
    Enter Elasticsearch port: 9200
    Use SSL? t/f: f
    Enter optional basic-auth username (or leave blank): 
    Enter optional basic-auth password (or leave blank): 
    Enter optional Elasticsearch URL prefix (prepends a string to the URL of every request): 
    New index name? (Default elastalert_status) 
    New alias name? (Default elastalert_alerts) 
    Name of existing index to copy? (Default None) 
    Elastic Version: 7.5.0
    Reading Elastic 6 index mappings:
    Reading index mapping 'es_mappings/6/silence.json'
    Reading index mapping 'es_mappings/6/elastalert_status.json'
    Reading index mapping 'es_mappings/6/elastalert.json'
    Reading index mapping 'es_mappings/6/past_elastalert.json'
    Reading index mapping 'es_mappings/6/elastalert_error.json'
    New index elastalert_status created
    Done!

## test alert

    elastalert-test-rule --config elastalert.yaml rules/ssh.yaml

## install Kibana plugin
    root@elk # /usr/share/kibana/bin/kibana-plugin install https://github.com/bitsensor/elastalert-kibana-plugin/releases/download/1.1.0/elastalert-kibana-plugin-1.1.0-7.5.0.zip --allow-root
    Attempting to transfer from https://github.com/bitsensor/elastalert-kibana-plugin/releases/download/1.1.0/elastalert-kibana-plugin-1.1.0-7.5.0.zip
    Transferring 25617568 bytes....................
    Transfer complete
    Retrieving metadata from plugin archive
    Extracting plugin archive
    Extraction complete
    Plugin installation complete

## Restart
systemctl restart elastalert