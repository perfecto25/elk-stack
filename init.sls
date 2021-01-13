include:
    - formula.elastic.repo
    - formula.elastic.plugins.elastalert
    
vm.max_map_count:
    sysctl.present:
        - value: 262144

java-11-openjdk-devel:
    pkg.installed

#### ELASTICSEARCH  ###############
elasticsearch_pkg:
    pkg.installed:
        - name: elasticsearch

elasticsearch_conf:
    file.managed:
        - name: /etc/elasticsearch/elasticsearch.yml
        - source: salt://{{ slspath }}/files/elasticsearch.yml
        - user: root
        - group: elasticsearch
        - mode: 660

elasticsearch_svc:
    file.managed:
        - name: /usr/lib/systemd/system/elasticsearch.service
        - source: salt://{{ slspath }}/files/elasticsearch.service
        - user: root
        - group: root
        - mode: 664

elasticsearch_sysconfig:
    file.managed:
        - name: /etc/sysconfig/elasticsearch
        - source: salt://{{ slspath }}/files/sysconfig
        - user: root
        - group: elasticsearch
        - mode: 660


jvm_options:
    file.managed:
        - name: /etc/elasticsearch/jvm.options
        - source: salt://{{ slspath }}/files/jvm.options
        - user: root
        - group: elasticsearch
        - mode: 660

elasticsearch_service:
    service.running:
        - name: elasticsearch
        - enable: True
        - watch: 
            - file: /etc/elasticsearch/jvm.options
            - file: /etc/elasticsearch/elasticsearch.yml

limits_file:
    file.managed:
        - name: /etc/systemd/system/elasticsearch.service.d/elasticsearch.conf
        - user: root
        - group: root
        - mode: 644
        - makedirs: True

######## KIBANA ###########
kibana_pkg:
    pkg.installed:
        - name: kibana

kibana_conf:
    file.managed:
        - name: /etc/kibana/kibana.yml
        - source: salt://{{ slspath }}/files/kibana.yml
        - user: root
        - group: elasticsearch
        - mode: 664

# kill any zombie kibana procs
kill_kibana:
    cmd.wait:
        - name: pkill -f kibana
        - watch: 
            - file: kibana_conf

# start service
kibana_service:
    service.running:
        - name: kibana
        - enable: True
        - watch: 
            - file: /etc/kibana/kibana.yml

###### LOGSTASH ############
logstash_pkg:
    pkg.installed:
        - name: logstash

logstash_conf:
    file.managed:
        - name: /etc/logstash/logstash.yml
        - source: salt://{{ slspath }}/files/logstash.yml
        - user: root
        - group: root
        - mode: 644


    