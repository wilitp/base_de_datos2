import redis

PORT = 6379
HOST = 'localhost'

r = redis.Redis(host=HOST, port=PORT, db=0)


print(r.ping())
r.set('name', 'dieguito')
print(r.get('name'))

r.lpush("proceres", "dieguito")
print(r.lrange("alumno",0,-1))

r.sadd('series', 'The Crown')
r.sadd('series', 'The Crown')
print(r.smembers('series'))

p = r.pubsub()
p.subscribe('channel')
r.publish('channel', 'hola')
print(p.get_message())