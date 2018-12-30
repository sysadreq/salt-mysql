mysql_root_user:
  mysql_user.present: #check if a user is present in mysql
    - name:  {{ pillar['mysql']['root']['name'] }} #extract the value of 'name' from pillar - key-value pair
    - password: {{ pillar['mysql']['root']['password'] }} #extract the value of 'password' from pillar - key-value pair
# old config - before using pillar data config
#    - name: root
#    - password: temppass
    - host: localhost
