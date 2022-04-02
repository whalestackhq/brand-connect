#!/bin/sh
CQ_BRANDING_KEY="${CQ_BRANDING_KEY:-undefined}"
sed -i "s!{{CQ_BRANDING_KEY}}!${CQ_BRANDING_KEY}!g" /usr/local/etc/haproxy/haproxy.cfg
