# Elastic Repo

elastic_repo:
    file.managed:
        - name: /etc/yum.repos.d/elastic.repo
        - source: salt://{{ slspath }}/files/elastic.repo
        - user: root
        - group: root
        - mode: 644