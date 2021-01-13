include:
    - formula.elastic.repo

heartbeat-elastic:
    pkg.installed

config:
    file.managed:
        - name: /etc/heartbeat/heartbeat.yml
        - source: salt://{{ slspath }}/files/heartbeat.yml
        - user: root
        - group: root
        - mode: 600 
 
start_service:
    service.running:
        - name: heartbeat-elastic
        - enable: True
        - watch:
            - file: config