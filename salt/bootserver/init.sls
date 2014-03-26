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

flask-wtf:
  pip:
    - installed 

flask-sqlalchemy:
  pip:
    - installed 

# get ipxe source 
git://github.com/ipxe/ipxe.git:
  git.latest:
    - rev: HEAD
    - target: /opt/ipxe

http://bl3dr.com/git/bootserver.git:
  git.latest:
    - rev: HEAD
    - target: /opt/bootserver
    - watch_in:
      - module: restart_apache

# install the bootserver
apache2:
  pkg:
    - installed

libapache2-mod-wsgi:
  pkg:
    - installed

# generate the apache config
/etc/apache2/sites-available/web_apps.conf:
  file.managed:
    - template: jinja
    - source: salt://bootserver/files/apache_flask.conf
    - require:
      - pkg: apache2
    - watch_in:
      - module: restart_apache

web_apps:
  module.run:
    - name: apache.a2ensite
    - site: web_apps.conf

disable_default:
  module.run:
    - name: apache.a2dissite
    - site: 000-default
