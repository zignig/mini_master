# master setup

# auto update cron job
/usr/local/bin/master_jobs.sh:
  file.managed:
    - template: jinja
    - source: salt://master/files/master_jobs.sh
    - mode: 744
  cron.present:
    - user: root
    - minute: random
    - hour: 0,6,12,18

# install the bootserver
apache2:
  pkg:
    - installed 

apt-cacher-ng:
  pkg:
    - installed

