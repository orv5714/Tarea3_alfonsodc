## Tarea Evaluable Docker - 2EV_Ejercicio_2_Docker_Compose

<div style= "background-color: rgb(165, 223, 244)">
    <p>
        Módulo: Despliegue de aplicaciones Web - Distancia
    </p>
   <p>
       Alumno: Alfonso Dapena Cores
    </p> 
    </div>




[toc]

##### 2.1 Consideraciones previas

- Filebrowser es una herramienta de gestión de archivos accesible vía web, que permite gestionar archivos dentro de un directorio específico, permitiendo subir, eliminar, previsualizar, renombrar y editar archivos directamente desde su interfaz web, donde cada usuario tiene su propio directorio asignado. Puede funcionar como una aplicación independiente para gestionar archivos de un modo sencillo y directo.  
- Docker Compose es una herramienta cuya función principal es la de simplificar la configuración y ejecución de los contenedores mediante un único archivo de configuración en formato YAML. En este archivo describiremos los servicios, redes y volúmenes necesarios para que nuestra aplicación funcione correctamente, facilitando la orquestación de contenedores. Aunque también se puede usar para crear y ejecutar un único contenedor con un único servicio, lo que ayuda a simplificar la configuración y automatización del servicio.

##### 2.2 Descripción fichero `yaml`

-  En primer lugar, antes de preparar el escenario donde vamos a ejecutar nuestro fichero `yaml`, debemos explorar la imagen `Filebrownser`, en nuestra aplicación Docker Desktop:

<img src="./Tarea%20Evaluable%20Docker_2.assets/0.1%20examinar%20imagen%20.jpg" style="zoom:50%;" />

- En la documentación, hallamos un ejemplo del fichero `yaml` que vamos a ejecutar

<img src="./Tarea%20Evaluable%20Docker_2.assets/0.2%20examinar%20imagen2.jpg" style="zoom:50%;" />

- Descripción del fichero:
  1. La sección `version` es informativa y nos indica la versión con la que vamos a trabajar, en este caso la `version: "3"`, que está diseñada para ser compatible con el modo Swarm de Docker, que incluye características específicas para orquestación en clústeres. 
  2. La sección `services`, especifica los servicios que vamos a crear, en este caso, crearemos el servicio al que hemos denominado `filebrowser`, que representará a un contenedor. Dentro del servicio, indicaremos la imagen en la que se va a basar nuestro contenedor: `hurlenko/filebrowser`. También definiremos el usuario `user`, y el puerto a través del que nuestra aplicación será accesible `ports`. Indicaremos, además, los volúmenes `volumes`, donde guardaremos la documentación de manera persistente, relativa a los ficheros que queremos subir a nuestra aplicación, así como la configuración del servicio. En el apartado `environment`, declararemos  la `URL` para acceder a `Filebrowser`. Y, por último, en la sección `restart`, definiremos la política de reinicio: si el contenedor por cualquier motivo se para le indicaremos que intente reiniciarse cada vez que pueda.
  3. Por último, con la instrucción `docker-compose up`( para versiones Docker Compose 1), `docker compose up`(para versiones Docker Compose 2), creamos el contenedor.

##### 2.3 Creación fichero `yaml`

- En primer lugar, crearemos el directorio denominado `Filebrowser`, donde desplegaremos nuestro escenario Docker Compose. Dentro del mismo, creamos el directorio `data` donde vamos a almacenar los ficheros que vamos subir a nuestra aplicación `data`, y el directorio `config`, donde guardaremos la configuración de nuestra aplicación:

  ```bash
  $ mkdir Filebrowser
  $ mkdir data
  $ mkdir config
  ```

  

<img src="./Tarea%20Evaluable%20Docker_2.assets/1.1%20Primero%20creo%20el%20directorio-1744568229341-19.jpg" style="zoom: 67%;" />

![](./Tarea%20Evaluable%20Docker_2.assets/1.2Creo%20los%20directorios%20data%20y%20config,%20donde%20se%20guardaran%20los%20datos%20y%20las%20configuraciones-1744568301296-21.jpg)



- Una vez hemos creado los directorios, debemos crear el usuario principal de la aplicación y asignarle los permisos necesarios. Después consutaremos el `uid` y el `gid` del `user` admin, que debemos indicar en el fichero `yaml`:

```bash
$ sudo useradd -m -s /bin/bash admin
$ sudo chown -R admin:admin /home/adcorescliente/Filebrowser/data
$ sudo chown -R admin:admin /home/adcorescliente/Filebrowser/config
$ id admin


```

![](./Tarea%20Evaluable%20Docker_2.assets/1.3Creo%20el%20usuario%20admin-1744568654095-29.jpg)

<img src="./Tarea%20Evaluable%20Docker_2.assets/1.4Le%20doy%20permisos%20para%20los%20directorios%20data%20y%20config-1744568662728-31.jpg" style="zoom:67%;" />

![](./Tarea%20Evaluable%20Docker_2.assets/1.5%20saco%20los%20uid%20y%20gid%20del%20usuario%20admin-1744568676943-33.jpg)

-  Después, creamos un fichero `compose.yaml`, y con el editor `nano`, configuramos el archivo que ejecutaremos a continuación. Por último comprobaremos que nuestro contenedor está ejecutándose:

  ```bash
  $ touch compose.yaml
  $ nano compose. yaml
  $ docker compose up -d #con esta instrucción creamos el contenedor.
  $ docker ps
  ```

  ![](./Tarea%20Evaluable%20Docker_2.assets/5.1%20creo%20el%20fichero%20compose%20y%20lo%20edito-1744568810409-35.jpg)

  <img src="./Tarea%20Evaluable%20Docker_2.assets/5.2%20fichero%20compose-1744568821557-37.jpg" style="zoom:67%;" />

  <img src="./Tarea%20Evaluable%20Docker_2.assets/6%20Ejecuto%20la%20instrucci%C3%B3n%20compose%20up-1744568837737-39.jpg" style="zoom: 67%;" />

  <img src="./Tarea%20Evaluable%20Docker_2.assets/5.4%20comprobar%20ejecuci%C3%B3n%20contenedor-1744568858654-41.jpg" style="zoom:80%;" />

  

##### 2.4 Acceso a la aplicación

- A continuación, accedemos nuestro navegador e introduciremos la dirección http://localhost:443/filebrowser, que nos abrirá la pantalla principal de la aplicación, donde, tras logearemos, comprobaremos que todavía no hemos subido ningún fichero.

  <img src="./Tarea%20Evaluable%20Docker_2.assets/6.1%20hago%20login%20filebrowser-1744568950055-43.jpg" style="zoom:50%;" />

  <img src="./Tarea%20Evaluable%20Docker_2.assets/6.2%20compruebo%20filebrowser-1744568961264-45.jpg" style="zoom:50%;" />

  

- Regresamos nuevamente a nuestro directorio `/Filebrowser/data`  y creamos varios ficheros, editando el `ficheroprueba2.txt`, para añadir el texto "Hola, me llamo alfonso":

  ```bash
  $ sudo touch ficheroprueba.txt
  $ sudo touch fichero.txt
  $ sudo touch ficheroprueba2.txt
  $ sudo nano ficheroprueba2.txt
  ```

  <img src="./Tarea%20Evaluable%20Docker_2.assets/7.1creo%20varios%20ficheros-1744569194227-51.jpg" style="zoom:80%;" />

  <img src="./Tarea%20Evaluable%20Docker_2.assets/7.2creo%20el%20fichero%20de%20prueba2-1744569207065-53.jpg" style="zoom:50%;" />

  

- A continuación, abrimos de nuevo el navegador e introducimos la dirección  http://localhost:443/filebrowser, que nos lleva a la pantalla principal de la aplicación, y, tras logearemos, comprobaremos que se ha subido los ficheros correctamente a la aplicación:

  

  <img src="./Tarea%20Evaluable%20Docker_2.assets/8.1%20me%20conecto%20nuevamente%20a%20filebrowser%20en%20el%20navegador-1744569265826-55.jpg" style="zoom:50%;" />

  <img src="./Tarea%20Evaluable%20Docker_2.assets/8.2%20compruebo%20archivos%20de%20filebrowser-1744569276495-57.jpg" style="zoom:50%;" />

  <img src="./Tarea%20Evaluable%20Docker_2.assets/8.3%20abro%20uno%20de%20los%20ficheros-1744569286764-59.jpg" style="zoom: 67%;" />

