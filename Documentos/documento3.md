## Vista de despliegue.

1. Miembros del equipo:

  * Alexander Acosta.
  * Julián Arango.
  * Ana Maria Bedoya.
  * Esteban Salazar.

2. Diseño	de	arquitectura	de	la	Aplicación	y	Sistema
  *  Vista	de	desarrollo:

      * Definición	de	Tecnología	de	Desarrollo:

      ![Tech](/Documentos/images/devTech.png)

      *  Vista	de	despliegue:
        Diagrama UML en donde se relacionan las máquinas empleadas con sus respectivas IPs:

      ![](/Documentos/images/uml.jpeg)
      * Tecnología:
          * Software Base:
          ![Software Base](/Documentos/images/baseSoft.png)
          * Redes: infraestructura proveída por el datacenter de la Universidad EAFIT.

      *  URL	de	ejecución:
      		  * [Pública](http://proyecto16.dis.eafit.edu.co/)

            * Privada: http://10.131.137.156.  

3. Implementación	y	Pruebas	por	Atributo	de	Calidad:

  *  Implementación:
    *  Herramientas	utilizadas:
    * DISPONIBILIDAD
      * HAPROXY
      * NFS
      * HTTPD
      * POSTGRES MASTER-SLAVE

    * Cambios	en	la	implementación	de	la	aplicación:
      * DISPONIBILIDAD
        * CONFIGURACION BASE DE DATOS EN PRODUCCIÓN (database.yml) APUNTANDO A EL SERVIDOR https://www.howtoforge.com/tutorial/postgresql-replication-on-ubuntu-15-04/
        * LOAD BALANCER SUBIMOS LA APLICACION EN DOS SERVIDORES, LOS CUALES LO APUNTA EL LOAD BALANCER ENCARGANDOSE DE DISTRIBUIR LAS CARGAS ENTRE ESTOS DOS Y SI ALGUNO ESTA CAIDO EL SERVICIO SIGUE EN NORMAL FUNCIONAMIENTO CON EL OTRO SERVIDOR.
        * NFS SE IMPLEMENTO PARA EL ALMACENAMIENTO DE FOTOS EN LOS SERVIDORES 10.131.137.222 Y 10.131.137.226
        * EN POSTGRES SE IMPLEMENTO EL SISTEMA MASTER - SLAVE PARA SINCRONIZAR LOS DOS SERVIDORES Y BRINDAR UNA MEJOR DISPONIBILIDAD DEL SERVICIO. 
    
  * Esquemas	de	pruebas	para	comprobar	el	Atributo	de	Calidad.

      * DISPONIBILIDAD
        * Si se presenta la caida en uno de los servidores de aplicación, el load balancer nos permite seguir en funcionamiento la aplicación debido a el balnceo de cargar que realiza.
        * igualmente si se presentan caidas en la base de datos o en archivos, se tiene un respaldo el cual permitira que la aplicación funcione normalmente para el usuario mostrandole toda su información.
        

