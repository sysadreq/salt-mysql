{% from 'mysql/map.jinja' import mysql with context %}


mysql_client_install:
  pkg.installed:
    - name: {{ mysql.client }}

{# 'client' is a variable imported from mysql module#}
