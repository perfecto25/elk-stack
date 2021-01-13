include:
    - formula.elastic.repo

metricbeat:
    pkg.installed:
        - version: 7.9.1

metricbeat_config:
    file.managed:
        - name: /etc/metricbeat/metricbeat.yml
        - source: salt://{{ slspath }}/files/metricbeat.yml
        - user: root
        - group: root
        - mode: '0600'

metricbeat_start_service:
    service.running:
        - name: metricbeat
        - enable: True
        - watch:
            - file: metricbeat_config