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

    * DISPONIBILIDAD
      *  Herramientas	utilizadas:
        * HAPROXY
        * NFS
        * HTTPD
        * POSTGRES MASTER-SLAVE

    * Cambios	en	la	implementación	de	la	aplicación:

      * CONFIGURACION BASE DE DATOS EN PRODUCCIÓN (database.yml) APUNTANDO A EL SERVIDOR https://www.howtoforge.com/tutorial/postgresql-replication-on-ubuntu-15-04/
      * LOAD BALANCER SUBIMOS LA APLICACION EN DOS SERVIDORES, LOS CUALES LO APUNTA EL LOAD BALANCER ENCARGANDOSE DE DISTRIBUIR LAS CARGAS ENTRE ESTOS DOS Y SI ALGUNO ESTA CAIDO EL SERVICIO SIGUE EN NORMAL FUNCIONAMIENTO CON EL OTRO SERVIDOR.
      * NFS SE IMPLEMENTO PARA EL ALMACENAMIENTO DE FOTOS EN LOS SERVIDORES 10.131.137.222 Y 10.131.137.226
      * EN POSTGRES SE IMPLEMENTO EL SISTEMA MASTER - SLAVE PARA SINCRONIZAR LOS DOS SERVIDORES Y BRINDAR UNA MEJOR DISPONIBILIDAD DEL SERVICIO.

* Esquemas	de	pruebas	para	comprobar	el	Atributo	de	Calidad.

    * DISPONIBILIDAD
      * Si se presenta la caida en uno de los servidores de aplicación, el load balancer nos permite seguir en funcionamiento la aplicación debido a el balnceo de cargar que realiza.
      * igualmente si se presentan caidas en la base de datos o en archivos, se tiene un respaldo el cual permitira que la aplicación funcione normalmente para el usuario mostrandole toda su información.


  * Esquemas	de	pruebas	para	comprobar	el	Atributo	de	Calidad.


* Rendimiento
    * Herramientas	utilizadas:
      * Rails caching
      * Jmeter
      * Rake assets:precompile

    * Cambios	en	la	implementación	de	la	aplicación: por defecto rails precompila los assets, de manera que se modificó para que compilara los assets en vivo y poder medir el rendimiento antes y despues.

      +  config.assets.compile = true.
      +  config.cache_classes = false.

    para el caché, se debio modificar la forma de presentar las publicaciones, a cached partials,
    rails trae un funcionalidad que permite manejar el cache, entonces se modificoL

      + se eliminó "app/views/publications/_publications.html.erb_
      + está logica paso a app/views/publications/index.html.erb
      + se creó /app/views/publications/_publication.html.erb_ que es la página que se cachea.
      + en  config/environments/production.rb se agregó  config.cache_store = :memory_store, { size: 64.megabytes }
      la capacidad de cache.

  * Esquemas	de	pruebas: en la carpeta /jmeter se agreron los siguientes archivos de prueba:

	+ Upload.jmx: post de imagenes a /publications
	+ download.jmx: consulta de todas las imagenes.
	+ search.jmx: búsqueda de una imagen en específico.
    + FullTest.jmx 	Contiene los 3 anteriores en un solo archivo.

  Resultados:

  ![](/Documentos/images/238Antes.png)

  ![](/Documentos/images/156Antes.png)


* Seguridad
  * Herramientas utilizadas:
  
  Haproxy: Se empleó para el manejo de tráfico, esperando cumplir con los requisitos de disponibilidad. Su implementación fue fundamental para desarrollar la parte de confidencialidad (HTTP y HTTPS). En este caso se configuró en la máquina 200.12.180.86 el archivo /etc/haproxy/haproxy.cfg para especificar HTTP o HTTPS, y desde allí se redirigió al Load Balancer el cual dirige a las dos aplicaciones desplegadas.

  Let’s Encrypt: Herramienta utilizada para obtener el certificado, y luego adicionar los dominios que pertenecían al certificado correspondiente, en este caso el dominio asignado fue proyecto16.dis.eafit.edu.co.

  omniauth-google-oauth2: Con esta gema fue posible establecer una conexión con el API de Google para realizar la autenticación con este proveedor externo.


