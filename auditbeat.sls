include:
    - formula.elastic.repo

auditbeat:
    pkg.installed:
        - version: 7.9.1

auditbeat_config:
    file.managed:
        - name: /etc/auditbeat/auditbeat.yml
        - source: salt://{{ slspath }}/files/auditbeat.yml
        - user: root
        - group: root
        - mode: '0600'

auditbeat_start_service:
    service.running:
        - name: auditbeat
        - enable: True
        - watch:
            - file: auditbeat_config