# Estado del arte, análisis y diseño para escalabilidad.

Atributos de calidad seleccionados:
   * QA1:    Disponibilidad.
     Estudiantes:  
      *  Alexander Acosta.
      * Esteban Salazar.
   * QA2:     Rendimiento.                Estudiante:  Julián Arango López
   * QA3:     Seguridad.                  Estudiante: Ana María Bedoya    


## Seguridad

## 1. Marco de referencia.
## a. Definición.
La seguridad es una medida de la capacidad de un sistema para proteger los datos y la información del acceso no autorizado, a la vez que proporciona acceso a personas y sistemas autorizados. Una acción que se emprende en contra de un sistema informático con la intención de dañarlo se denomina un ataque y puede manifestarse de diferentes formas. Puede tratarse de un intento no autorizado de acceder a datos o servicios o de modificar datos, o puede estar destinado a denegar servicios a usuarios legítimos.

Una estrategia de seguridad integral debe abordar los siguientes aspectos en todas las capas:
1) Confidencialidad: Los datos no deben ser revelados a usuarios no autorizados. Por ejemplo, un hacker no debería poder acceder a la información personal de las personas en un programa gubernamental.

2) Integridad: Los datos o servicios no están sujetos a manipulación no autorizada. Por ejemplo, la nota definitiva de un alumno no debe ser cambiada tiempo después por otro profesor o persona diferente a quien se la asignó.

3) Disponibilidad: Los datos y servicios deben poder ser accedidos por los usuarios autorizados todo el tiempo. Por ejemplo, un ataque de denegación de servicio no debe impedir ordenar libros desde la tienda virtual de una librería.   

## b. Patrones.
  * Federated Identity: Delega la autenticación en un proveedor de identidad externo.

  * Gatekeeper: Protege las aplicaciones y los servicios utilizando una instancia de host que actúa como intermediario entre los clientes y la aplicación o servicio, valida y desinfecta las solicitudes para luego pasarlas con los datos respectivos entre ellas.

  * Valet Key: Utiliza un token o clave que proporciona a los clientes acceso restringido directo a un recurso o servicio específico.

  * Error detection/correction: Su objetivo es deducir errores y posiblemente corregirlos para garantizar un intercambio o almacenamiento de información correcto.

  * Check pointed System: Describe un diseño para usar replicación y recuperarse cuando un componente falla.

  * Standby: Es capaz de proporcionar un componente de “fall back” capaz de reanudar el servicio del componente que falla.

## c. Especificación mediante escenarios.
Para definir y realizar el análisis de este QA se utilizará el siguiente escenario general de seguridad:
![](/Documentos/images/General.png)


## d. Tácticas.
  * Seguridad física
  * Detección de ataques
  * Resistir ataques
  * Reaccionar a los ataques
  * Recuperar de los ataques

En la siguiente imagen se hace más específica la descripción de cada una de las tácticas enunciadas anteriormente.
![](/Documentos/images/tactics.png)

## e. Herramientas.
  * HTTPS: Puede emplearse como mecanismo de autenticación básica. En las aplicaciones web que la utilizan, se pone en marcha cuando el usuario, a través de un user-agent realiza la petición de un recurso protegido. Si el respectivo user-agent es un navegador web, se puede apreciar una ventana emergente que solicita el nombre de usuario y la contraseña.

  * SAML: Es un estándar abierto que define un esquema XML para el intercambio de datos de autenticación y autorización. Usualmente las partes que intervienen en el intercambio son un proveedor de identidad (entidad que dispone de la infraestructura necesaria para la autenticación de los usuarios) y un proveedor de servicio (entidad que concede a un usuario el acceso o no a un recurso).

  * OpenID: Es un estándar de identificación digital descentralizado con el que un usuario puede identificarse en una página web a través de una URL y puede ser verificado por cualquier servidor que soporte el protocolo.

  * SonarQube: Es una plataforma utilizada para el análisis de la calidad de código usando diversas herramientas de análisis estático de código fuente para obtener métricas que pueden ayudar a mejorar la calidad del código de un programa. Es una herramienta clave en el proceso de testing.

## 2. Análisis mediante escenarios.

a. Inicio de sesión sin estar registrado.
![](/Documentos/images/Escenario1.png)

b. Eliminar una imagen sin ser propietario.
![](/Documentos/images/Escenario2.png)

c. Subir archivos diferentes a imágenes.
![](/Documentos/images/Escenario3.png)

d. Adivinar contraseñas de usuarios del sistema.
![](/Documentos/images/Escenario4.png)

## 3. Diseño: En aplicación y en sistema.
## a. Vistas de arquitectura.
Diagrama de secuencia para OpenID:
![](https://apicrazy.files.wordpress.com/2014/08/openid-connect-sequence-diagram1.png)

## b. Patrones de arquitectura.
Se implementará una arquitectura Single Sing-On (SSO) para el servicio de autenticación. Este se realizará de manera externa con un proveedor de OpenID cuya estructura puede apreciarse en la siguiente imagen:
![](/Documentos/images/openid.png)

Para garantizar la confidencialidad de la aplicación se empleará HTTPS con Let’s Encrypt para obtener un certificado confiable (llave) automáticamente desde el navegador. Let’s Encrypt utiliza el siguiente esquema:

![](/Documentos/images/https.png)

## c. Best Practices.
Luego de tener identificados los requerimientos de seguridad de la aplicación, se procedería a realizar un análisis de riesgos y vulnerabilidades para establecer de forma clara cuáles son las amenazas que pueden presentarse en torno a los diferentes datos y servicios de la aplicación. Finalmente, con la información obtenida, se diseñaría un plan o programa estratégico de seguridad.

## d. Tácticas.
Para el desarrollo del proyecto se utilizarán las siguientes tácticas de seguridad:
  * Identificar usuarios.
  * Autenticar usuarios.
  * Autorizar usuarios.
  * Limitar acceso.
  * Detectar intrusión.
  * Revocar acceso.
  * Recuperarse de ataques.

## e. Herramientas.
  * OpenID.
  * Let’s Encrypt.
  * SonarQube.

## Disponibilidad

## a. ¿Qué es?
  Disponibilidad es aquella que está allí y realiza una tarea cuando es necesario. Esta es una perspectiva amplia y tiene como objetivo la fiabilidad, como también puede centrarse en algunas cosas adicionales como es la inactividad cuando se tiene un mantenimiento periódico. La disponibilidad se basa en el concepto de fiabilidad añadiendo la noción de recuperación, es decir cuando el sistema tiene una caída de servicio, se restablece por sus medios, esta se puede realizar por diferentes medios.
  La disponibilidad es la capacidad de un sistema para reparar o cubrir fallos de tal manera que el periodo acumulativo de interrupción del servicio no exceda un valor requerido durante un intervalo de tiempo especificado. También se consideran conceptos de confiabilidad, confidencialidad, integridad y cualquier otro atributo de calidad que implique un concepto de fracaso inaceptable.
  Principalmente la disponibilidad consiste en minimizar el tiempo de interrupción del servicio al mitigar fallas. El fallo implica visibilidad a un sistema o un humano que esté pendiente del servicio.

## b. ¿Qué patrones se pueden emplear?
  * Failover
  * Failback
  * Replicación
  * Redundancia
  * Virtualización
  * Mantenimiento
    * Mantenimiento correctivo
    * Mantenimiento preventivo
    * Mantenimiento perfectivo

## c. Especificación mediante escenarios
  ![](/Documentos/images/disponibilidadEscenario.png)

## d. ¿Qué tácticas se pueden emplear?
  * Detección de fallos
  * Recuperarse de fallas
  * Prevenir fallas

  En la siguiente imagen se hace más específica la descripción de cada una de las tácticas enunciadas anteriormente.

  ![](/Documentos/images/tacticasdisponibilidad.png)

## e. Qué	herramientas se pueden utilizar para lograrlo
  * Enlaces redundantes
  * Monitoreo de la red
  * Failover Features
  * Detección de fallos a nivel de red, auto-recuperación y Graceful Restart (GR) o Non Stop Forwarding (NSF) (reinicio)
  * Disponibilidad de almacenamiento se puede lograr mediante RAID, virtualización de almacenamiento y dispositivos NAS / SAN

## 2. Análisis: Mediante escenarios y/o propuesta en marco teórico.

a. Se reinicia el servidor inesperadamente.

![](/Documentos/images/EscenarioD1.png)

b. Hearbeat para conocer cuando se cae el servidor.

![](/Documentos/images/EscenarioD2.png)


## 3. Diseño: En Aplicación y en Sistema.


## a. Vistas de arquitectura.

## b. Patrones de arquitectura.
  * Failover: Se va a implementar para los balanceadores entre los clientes( browsers) y los servidores, implementado uno primario y secundario.
  * Failback: Este se implementara para regresar el sistema que presenta fallas a la normalidad
  * Replicación de los datos.
  * Redundancia: Se implementa con los servidores, file servers, balanceadores, base de datos y conexiones, para una mayor disponibilidad.
  * Virtualización de los datos almacenados.
  * Mantenimiento preventivo para evitar una posible falla en el sistema

## c. Best Practices.
  * Hardware related best practices:
    * Infraestructura de monitoreo y alerta proactiva
    * Redundancia en hardware
    * Recuperación de desastres
  * Software related best practices:
    * Arquitectura simple
    * Diseño de componentes de software modulares
    * Estrategia de almacenamiento en caché
    * Automatización para actividades de mantenimiento

## d. Tácticas.
  Para el desarrollo del proyecto se utilizarán las siguientes tácticas de disponibilidad:

  * Detección de fallos
  * Recuperarse de fallas
  * Prevenir fallas

## e. Herramientas.
  * Enlaces redundantes
  * Failover Features
  * Detección de fallos a nivel de red, auto-recuperación y Graceful Restart o Non Stop Forwarding
  * Disponibilidad de almacenamiento


## Rendimiento

1.  Rendimiento:

  En resumen se habla de tiempo, es la capacidad que tiene el sistema para cumplir con los requisitos de tiempo. El sistema o algún elemento de este debe responder a tiempo cuando se presenta un evento. Se trata de determinar los eventos que pueden ocurrir, cuando ocurren y la respuesta del sistema a esos eventos, basada en tiempo es la esencia del rendimiento del sistema.

  Los eventos de un sistema basado en la web se presentan en forma de peticiones de los usuarios, desde clientes como navegadores web y otras aplicaciones que consumen los servicios. La respuesta esperada a esta discusión sería mostrada como el número de transacciones que pueden ser recibidas y procesadas en un determinado período de tiempo.

  A lo largo de la historia el rendimiento ha sido el factor el factor determinante en la arquitectura del sistema, lo que ha relegado en algunas ocasiones todos los demás criterios de calidad. Con el paso del tiempo la relación precio-rendimiento del hardware ha disminuido y el costo de desarrollo de software se ha incrementado, mientras han surgido nuevos atributos de calidad que compiten con el rendimiento.

  Pero el rendimiento es un atributo de calidad inherente a  todo el software, todo los sistemas tienen requisitos de rendimiento, aunque sea implícitamente el usuario espera que el sistema responda en cierto rango de tiempo, de esta forma el rendimiento sigue siendo uno de los atributos fundamentales de cualquier sistema.

### Dentro de los patrones que pueden ser empleados encontramos algunos como:

  * Optimización de assets para disminuir tiempo de carga de la página

  * Caching: para ahorrar recursos en peticiones repetitivas.

  * Diseño para el fracaso: prepararse para posibles fallas futuras.

  * Procesamiento paralelo: distribuir funcionalidades para obtener mejor rendimiento y escalabilidad.

  * Mantenerlo ligero: los componentes clave y las páginas deben mantenerse lo menos pesados posible y minimizar el número de envíos de  
  información (por ejemplo usando AJAX).

  * solicitud de datos asincrónicos: esto mejora drásticamente el tiempo percibido de carga de la página.

  * Carga bajo demanda: Cargar la información sólo cuando sea necesario.

  * Proporcionar resultados de búsqueda paginados y cargar los datos para la página sólo cuando se navegue a ella.

  * Batching: Mientras se recuperan datos de una petición, se recomienda agrupar las solicitudes para minimizar el número de viajes al * servidor.

  * Utilizar tecnología basada en estándares: nos permitiría fácilmente extender la pila de tecnología en el futuro, también nos ayuda a
  entender la tecnología y a solucionar problemas de rendimiento.

  * Diseño y pruebas basados ​​en el rendimiento: todo el rendimiento posible los escenarios deben ser modelados y probados para asegurar que la aplicación sea a prueba de términos de rendimiento.
  Diseño simple, modular y reutilizable: Los componentes de software deben estar diseñados de tal manera que puedan ser fácilmente probados y reutilizados para construir una funcionalidad más grande.


Un escenario general de rendimiento inicia con una petición del usuario, es decir un evento que llega al sistema, responder a este evento consume recursos como tiempo, al mismo tiempo el sistema va a responder a otros eventos.

La concurrencia es uno de los conceptos más importantes en arquitectura de software, hace referencia a operaciones que suceden en paralelo, es decir, ocurre cada que el sistema crea un nuevo hilo, que son secuencias independientes de control, que permiten soportar múltiples usuarios y tareas simultáneamente. Los eventos se dividen según la frecuencia en periódicos,  estocásticos y esporádicos.

### La respuesta del sistema a un estímulo puede ser medida mediante:

  * Latencia: tiempo entre la llegada del estímulo y la respuesta del sistema.
  * Límites de procesamiento.
  * Throughput: número de transacciones que el sistema puede procesar por periodo de tiempo.

### Desde estas consideraciones se pueden establecer individualmente las partes de un escenario general de rendimiento:

  * Fuente de estímulo: Los estímulos llegan desde fuentes externas (posiblemente múltiples) o internas.
  * Estímulo: Los estímulos son las llegadas del evento. El patrón de llegada puede ser periódico, estocástico o esporádico, caracterizado por parámetros numéricos.
  * Artefacto: El artefacto es el sistema o uno o más de sus componentes.
  * Ambiente: El sistema puede estar en varios modos operativos, tales como normal, emergencia, carga de pico o sobrecarga.
  * Respuesta: El sistema procesa los eventos que llegan, lo puede causar un cambio en el entorno del sistema.
  * Medida de respuesta. Las medidas de respuesta son el tiempo necesario para procesar los eventos que llegan (latencia, jitter, throughput y tasa de errores).

### Tácticas:

#### Controlar la demanda de recursos: reducir el número de eventos procesados estableciendo una frecuencia de muestreo.

  * Administrar la frecuencia de muestreo.
  * Priorizar eventos.
  * Reducir la sobrecarga.
  * Tiempos de ejecución vinculados.
  * Aumentar la eficiencia de los recursos.


#### Administrar recursos: es posible incluso si no se puede controlar la demanda de recursos. Esta táctica es aplicada generalmente al procesador pero es también eficaz cuando es aplicada a otros recursos como un disco.

  * Aumentar los recursos.

  * Introducir la concurrencia.

  * Mantener copias múltiples de cálculos.

  * Mantener múltiples copias de datos.

  * Tamaños de cola enlazados.

  * Programar recursos

### Herramientas:

  * Establecer los Acuerdos de Nivel de Servicio (SLA) de rendimiento y los objetivos.

  * Modelado del rendimiento, evaluación de los escenarios y análisis de procesos y transacciones críticas del negocio.

  * Establecimiento de directrices de diseño de rendimiento.

  * Aplicación de directrices de diseño de rendimiento.

  * Identificar, analizar y eliminar cuellos de botella en varios componentes.

  * Establecer una infraestructura continua de monitoreo y alerta.

  * Establecer una gestión del rendimiento con procesos y equipos bien definidos para mantener los SLAs de rendimiento.


## Referencias.
  * Behique Digital. (2017). ¿Por qué la Autenticación Básica de HTTP/1.1 es vulnerable? (+Ejemplo). [online] Available at: https://henryraul.wordpress.com/2016/09/02/la-inseguridad-de-la-autenticacion-basica-de-http1-1-ejemplo/ [Accessed 27 Aug. 2017].
  * Docs.microsoft.com. (2017). Security patterns. [online] Available at: https://docs.microsoft.com/en-us/azure/architecture/patterns/category/security [Accessed 27 Aug. 2017].
  * En.wikipedia.org. (2017). Security pattern. [online] Available at: https://en.wikipedia.org/wiki/Security_pattern [Accessed 27 Aug. 2017].
  * Es.wikipedia.org. (2017). OpenID. [online] Available at: https://es.wikipedia.org/wiki/OpenID [Accessed 27 Aug. 2017].
  * Letsencrypt.org. (2017). How It Works - Let's Encrypt - Free SSL/TLS Certificates. [online] Available at: https://letsencrypt.org/how-it-works/ [Accessed 27 Aug. 2017].
  * Lecturas de clase disponibles en EAFIT Interactiva.
  * Shailesh Kumar Shivakumar. (2014). Architecting High Performing, Scalable and Available Enterprise Web Applications. Morgan Kaufmann Publishers.
  * Bass, L., Clements, P. and Kazman, R. (2012). Software architecture in practice. Upper Saddle River, NJ: Addison-Wesley.
  * Bass, L., Clements, P., & Kazman, R. (2013). Software architecture in practice. Upper Saddle River, NJ: Addison-Wesley.
  * Shailesh Kumar Shivakumar. (2015). Architecting High Performing, Scalable and Available Enterprise Web Applications. Morgan Kaufmann Publishers.
