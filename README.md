# practicaTopicosTelematica
By: Alexander Acosta Jiménez - aacosta8@eafit.edu.co
# Descripción de la aplicación

Gestión de imágenes tipo Pinterest.

La aplicación permitirá a los usuarios subir imágenes a la plataforma web en la cual los usuarios podrán gestionar su contenido

# 1.Implementación realizada como proyecto de la materia, en los ambientes:

* Desarrollo:
  Se generó la base, con Rails:

  `rails new practicaTopicosTelematica`

  (este generador, crea una app base MVC)

* Test:
  Se desplegó la aplicación en el DCA de la universidad
  con la ayuda de la gema passenger y con Nginx
  Se probaron los servicios con la aplicación
  Advanced REST Client

  Para subir la aplicación se deben realizar los siguientes pasos:

    `cd /var/www/practicaTopicosTelematica/code`

    `passenger start`

    el comando anterior cargara el archivo Passengerfile.json que tiene establecidas las siguientes configuraciones

          {
            // Run the app in a production environment. The default value is "development".                                                                     
            "environment": "production",
            // Run Passenger on the given port. In this example, we use port 80,                                                                                
            // the standard HTTP port.                                                                                                                          
            "port": 3000,
            // Tell Passenger to daemonize into the background.                                                                                                 
            "daemonize": true,
            // Tell Passenger to run the app as the given user. Only has effect                                                                                 
            // if Passenger was started with root privileges.                                                                                                   
            "user": "alex"
          }

  Al correr este comando la alicación quedara corriendo en background por el puerto 3000

  http://10.131.137.238:3000



* Producción:
  Se desplegó la aplicación en Heroku

  `heroku login` Comando para iniciar sesión

  `heroku create` Crea un subdominio para alojar la app

  `git push heroku master` Sube la app al servidor

  `heroku  run rake db:migrate` Crea las migraciones de la base de datos

  `heroku open` Abre nuestra app ya desplegada en el navegador

  Para ingresar a la app desplegada en Heroku solo necesitas ingresar al siguiente link:

  https://practicatopicos.herokuapp.com/


# 2.Especificaciones técnicas:

* Ruby version: 2.4.0
* Rails version: 5.1.2

# 3.Requisitos funcionales:

  * Crear una publicación.
  * Borrar una publicación
  * Editar una publicación
  * Listar mis imagenes
  * Listar las fotos publicas en el index
  * Registrarse como usuario de la plataforma

# 4.Diseño:

  ## 4.1 Modelo de datos

  publications:

  {string "name", text "description" string "place"
  integer "permission_pub" datetime "created_at" datetime "updated_at"
  bigint "user_id"
  string "photo_file_name"
  string "photo_content_type"
  integer "photo_file_size"
  datetime "photo_updated_at"
  t.index "user_id"}


  users:

  {string "email", string "username", string "name"}


  Un usuario tiene 0 o muchas publicaciones,
  y una publicación pertenece a un solo usuario

  ## 4.2 Servicios Web

 *Renderiza el formulario para iniciar sesión*

          GET /users/sign_in

  *Envia los datos del formulario y si son correctos ingresa*

          POST   /users/sign_in

  *Elimina la sesión actual (cerrar sesión)*       

          DELETE /users/sign_out

  *Renderiza el formulario para registrar un nuevo usuario *

          GET    /users/sign_up

*Renderiza las publicaciones publicas o compartidadas dependiendo de si hay una sesión iniciada*

          GET    /publications

*Carga los datos de una nueva publicación para guardarlos en la base de datos*

          POST   /publications

*Crea una instancia de una nueva publicación y renderiza el formulario para crear una nueva publicacion*

          GET    /publications/new

*Renderiza el formulario con los datos de la publicación que se desea modificar*

          GET    /publications/:id/edit

*Muestra una publicación en especifico*

          GET    /publications/:id


*Envia el formulario de una publicación y la modifica en la base de datos *

          PATCH  /publications/:id

*Envia el formulario de una publicación y la modifica en la base de datos*

          PUT    /publications/:id

*Elimina una publicación de la base de datos*

          DELETE /publications/:id

*Hace una consulata para listar las fotos del usuario logeado,
tanto las publicas, compartidas y privadas*

          GET    /misfotos
