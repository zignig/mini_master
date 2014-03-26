# -*- coding: utf-8 -*-

sqlurl = 'sqlite:////tmp/test.db'
salt_master = '{{ salt['network.ip_addrs']()[0] }}'
has_proxy = True
proxy = "http://{{ salt['network.ip_addrs']()[0] }}:3142"
salt_repo = "http://bl3dr.com/git/mini_master.git"
