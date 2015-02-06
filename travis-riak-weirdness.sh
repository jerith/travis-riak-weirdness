#!/bin/bash

echo "vvvvv"
which node
echo "^^^^^"

exit 0
echo -e "Running the following script:\n"
cat $0

# echo -e "\nFixing Riak config:\n"

# sudo riak stop
# # sudo sed -i.bak 's/{vnode_vclocks, true}/{http_url_encoding, on}, {vnode_vclocks, true}/' /etc/riak/app.config
# sudo riak start
# sleep 5

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

echo -e "\nConfig:\n"

cat /etc/riak/app.config
