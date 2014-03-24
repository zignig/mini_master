# install the boot server application

restart_apache:
  module.wait:
    - name: cmd.run
    - cmd: service apache2 restart

flask:
  pip:
    - installed 

flask-login:
  pip:
    - installed 

http://bl3dr.com/git/bootserver.git:
  git.latest:
    - rev: HEAD
    - target: /opt/bootserver
    - watch_in:
      - module: restart_apache
