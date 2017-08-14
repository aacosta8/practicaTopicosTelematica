#Definición del equipo, proyecto y aplicación.

1. ¿Cuál    proyecto 1    tomaron    como    base    y    por    qué?    

  Se tomó el proyecto  tópicos telematica del compañero Alex Acosta como aplicación para seguir trabajando, por una votación entre todos los miembros del equipo porque se vio un buen trabajo realizado en su aplicación cumpliendo con lo requerido en el proyecto 1, tenía además otras funcionalidades adicionales para esta entrega,  y un buen diseño que permitía una adecuada escabilidad para los siguientes proyectos de la materia tópicos especiales en telematica

2. Descripción    de    la    aplicación  

  La aplicación permitirá a los usuarios subir imágenes a la plataforma web en la cual los usuarios podrán gestionar su contenido, dándole la posibilidad al usuario de nombrar cada una de sus fotos subidas a la aplicación también podrá adjuntar el lugar donde fue tomada, la fecha en que la tomó, las personas con quien está en la foto  y una breve descripción de la imagen; estas imágenes pueden ser vistas dependiendo de la privacidad que el usuario desee suministrar, el usuario puede publicar su foto con tres posibles permisos los cuales son:

  * Pública: Cualquier persona puede ver la imagen subida sin necesidad de estar registrado en la aplicación.

  * Compartida: Solo podrá ser vista por los usuarios que estén registrados en la plataforma; la forma en que un usuario se puede registrar es ingresando con facebook o suministrando la información necesaria para crear su pe* RFil.

  * Privada: La imagen que suba solo la podrá ver el usuario que la subió a la plataforma.

  También será posible comentar las imágenes de los demás usuarios(sólo si está registrado en la página), pero estos comentarios solo podrán visualizarse si el propietario de la foto  autoriza que este sea visible.    

3. Requisitos    Funcionales    

  * RF1: El sistema permitirá registrar a los usuarios.

  * RF2: Se permitirá el ingreso a la página mediante la autenticación con facebook.

  * RF3: Los usuarios podran subir fotos a la página con el permiso que deseen (público, compartido o privado).

  * RF4: El sistema permitirá a los usuarios eliminar publicaciones que no deseen conservar más en la aplicación.

  * RF5: El usuario podrá editar el contenido de sus publicaciones, así como los permisos de visibilidad de la publicación.

  * RF6: Se permitirá ver las publicaciones compartidas por otros usuarios dependiendo del nivel de permisos que tengan las publicaciones.

  * RF7: Los usuarios podrán realizar comentarios si están registrados en la plataforma.

  * RF8: El sistema permitirá a los usuarios administrar los comentarios de sus publicaciones (eliminarlos, permitir que sean visibles o archivarlos).

  * RF9: El usuario podrá filtrar las publicaciones por fecha o por usuario.

4. Asignación    de     QA    /    roles.     
   * QA1:    Disponibilidad

    Estudiantes:  
    * Alexander Acosta
    * Esteban Salazar  

   * QA2:     Rendimiento                Estudiante:  Julián Arango López

   * QA3:     Seguridad                  Estudiante: Ana María Bedoya    

5. Dir    GitHub    del    Proyecto2.
  https://github.com/aacosta8/practicaTopicosTelematica    


6. Detalles    técnicos    del    proceso    para    la    incorporación    de    la    Gestión    de    Contenidos    en    el    proyecto2.    

  Para la gestión de contenido se utilizó la gema Paperclip, la cual facilitó el proceso de guardado tanto del contenido (imágenes) como de los metadatos.

  Los metadatos que guarda en la bd son los siguientes:

  * photo_file_name
  * photo_content_type
  * photo_file_size
  * photo_updated_at
