## Install Redis with docker
```bash
$ docker run --name redis -rm -p 6379:6379 -v data-redis:/data/ redis
```

## Connect and run basic commands
```bash
$ docker exec -it redis bash
$ redis-cli
```
## Examples with strings
```bash
SET name dieguito
GET name // "dieguito"
```

## Examples with hashes
```bash
HMSET billetes mil dieguito
HGET billetes mil
```

## Examples with lists
```bash
LPUSH proceres dieguito
LPUSH proceres messi
LRANGE proceres 0 -1
```

## Examples with sets
```bash
SADD proceresSet dieguito messi 
SMEMBERS proceresSet // 1) dieguito, 2) messi
```

## Examples with sorted sets
```bash
ZADD zet 1 2
ZRANGE zet 0 -1 // 2
```

## Examples with publish and subscribe
```bash
SUBSCRIBE channel

PUBLISH channel hola
(integer) 1

1) "message"
2) "channel1"
3) "hola"
```

## Examples with transactions
```bash
MULTI
OK

ZINCRBY zset 2 1
QUEUED

EXEC
```

## Backups
You can make a backup using the ```SAVE``` command. This will dump the data in /data/dump.rdb

## Benchmark Example
```bash
$ redis-benchmark -t lpush -n 100000 -q
LPUSH: 69735.01 requests per second
```