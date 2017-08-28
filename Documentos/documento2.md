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



## Referencias.
  * Behique Digital. (2017). ¿Por qué la Autenticación Básica de HTTP/1.1 es vulnerable? (+Ejemplo). [online] Available at: https://henryraul.wordpress.com/2016/09/02/la-inseguridad-de-la-autenticacion-basica-de-http1-1-ejemplo/ [Accessed 27 Aug. 2017].
  * Docs.microsoft.com. (2017). Security patterns. [online] Available at: https://docs.microsoft.com/en-us/azure/architecture/patterns/category/security [Accessed 27 Aug. 2017].
  * En.wikipedia.org. (2017). Security pattern. [online] Available at: https://en.wikipedia.org/wiki/Security_pattern [Accessed 27 Aug. 2017].
  * Es.wikipedia.org. (2017). OpenID. [online] Available at: https://es.wikipedia.org/wiki/OpenID [Accessed 27 Aug. 2017].
  * Letsencrypt.org. (2017). How It Works - Let's Encrypt - Free SSL/TLS Certificates. [online] Available at: https://letsencrypt.org/how-it-works/ [Accessed 27 Aug. 2017].
  * Lecturas de clase disponibles en EAFIT Interactiva.
  * Shailesh Kumar Shivakumar. (2014). Architecting High Performing, Scalable and Available Enterprise Web Applications. Morgan Kaufmann Publishers.
  * Bass, L., Clements, P. and Kazman, R. (2012). Software architecture in practice. Upper Saddle River, NJ: Addison-Wesley.
