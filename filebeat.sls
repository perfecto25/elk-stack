include:
    - formula.elastic.repo

filebeat:
    pkg.installed:
        - version: 7.9.1

filebeat_config:
    file.managed:
        - name: /etc/filebeat/filebeat.yml
        - source: salt://{{ slspath }}/files/filebeat.yml.j2
        - template: jinja
        - user: root
        - group: root
        - mode: '0600'

filebeat_start_service:
    service.running:
        - name: filebeat
        - enable: True
        - watch:
            - file: filebeat_config