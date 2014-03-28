#!py

# python reactor

import yaml 
import sys

# add the bootserver path
sys.path.append('/opt/bootserver')

from model import *

def run():
    answer = {}
    print data,tag
    if data['act'] == 'pend':
        answer['take_key'] = {'wheel.key.accept' :  [{'match': data['id']}]}
	print answer
#        s = Session.query.all()
#        print s
    return answer 
