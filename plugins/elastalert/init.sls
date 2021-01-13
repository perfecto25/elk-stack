alert_systemd:
    file.managed:
        - name: /usr/lib/systemd/system/elastalert.service
        - source: salt://{{ slspath }}/files/elastalert.service
        - user: root
        - group: root
        - mode: 664

elastalert_dir:
    file.recurse:
        - name: /etc/elasticsearch/elastalert
        - source: salt://{{ slspath }}/files
        - makedirs: True
        - user: root
        - group: elasticsearch
        - dir_mode: 0755   

alert_service:
    service.running:
        - name: elastalert
        - watch: 
            - file: elastalert_dir
