# Dominio: proyecto16.dis.eafit.edu.co
# IP: 200.12.180.86

1) En primer lugar se debía añadir el dominio dado al certificado existente previamente.

		$ sudo systemctl stop haproxy
		$ sudo /root/certbot-auto certonly --cert-path /etc/letsencrypt/archive/st0263.dis.eafit.edu.co --expand -d proyecto16.dis.eafit.edu.co
		$ sudo /root/certbot-auto certonly -d st0263.dis.eafit.edu.co  --expand -d proyecto16.dis.eafit.edu.co

2) Como resultado de los pasos anteriores se derivan dos archivos: fullchain.pem y privkey.pem

Ambos se concatenan y se almacenan en la carpeta /etc/haproxy/certs/proyecto16.pem con el siguiente comando:

	 	$ sudo cat /etc/letsencrypt/live/st0263.dis.eafit.edu.co/fullchain.pem /etc/letsencrypt/live/st0263.dis.eafit.edu.co/privkey.pem > /etc/haproxy/certs/proyecto16.pem

3) Luego se configura el archivo haproxy.cfg localizado en /etc/haproxy/
	
		frontend https
    	bind proyecto16.dis.eafit.edu.co:443    ssl     crt     /etc/haproxy/certs/proyecto16.pem
    	acl host_proyecto16 hdr(host) -i proyecto16.dis.eafit.edu.co
    	use_backend proyecto16_cluster if host_proyecto16
    
  		frontend http *:80
    	acl host_proyecto16 hdr(host) -i proyecto16.dis.eafit.edu.co
    	use_backend proyecto16_cluster if host_proyecto16
  
  		backend proyecto16_cluster
    	balance leastconn
    	option httpclose
    	cookie JSESSIONID prefix
    	server node2 10.131.137.156:80

  		frontend  main *:5000
    	acl url_static       path_beg       -i /static /images /javascript /stylesheets
    	acl url_static       path_end       -i .jpg .gif .png .css .js .scss
    	use_backend static          if url_static
    	default_backend             app
    
  		backend static
    	balance     roundrobin
    	server      static 127.0.0.1:4331 check

  		backend app
    	balance     roundrobin
    	server  app1 127.0.0.1:5001 check
    	server  app2 127.0.0.1:5002 check
    	server  app3 127.0.0.1:5003 check
    	server  app4 127.0.0.1:5004 check

4) Para finalizar, se reinicia el servicio haproxy:

		$ sudo systemctl restart haproxy

Y en caso de tener la VPN encendida, se apaga y se prueba la aplicación en un browser digitando las direcciones:

		http://proyecto16.dis.eafit.edu.co
		https://proyecto16.dis.eafit.edu.co