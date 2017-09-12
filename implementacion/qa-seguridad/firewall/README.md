# Configuración de firewalls.

Para ver los puertos que están siendo utilizados, se emplea el siguiente comando:

	$ sudo firewall-cmd --list-all

En nuestro caso, en todas las máquinas se hizo uso del puerto 80, aunque en otras máquinas debían haber más puertos abiertos para hacer uso de otros servicios, como es el caso de NFS. Para abrir determinado puerto se utilizaron los comandos:

	$ sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
	$ sudo firewall-cmd --reload



