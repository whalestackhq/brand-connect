FROM haproxy

USER root

RUN apt-get update
RUN apt-get install ca-certificates libcap2-bin -y
RUN setcap 'cap_net_bind_service=+ep' /usr/local/sbin/haproxy

COPY entrypoint.sh /tmp/entrypoint.sh
RUN tail -n +1 /usr/local/bin/docker-entrypoint.sh > /tmp/docker-entrypoint.sh
RUN cat /tmp/entrypoint.sh /tmp/docker-entrypoint.sh > /usr/local/bin/docker-entrypoint.sh


COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
RUN chown haproxy:haproxy /usr/local/etc/haproxy/haproxy.cfg
RUN chown haproxy:haproxy /usr/local/etc/haproxy
COPY ssl.pem /ssl.pem

USER haproxy

