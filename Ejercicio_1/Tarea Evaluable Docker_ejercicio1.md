## Tarea Evaluable Docker - 2EV_Ejercicio_1_Contenedores en red y Docker Desktop

<div style= "background-color: rgb(165, 223, 244)">
    <p>
        Módulo: Despliegue de aplicaciones Web - Distancia
    </p>
   <p>
       Alumno: Alfonso Dapena Cores
    </p> 
    </div>




[toc]

##### 1.1 Consideraciones generales

- ¿Qué es Docker?

  Docker es una plataforma de código abierto que permite crear, ejecutar y gestionar aplicaciones en contenedores. Los contenedores son unidades estandarizadas que combinan el código de la aplicación con sus dependencias. De manera similar a cómo una máquina virtual virtualiza el hardware del servidor, los contenedores virtualizan el sistema operativo de un servidor.

  Con Docker, podemos utilizar los contenedores como máquinas virtuales  livianas y modulares, y obtener la flexibilidad necesaria para crearlos, implementarlos, copiarlos y trasladarlos de un entorno a otro. Docker permite empaquetar y ejecutar una aplicación en un entorno ligeramente aislado llamado contenedor. El aislamiento y la seguridad permiten ejecutar varios contenedores simultáneamente en un host. Los contenedores son ligeros y contienen todo lo necesario para ejecutar la aplicación, por lo que no es necesario depender de lo que esté instalado en el host. Podemos compartir contenedores mientras trabajamos y nos aseguramos de que todos los usuarios con los que lo compartimos obtengan el mismo contenedor, que funciona de la misma manera.

  Docker proporciona herramientas y una plataforma para administrar el ciclo de vida de sus contenedores, denominada Docker Hub, que es un repositorio público de imágenes de contenedores que permite almacenar, administrar y compartir imágenes de Docker, que son las plantillas que definen un contenedor, es decir, el espacio para ejecutar aplicaciones y servicios. Las imágenes Docker contienen el código, las bibliotecas y dependencias necesarias para que nuestro contenedor funcione.

  

##### 1.2 Creación red bridge `redge1`

- En primer lugar, accedemos a la aplicación Docker Desktop, pinchamos en la pestaña `Extensions` y desplegamos la opción `Manage`:

  
  
  <img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/0.1%20buscador%20extensiones.jpg" style="zoom:67%;" />
  
  
  
- Buscamos la extensión `PortNavigator` y la descargamos:

  

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/0.2%20instalar%20PortNavigator-1744653109957-3.jpg" style="zoom:50%;" />

- A continuación, crearemos la red brigde `redje1` para acceder a la pestaña de la extensión `PortNavigator`, y pinchamos en la opción `Add Network`:



<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/1.1%20creo%20la%20red%20redje1.jpg" style="zoom: 50%;" />

-  Le damos el nombre a la red y la creamos. Por defecto el propio programa asignará las direcciones IP a nuestra red.



<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/1.2creo%20la%20red%20redje1.jpg" style="zoom:50%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/1.3%20creo%20la%20red%20redje1.jpg" style="zoom:50%;" />



##### 1.3 Creación contenedor con la imagen `mariaDB`

- En primer lugar buscaremos en el navegador de `Docker Desktop` la imagen `mariaDB`:

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/2.0%20Buscar%20imagen.jpg" style="zoom:67%;" />



- A continuación, examinaremos nuestra imagen. Este apartado nos mostrará información relativa a la imagen: uso, cómo crear un contenedor a partir de ella, las versiones de la misma, como crear un fichero `Dockerfile`. Nosotros vamos a prestar especial atención a la sección `Environment Variables`, para configurar las variables de entorno con las que definiremos la contraseña y el usuario de nuestra base de datos:

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/2.1%20Selecciono%20la%20imagen%20y%20la%20examino.jpg" style="zoom:67%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/2.2%20examino%20la%20documentaci%C3%B3n%20de%20la%20imagen.jpg" style="zoom: 67%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/2.3%20Variables%20de%20entorno.jpg" style="zoom:67%;" />

- A continuación, descargamos la imagen con la opción `pull`:

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/2.4%20descargo%20imagen%20mariadb.jpg" style="zoom:67%;" />

- Una vez hemos descargado nuestra imagen, procedemos a crear el contenedor desde la sección de imágenes y pinchando en el botón de `play`, situado debajo de `Actions`:

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/3.1.creo%20el%20contenedor.jpg" style="zoom:50%;" />

- A continuación, se nos abrirá una pestaña donde indicaremos el nombre de nuestro contenedor `mariaDB`, el puerto 3306 a través del que nuestro contenedor será accesible. En la opción `Volumes` crearemos el volumen `ejercicio1` en el directorio `/var/lib/mysqul`, para que el almacenamiento de nuestra base de datos sea persistente. En la pestaña `Environment variables`, introduciremos nuestra contraseña root  `MYSQUL_ROOT_PASSWORD`, 1234, el nombre de la base de datos por defecto `daw`, un usuario `MYSQL_USER`, "alfonsodapena", con su contraseña `MYSQUL_PASSWORD`, " alfonso". Después de introducir todos los datos, pulsamos `RUN` para crear nuestro contenedor, que se inicializará de inmediato.

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/3.2%20creacion%20contenedor.jpg" style="zoom: 67%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/3.3%20contenedor%20inicializado.jpg" style="zoom:50%;" />

##### 1.4 Creación contenedor `phpMyAdmin`.

- Para la creación de nuestro contenedor `contenedor_phpmyadmin`, seguiremos los pasos indicados en la creación del contenedor `Contenedor_mariaDB`, del punto 1.2: 
  1. Buscamos la imagen en el navegador.
  2. Examinamos la imagen.
  3. Bajamos la imagen y creamos el contendor, con sus variables de entorno, donde indicaremos la variable de entorno `PMA_HOST` , que especifica el `host MySQL` para `phpMyAdmin`.

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/4.1%20busco%20la%20imagen%20php%20my%20admin.jpg" style="zoom: 67%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/4.2%20creo%20el%20contenedor.jpg" style="zoom: 50%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/4.3%20variables%20de%20entorno.jpg" style="zoom:50%;" />

##### 1.5 Conexión de  contenedores a la red  `redje1`. 

- El siguiente paso será conectar a los dos contenedores a la misma red, en este caso la `redje1`. Por defecto `Docker Desktop`, al crear los contenedores los asigna a un red, por lo que antes deberemos de desconectarlos de la red a la que han sido asignados los contenedores automáticamente:

​									

​		1.Conexión por defecto:				

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/5.1%20comprobar%20red.jpg" style="zoom:50%;" />

​		2. Procedemos a desconectarlos de la red

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/5.2%20comprobarred2.jpg" style="zoom:50%;" />

​		3. Después de desconectarlos, nos fijamos en que en la parte de abajo, figuran ya los dos contenedores desconectados por lo que ya podemos proceder a conectarlos a la red `redje1`

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/5.3%20desconectar%20containers.jpg" style="zoom:50%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/5.4conectar%20red%20bridge.jpg" style="zoom:50%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/5.5%20conectar%20red%20bridge%20mariadb.jpg" style="zoom:67%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/5.6%20conectar%20red%20bridge%20myphp.jpg" style="zoom:67%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/5.7%20conedtado%20a%20la%20red.jpg" style="zoom: 50%;" />

##### 1.6 Creación script `modulos`, y ejecución del mismo en nuestra base de datos `DAW`

- En primer lugar debemos de crear un script SQUL, que cree una tabla `modulos`. Una vez creado este archivo, copiaremos el mismo al fichero raíz del `Contenedor_mariaDB` creado. Para ello abrimos  la terminal integrada de `Docker Desktop`, y copiamos nuestro archivo `modulos.sql`  al directorio `/var/lib/mysql`:

  ```bash
  $ docker cp C:\Users\adcor\modulos.sql Contenedor_mariaDB:/var/lib/mysql
  ```

  

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/6.1%20abro%20la%20terminal%20integrada%20en%20Docker%20Desktop.jpg" style="zoom:50%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/6.2%20copio%20el%20script%20modulos%20al%20volumen1%20del%20contenedor%20mariaDB.jpg" style="zoom:50%;" />

- A continuación, accedo al `Contenedor_mariaDB`, y en la pestaña `Exec`, accedo al contenedor y ejecuto el siguiente comando para acceder a al base de datos 

  ```bash
  mariadb -u root -p
  ```

  

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/6.3%20abrir%20terminal%20para%20acceder%20al%20contenedor%20mariaDB.jpg" style="zoom:50%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/6.4%20conexi%C3%B3n%20terminal%20al%20contenedor%20mariaDB.jpg" style="zoom:50%;" />

- A continuación, cambiamos a la base de datos `DAW` y ejecuto el script `modulos.sql`, para crear la tabla `modulos`. Para ello introducimos las siguientes instrucciones:

  ```sql
  USE DAW
  source /var/lib/mysql/moduls.squl
  ```

  <img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/6.5%20cambio%20a%20la%20base%20datos%20DAW%20y%20envio%20el%20fichero%20copiado%20a%20var.jpg" style="zoom: 67%;" />



##### 1.7 Acceso a la base de datos.

- Para comprobar que nuestra base de datos funciona correctamente, accedemos a nuestro navegador indicando `localhost:8080`, para acceder a la aplicación `phpMyAdmin`, que nos mostrará la tabla `modulos`.



<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/7.1%20acceder%20base%20datos.png" style="zoom: 50%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/7.2%20base%20de%20datos.png" style="zoom:50%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/7.3%20base%20de%20datos_1.jpg" style="zoom:50%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/7.4%20%20base%20de%20datos%20funcionando.jpg" style="zoom:50%;" />

<img src="./Tarea%20Evaluable%20Docker_ejercicio1.assets/7.5%20base%20de%20datos%20funcionando.jpg" style="zoom:50%;" />
