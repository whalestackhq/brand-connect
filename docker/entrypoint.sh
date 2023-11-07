#!/bin/sh
WS_BRANDING_KEY="${WS_BRANDING_KEY:-undefined}"
sed -i "s!{{WS_BRANDING_KEY}}!${WS_BRANDING_KEY}!g" /usr/local/etc/haproxy/haproxy.cfg
