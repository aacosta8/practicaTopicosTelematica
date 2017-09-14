# Herramientas para la Disponibilidad del contenido

## Uso de NFS

* Software nfs

* file system (permite Guardar el contenido en otro(s) servidor(es) diferente al que esta el AppServer).


En el servidor database1 se encuentra la carpeta /var/system en la cual están contenidas las imágenes
para configurar este servidor se realizaron las siguientes configuraciones:

*instalar nfs
```yum install nfs-utils```
Crear la carpeta que se desea compartir
```mkdir /var/system```
Dar permisos para que los otros servidores puedan acceder a las imagenes
```chmod -R 777 /var/nfsshare/```


Después de esto se debe modificar el archivo /etc/exports con lo siguiente:

```
/var/nfsshare    <ip>*(rw,sync,no_root_squash,no_all_squash)

```
Y después de esto se debe reiniciar nfs ``` systemctl restart nfs-server```

*También se deben abrir los puertos de nfs
```
firewall-cmd --permanent --zone=public --add-service=nfs
firewall-cmd --reload
```


En los servidores donde están las AppServers se debe instalar nfs y hacer mount de la carpeta
indicando donde esta la carpeta

```
 mount -t nfs 10.131.137.222:/var/system /mnt/nfs/var/system/
```

Después de hacer el mount se debe crear un link simbólico en la carperta donde guardan las imagenes por defecto

```
ln /mnt/nfs/var/system/ /var/www/practicaTopicosTelematica/code/public/system
```
