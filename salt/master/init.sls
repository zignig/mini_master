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

/etc/issue:
  file.managed:
    - template: jinja
    - source: salt://master/files/issue

/etc/salt/master.d/reactor.conf:
  file.managed:
    - source: salt://master/files/reactor.conf
