#!/bin/sh

if [ -n "$WS_BRANDING_KEY" ]; then
  WS_BRANDING_KEY="$WS_BRANDING_KEY"
elif [ -n "$CQ_BRANDING_KEY" ]; then
  # legacy var name
  WS_BRANDING_KEY="$CQ_BRANDING_KEY"
else
  WS_BRANDING_KEY="undefined"
fi

sed -i "s!{{WS_BRANDING_KEY}}!${WS_BRANDING_KEY}!g" /usr/local/etc/haproxy/haproxy.cfg
