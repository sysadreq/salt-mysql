#v2: Modify to change to variables, mapping to map.jinja

{% from 'mysql/map.jinja' import mysql with context %}

include:
  - mysql.restart

mysql_server_config:
  file.managed:
    - name: {{ mysql.server_conf }}
    - source: {{ mysql.server_conf_source }}
    - require:
      - pkg: {{ mysql.server }}



#mysql_server_config:
#  file.managed:
#    - name: /etc/my.cnf.d/server.cnf
#    - source: salt://mysql/files/server.cnf
#    - require:
#        - pkg: mariadb-server
