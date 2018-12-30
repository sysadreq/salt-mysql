# import the mysql set from /srv/salt/mysql/map.jinja file

{% from 'mysql/map.jinja' import mysql with context %}

{% if grains['os_family'] == 'Debian' %}

mysql_debconf_install:
  pkg.installed:
    - name: debconf

mysql_debconf_settings:
  debconf.set:
    - name: mysql-server
    - data:
#        'mysql-server/root_password': {'type': 'password', 'value': 'XXXXXXX'}
#        'mysql-server/root_password_again' : {'type': 'password', 'value': 'XXXXXXXX'}
         'mysql-server/root_password' : { 'type': 'password','value':'{{ pillar['mysql']['root']['password'] }}'}
         'mysql-server/root_password_again' : { 'type' : 'password','value':'{{ pillar['mysql']['root']['password'] }}'}

    - require:
      - pkg: debconf
    - require_in:
      - mysql_server_install

{% endif %}

mysql_server_install:
  pkg.installed:
# call the "server" variable from mysql set /srv/salt/mysql/map.jinja file
    - name: {{ mysql.server }}


# Old server.sls
#mysql_server_install:
#  pkg.installed:
#    - name: mariadb-server
