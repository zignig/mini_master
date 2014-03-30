# -*- coding: utf-8 -*-

sqlurl = 'sqlite:////tmp/test.db'
salt_master = '{{ salt['network.ip_addrs']()[0] }}'
has_proxy = True
proxy = "http://{{ salt['network.ip_addrs']()[0] }}:3142"
salt_repo = "https://github.com/zignig/exarch.git"
menu = '/opt/bootserver/menu.yaml'
password = None
