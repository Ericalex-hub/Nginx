# Práctica DAW: Despliegue de un Servidor Web con Vagrant y Nginx

## 1. Objetivo y planteamiento

Monté una máquina virtual con Vagrant, instalé Nginx automáticamente y probé que sirviera una web estática accesible desde mi navegador a través de un dominio local.


## 2. Preparativos y estructura básica

- **Vagrantfile**: define y levanta la VM con Ubuntu.
- **bootstrap.sh**: instala y configura todo dentro de la VM sin que yo tenga que ir comando a comando.
- Todo el proyecto está dentro de una carpeta local de mi PC.

<img src="img/Organización.png">

## 3. Configuración de la máquina virtual

La VM la hice con la box de Ubuntu. Le puse una IP privada tipo `192.168.56.10` y le asigné 2GB de RAM y 2 CPUs para que vaya fluida en las pruebas.

<img src="img/Compocicion.png">


## 4. Instalación y configuración automática

Con el provisionado de Vagrant, todo lo de instalar Nginx, crear carpetas web y configurar el sitio va en el script, así tarda menos y me aseguro que siempre va igual.

<img src="img/Available-1.png">
<img src="img/Comprobacion-servidor.png">
<img src="img/Available-2.png">
<img src="img/Comprobacion-servidor.png">

## 5. Ajuste del archivo hosts

Para acceder por nombre (ej. page.local), edité el archivo `hosts` de mi máquina para apuntar el nombre al IP privado que le puse a la VM.

- Windows: `C:\Windows\System32\drivers\etc\hosts`
- Linux/Mac: `/etc/hosts`

<img src="img/Hosts.png">

# Práctica DAW: Despliegue de un servidor web con Vagrant y Nginx 2

## 1. Objetivo y planteamiento

He echo que la web pida usuario y contraseña antes de dejar entrar a cualquiera, pidiendo credenciales y, si no se pone bien, no se puede ver la página. Así, solo los usuarios registrados pueden acceder a esta página

<img src="img/Registro.png">

## 2. Preparando usuarios para Nginx

Primero creé un archivo donde van los usuarios y las contraseñas cifradas. Añadí dos usuarios, uno con mi nombre y otro con mi primer apellido junto con una contraseña para cada uno. Luego revisé que estuvieran bien guardadas con el cat.

## 3. Cómo dejé mi Nginx

Acontinuación fui al archivo donde se configura mi página y le puse el aviso de zona restringida. También le dije al servidor dónde tiene que mirar los usuarios válidos. Así, cualquier ruta pide la autenticación antes de cargar la web.

![Config Nginx](img/Configuración-Servidor.png)

## 4. Activando la autenticación y probando

Activé la config en Nginx, recargué para que cogiera los cambios y probé desde el navegador. Ahora siempre me pide el usuario y la clave. Al ponerlo bien, me deja entrar, y si lo fallo, o cancelo, no puedo ver la web. Puse capturas del funcionamiento.

Cancelar registro:
<img src="img/Cancelar-Registro.png">

Registro equivocado:
<img src="img/Registro-Incorrecto.png">

Registro correcto y vista de página:
<img src="img/Vista-Página.png">

# Acceso seguro con Nginx (HTTPS)

## 1. ¿Qué he hecho?

En esta tercera parte he pasado mi web de ir en “http normal” a ir por **https** usando un certificado autofirmado. La idea es que el tráfico entre el navegador y el servidor vaya cifrado, aunque el certificado no sea “oficial” de una autoridad de confianza.

<img src="img/Entrada-pagina.jpg">

## 2. Preparando el certificado

Para poder activar HTTPS primero generé una pareja de clave y certificado. Usé `openssl` para crear una clave privada y un certificado autofirmado válido un año. En los datos que me pide el comando rellené país, ciudad y compañía, y sobre todo puse mi dominio (`example.test`) en el campo de *Common Name*, que es lo que hace que el navegador lo relacione con mi web.

<img src="img/Configuracion-Certificado.jpg">

## 3. Activando HTTPS en Nginx

Después edité la configuración de mi sitio en Nginx. Añadí los `listen` en el puerto 443 con `ssl`, puse el `server_name` con mi dominio con y sin `www`, y apunté Nginx a los archivos del certificado y de la clave que había generado antes. También dejé configurado el `root` y el `index` como en las prácticas anteriores para que cargara la misma web, pero ahora por HTTPS.

<img src="img/Configuracion-servidor3.jpg">

## 4. Cortafuegos con soporte para HTTPS

Como tenía ufw instalado, lo ajusté para que dejara pasar el tráfico HTTPS. Le permití el perfil “Nginx Full” y me aseguré de que el cortafuegos quedaba activo. Al volver a mirar el estado, vi que estaba en `active` y que aparecían las reglas para Nginx y para SSH, así que ya se podía acceder a mi servidor por el puerto 443 sin problema.

<img src="img/Estado-ufw.jpg">

## 5. Prueba desde el navegador

Por último probé a entrar a mi web usando `https://example.test`. El navegador me sacó un aviso de que la conexión no es privada porque el certificado no está firmado por una autoridad reconocida, pero eso es normal en los certificados autofirmados. Desde el botón de “Avanzado” continué igualmente y se cargó mi página estática, ahora servida de forma segura con HTTPS.

<img src="img/Alerta-peligrosa.jpg">
