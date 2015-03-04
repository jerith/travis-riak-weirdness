#!/bin/bash -x

echo "vvvvv"
which node
echo "^^^^^"

echo "vvvvv"
sudo find / -name 'console.log'
echo "^^^^^"

echo "vvvvv"
ls -l /etc/default/riak
cat /etc/default/riak
echo "^^^^^"

echo "vvvvv"
ls -l /etc/security/limits.conf
cat /etc/security/limits.conf
echo "^^^^^"

echo "ulimit -n 65536" > /etc/default/riak

# echo -e "Running the following script:\n"
# cat $0

sudo service riak stop
sleep 10
sudo service riak start
sleep 30

# echo -e "\nFixing Riak config:\n"

# sudo riak stop
# # sudo sed -i.bak 's/{vnode_vclocks, true}/{http_url_encoding, on}, {vnode_vclocks, true}/' /etc/riak/app.config
# sudo riak start
# sleep 30

sudo riak version
sudo riak-admin ring-status
sudo riak-admin status

echo -e "\nResults:\n"

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

echo -e "\napp.config:\n"
cat /etc/riak/app.config

echo -e "\nriak.conf:\n"
cat /etc/riak/riak.conf

echo -e "\nadvanced.config:\n"
cat /etc/riak/advanced.config

echo -e "\nconsole.log\n"
cat /usr/lib/riak/log/console.log
