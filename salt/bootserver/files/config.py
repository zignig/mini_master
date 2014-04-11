# -*- coding: utf-8 -*-

sqlurl = 'sqlite:////tmp/test.db'
salt_master = '{{ salt['network.ip_addrs']()[0] }}'
has_proxy = True
proxy = "http://{{ salt['network.ip_addrs']()[0] }}:3142"
salt_repo = "https://github.com/zignig/mini_master.git"
menu = '/opt/bootserver/config/menu.yaml'
images = '/opt/bootserver/config/image_urls.txt'
password = None
