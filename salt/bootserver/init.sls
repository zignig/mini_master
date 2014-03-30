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

redis:
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

bootcd:
  pkg:
    - installed 

# generate the template file for ipxe include
/opt/ipxe/src/server.ipxe:
  file.managed:
    - template: jinja
    - source: salt://bootserver/files/server.ipxe
    - watch_in:
      - module: build_ipxe

build_ipxe:
  module.wait:
    - name: cmd.run
    - cmd: 'cd /opt/ipxe/src ; make bin/ipxe.iso EMBED=server.ipxe ; cp /opt/ipxe/src/bin/ipxe.iso /opt/bootserver/static/images/boot.iso'
      
# install the bootserver
https://github.com/zignig/exarch.git:
  git.latest:
    - rev: HEAD
    - target: /opt/bootserver
    - watch_in:
      - module: restart_apache

# template the config file
/opt/bootserver/config.py:
  file.managed:
    - template: jinja
    - source: salt://bootserver/files/config.py
    - watch_in:
      - module restart_apache

apt-cacher-ng:
  pkg:
    - installed
apache2:
  pkg:
    - installed

redis-server:
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
