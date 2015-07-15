#!/bin/bash -x

# echo "vvvvv"
# ls -l /etc/default/riak
# cat /etc/default/riak
# echo "^^^^^"

# sudo service riak stop
# sleep 10
# sudo service riak start
# sleep 30

echo "Installed:"
riak version

echo "Wanted:"
echo $RIAK_VERSION

echo "Built:"
$HOME/riak/riak-${RIAK_VERSION}/bin/riak version

$HOME/riak/riak-${RIAK_VERSION}/bin/riak start
sleep 30

# riak-admin ring-status
# riak-admin status

# echo -e "\nResults:\n"

curl -XPUT -d 'data1' \
    -H "x-riak-index-field1_bin: val1" \
    'http://127.0.0.1:8098/riak/mybucket/foo%3Abar'

curl -XPUT -d 'data2' \
    -H "x-riak-index-field1_bin: val2" \
    'http://127.0.0.1:8098/riak/mybucket/foo:baz'

curl 'http://127.0.0.1:8098/riak/mybucket/foo%3Abar'; echo ""
curl 'http://127.0.0.1:8098/riak/mybucket/foo:bar'; echo ""
curl 'http://localhost:8098/buckets/mybucket/index/field1_bin/val1'; echo ""

curl 'http://127.0.0.1:8098/riak/mybucket/foo%3Abaz'; echo ""
curl 'http://127.0.0.1:8098/riak/mybucket/foo:baz'; echo ""
curl 'http://localhost:8098/buckets/mybucket/index/field1_bin/val2'; echo ""

# echo -e "\napp.config:\n"
# cat /etc/riak/app.config

# echo -e "\nriak.conf:\n"
# cat /etc/riak/riak.conf

# echo -e "\nadvanced.config:\n"
# cat /etc/riak/advanced.config

# echo -e "\nconsole.log\n"
# cat /usr/lib/riak/log/console.log
