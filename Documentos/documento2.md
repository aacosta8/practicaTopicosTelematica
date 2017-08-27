# Estado del arte, análisis y diseño para escalabilidad.

Atributos de calidad seleccionados:
   * QA1:    Disponibilidad.
     Estudiantes:  
      *  Alexander Acosta.
      * Esteban Salazar.
   * QA2:     Rendimiento.                Estudiante:  Julián Arango López
   * QA3:     Seguridad.                  Estudiante: Ana María Bedoya    


## Seguridad.

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
![alt text](https://github.com/aacosta8/practicaTopicosTelematica/tree/master/Documentos/images/General.png)

