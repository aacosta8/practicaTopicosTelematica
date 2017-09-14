# Herramientas para la Disponibilidad de la BD

  ## Uso de Master Slave p(postgresql configuration)

* Software postgresql

* master slave configuration (permite la replicación de la bd en otro servidor).

En el database1 server esta la base de datos master IP 10.121.137.222

En el database2 server esta la base de datos master IP 10.121.137.225

Para implementar esta configuración se siguio el tutorial de https://www.howtoforge.com/tutorial/postgresql-replication-on-ubuntu-15-04/

El primer paso que se realizo fue configurar el servidor database1 como master

Para esto se deben hacer unas modificaciones al archivo pg_hba.conf
se debe agregar la siguiente linea para permitir que el servidor database2 establezca una conexión con el servidor database1

```
host    replication     replica          10.131.137.226/24       md5
```

Tambien de deben agregar las ip de los AppServers para que puedan establecer una conexión a través del puerto 5432

```
host    all             all             10.131.137.245/24       trust
host    all             all             10.131.137.238/24       trust
```

El siguiente paso es configurar el servidor database2 como Slave
Para esto se deben hacer unas modificaciones al archivo pg_hba.conf

```
standby_mode = 'on'
primary_conninfo = 'host=10.121.137.222 port=5432 user=replica password=replicauser@'
restore_command = 'cp //var/lib/postgresql/9.4/main/archive/%f %p'
trigger_file = '/tmp/postgresql.trigger.5432'
```
y después de esto iniciar postgres

```systemctl start postgresql```
