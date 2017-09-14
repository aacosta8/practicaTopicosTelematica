# Herramientas para la Disponibilidad

## Uso de Load Balancer

* Software HAPROXY

      http://www.haproxy.org/

* Proxy inverso (permite que un browser en Internet público, pueda ingresar a los servidores AppServer).
* Balanceador de cargas (permite distribuir Requerimientos a los N servidores AppServer)

En el AppServer1 hay una app corriendo por el puerto 80

En el AppServer2 hay otra app corriendo por el puerto 80

Para comprobar el funcionamiento, en un browser entre:

http://192.168.10.238 y

http://192.168.10.245


En el servidor HAPROXY debe tener previamente instalado haproxy:

* En CentOS:

      $ sudo yum install haproxy


* Configuración en el HAPROXY:

      $ sudo vim /etc/haproxy/haproxy.cfg

```
global

    log         127.0.0.1 local2

    chroot      /var/lib/haproxy
    pidfile     /var/run/haproxy.pid
    maxconn     4000
    user        haproxy
    group       haproxy
    daemon

    # turn on stats unix socket
    stats socket /var/lib/haproxy/stats

defaults
    mode                    http
    log                     global
    option                  httplog
    option                  dontlognull
    option http-server-close
    option forwardfor       except 127.0.0.0/8
    option                  redispatch
    retries                 3
    timeout http-request    10s
    timeout queue           1m
    timeout connect         10s
    timeout client          1m
    timeout server          1m
    timeout http-keep-alive 10s
    timeout check           10s
    maxconn                 3000



frontend http *:80
    acl host_ hdr(host) -i proyecto16.dis.eafit.edu.co

    use_backend st0263_cluster

backend st0263_cluster
    balance roundrobin
    cookie SERVERID insert indirect nocache
    server node1 10.131.137.238:80 check cookie node1
    server node2 10.131.137.245:80 check cookie node2
``` 
