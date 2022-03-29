#!/bin/sh
CQKEY="${CQKEY:-undefined}"
sed -i "s!CQKEY!${CQKEY}!g" /usr/local/etc/haproxy/haproxy.cfg
