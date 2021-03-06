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


  * Rendimiento
    * Herramientas	utilizadas:
      * Rails caching: usado para guardar contenido más solicitado.
      * Jmeter: medición de rendimiento, TR, troughput, concurrencia.
      * Rake assets:precompile: disminución en el tamaño de los assets.

    * Cambios	en	la	implementación	de	la	aplicación:

     La principal estrategia sería precompilar los assets en los app servers para
     enviar menos datos para cada petición, por defecto rails precompila los assets,
     de manera que se modificó para que compilara los assets en vivo y poder medir
    el rendimiento antes y despues.

      +  config.assets.compile = true. Hace que se compile los assets en vivo.
      +  config.cache_classes = false. Hace que siempre no se cacheen los assets.

    La segunda estrategia sería utilizar cache para descarga rápida de las
    páginas y contenido más usado, guardando este en el app server localmente en
    carpetas temporales que se borraran periodicamente.para el caché, se debio modificar la forma de presentar las publicaciones, a cached partials,
    rails trae un funcionalidad que permite manejar el cache, entonces se modificoL

      + Se eliminó "app/views/publications/_publications.html.erb_
      + Esta logica paso a app/views/publications/index.html.erb
      + Se creó /app/views/publications/_publication.html.erb_ que es la página que se cachea.
      + En  config/environments/production.rb se agregó  config.cache_store = :memory_store, { size: 64.megabytes }
      la capacidad de cache.


  * Esquemas	de	pruebas: en la carpeta /jmeter se agreron los siguientes archivos de prueba:

    * Para poder realizar los test se agregó
  controlador que se estaba probando la siguiente linea
  para omitir la verificación de la sesión y el authenticity token y de esta manera poder realizar peticiones.

        [protect_from_forgery with: :null_session]

	+ Upload.jmx: post de imagenes a /publications
	+ download.jmx: consulta de todas las imagenes.
	+ search.jmx: búsqueda de una imagen en específico.
    + FullTest.jmx 	Contiene los 3 anteriores en un solo archivo.

    *Se corrieron en este orden (sin el FullTest.jmx).

  Resultados:

  * Server 1 (10.131.137.238)

    ![Server 1 antes](/Documentos/images/238Antes.png)

    ![Server 1 despues](/Documentos/images/238Despues.png)

  * Private LB (10.131.137.156)

    ![private LB antes](/Documentos/images/156Antes.png)

    ![private LB despues](/Documentos/images/156Despues.png)

* Seguridad
  * Herramientas utilizadas:

  Haproxy: Se empleó para el manejo de tráfico, esperando cumplir con los requisitos de disponibilidad. Su implementación fue fundamental para desarrollar la parte de confidencialidad (HTTP y HTTPS). En este caso se configuró en la máquina 200.12.180.86 el archivo /etc/haproxy/haproxy.cfg para especificar HTTP o HTTPS, y desde allí se redirigió al Load Balancer el cual dirige a las dos aplicaciones desplegadas.

  Let’s Encrypt: Herramienta utilizada para obtener el certificado, y luego adicionar los dominios que pertenecían al certificado correspondiente, en este caso el dominio asignado fue proyecto16.dis.eafit.edu.co.

  omniauth-google-oauth2: Con esta gema fue posible establecer una conexión con el API de Google para realizar la autenticación con este proveedor externo.
