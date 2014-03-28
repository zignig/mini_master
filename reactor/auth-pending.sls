#!py

# python reactor

import yaml 
import sys
import redis 

r = redis.Redis()

def run():
    answer = {}
    print data,tag
    if data['act'] == 'pend':
	if r.sismember('machines',data['id']):
		answer['take_key'] = {'wheel.key.accept' :  [{'match': data['id']}]}
		r.srem('machines',data['id'])
    return answer 
