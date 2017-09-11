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

    * Cambios	en	la	implementación	de	la	aplicación:

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
