# Práctica DAW: Despliegue de un Servidor Web con Vagrant y Nginx
---

## 1. Objetivo y planteamiento

Monté una máquina virtual con Vagrant, instalé Nginx automáticamente y probé que sirviera una web estática accesible desde mi navegador a través de un dominio local.

---

## 2. Preparativos y estructura básica

- **Vagrantfile**: define y levanta la VM con Ubuntu.
- **bootstrap.sh**: instala y configura todo dentro de la VM sin que yo tenga que ir comando a comando.
- Todo el proyecto está dentro de una carpeta local de mi PC.

<img src="img/Compocicion.png">
---

## 3. Configuración de la máquina virtual

La VM la hice con la box de Ubuntu. Le puse una IP privada tipo `192.168.56.10` y le asigné 2GB de RAM y 2 CPUs para que vaya fluida en las pruebas.

> **Pon aquí un pantallazo del Vagrantfile en tu editor o del contenido relevante**

---

## 4. Instalación y configuración automática

Con el provisionado de Vagrant, todo lo de instalar Nginx, crear carpetas web y configurar el sitio va en el script, así tarda menos y me aseguro que siempre va igual.

> **Pon aquí una imagen del proceso de `vagrant up` en la terminal, mostrando que todo se instala OK**

---

## 5. Ajuste del archivo hosts

Para acceder por nombre (ej. galeria.local), edité el archivo `hosts` de mi máquina para apuntar el nombre al IP privado que le puse a la VM.

- Windows: `C:\Windows\System32\drivers\etc\hosts`
- Linux/Mac: `/etc/hosts`

> **Pon aquí un pantallazo modificando tu archivo hosts**

---

## 6. Prueba final del servidor web

Levanto la máquina con `vagrant up`, abro el navegador y, al poner la dirección (ej. http://galeria.local), veo mi página estática funcionando, señal de que el servidor está desplegado y respondiendo guay.

> **Pon aquí imagen del navegador mostrando el sitio funcionando (tu index.html de prueba)**

---

## 7. Cosas aprendidas

- Va mejor automatizar todo en el script, así no se me olvida ningún paso.
- Hay que tener cuidado con la IP que se pone en Vagrant, no vale la de red (no `"192.168.56.0/24"`), tiene que ser una dirección correcta (tipo `"192.168.56.10"`).
- Editar el archivo hosts es clave para acceder por nombre local.

---

## 8. Mejoras posibles

- Añadir soporte para PHP u otros servicios web.
- Montar varios sitios virtuales con distintos dominios locales y configurarlos todos con Nginx.

---

## 9. Créditos y agradecimientos

He ido haciendo el proyecto ayudándome de las prácticas de clase, la documentación oficial de [Vagrant](https://www.vagrantup.com/) y alguna búsqueda puntual si salía un error raro.

---
