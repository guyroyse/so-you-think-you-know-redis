echo Flushing...
redis-cli FLUSHALL
echo ""

echo Setting maxmemory...
redis-cli CONFIG SET maxmemory 1200500
#redis-cli CONFIG SET maxmemory 1200500
echo ""

echo Setting maxmemory-policy...
redis-cli CONFIG SET maxmemory-policy noeviction
# redis-cli CONFIG SET maxmemory-policy allkeys-lru
# redis-cli CONFIG SET maxmemory-policy allkeys-random
echo ""

counter=0
uuid=""
key=""

while true
do
  ((counter++))
  key="key:${counter}"
  uuid=`uuidgen`
  echo "> SET ${key} ${uuid}"
  redis-cli SET ${key} ${uuid}
  echo "> KEYS *"
  redis-cli keys "*"
  echo ""
  sleep 1
done
