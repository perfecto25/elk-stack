
{% set beats = ['metricbeat', 'auditbeat', 'filebeat', 'heartbeat'] %}

{% for beat in beats %}
stop_{{ beat }}:
    service.dead:
        - name: {{ beat }}
        
uninstall_{{ beat }}:
    pkg.removed:
        - name: {{ beat }}
           
remove_{{ beat }}_dir:
    file.absent:
        - name: /etc/{{ beat }}
{% endfor %}
