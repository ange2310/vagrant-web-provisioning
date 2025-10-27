# Taller Vagrant - Provisionamiento con Shell Scripts

## Autor
Angelica Maria Marcillo Alba - 2025

## Descripción
Taller de Vagrant que implementa dos máquinas virtuales con provisionamiento automático:
- **web**: Servidor Apache con PHP (192.168.56.10)
- **db**: Servidor PostgreSQL con base de datos (192.168.56.11)

## Instalación

### Requisitos Previos
- Vagrant instalado
- VirtualBox instalado
- Git instalado

### Pasos de Instalación

1. **Clonar el repositorio:**
```bash
git clone https://github.com/ange2310/vagrant-web-provisioning.git
cd vagrant-web-provisioning
```

2. **Levantar las máquinas virtuales:**
```bash
vagrant up web
vagrant up db
```

3. **Acceder a la aplicación desde el navegador:**
- Página principal: http://192.168.56.10
- Info PHP: http://192.168.56.10/info.php
- Conexión a Base de Datos: http://192.168.56.10/db-conexion.php

## Estructura del Proyecto
```
vagrant-web-provisioning/
├── Vagrantfile              # Configuración de las máquinas virtuales
├── provision-web.sh        # Script de provisionamiento del servidor web
├── provision-db.sh         # Script de provisionamiento de la base de datos
├── index.html              # Página principal
├── info.php                # Información del servidor PHP
├── db-conexion.php         # Conexión y consulta a PostgreSQL
└── README.md               # Documentación
```

## Scripts de Provisionamiento

### provision-web.sh
Este script provisiona la máquina web:
- Actualiza el sistema
- Instala Apache2
- Instala PHP y el módulo PostgreSQL (php-pgsql)
- Copia los archivos web (index.html, info.php, db-conexion.php) a /var/www/html
- Configura permisos
- Inicia Apache

### provision-db.sh
Este script provisiona la máquina de base de datos:
- Actualiza el sistema
- Instala PostgreSQL
- Configura PostgreSQL para aceptar conexiones remotas
- Crea la base de datos "tallerdb"
- Crea la tabla "estudiantes" con 3 registros de ejemplo
- Configura la contraseña del usuario postgres

## Configuración de las Máquinas

| Máquina | IP            | Sistema Operativo | Servicios        |
|---------|---------------|-------------------|------------------|
| web     | 192.168.56.10 | Ubuntu 20.04      | Apache, PHP      |
| db      | 192.168.56.11 | Ubuntu 20.04      | PostgreSQL       |

## Base de Datos

**Nombre:** tallerdb

**Tabla:** estudiantes

| Campo   | Tipo         |
|---------|--------------|
| id      | SERIAL       |
| nombre  | VARCHAR(100) |
| edad    | INT          |
| carrera | VARCHAR(100) |

**Datos de ejemplo:**
- Angelica Marcillo, 20, Ingenieria Informatica
- Melanny Salguero, 21, Ingenieria Industrial
- Samuel Arredondo, 21, Ingenieria Mecatronica

### Página Principal (index.html)
La página principal muestra un mensaje de bienvenida personalizado.

### Información PHP (info.php)
Página que muestra información del servidor PHP.

### Conexión a Base de Datos (db-conexion.php)
Página que se conecta a PostgreSQL y muestra la tabla de estudiantes.

## Comandos Útiles de Vagrant
```bash
# Ver estado de las máquinas
vagrant status

# Conectarse por SSH
vagrant ssh web
vagrant ssh db

# Detener las máquinas
vagrant halt

# Reiniciar las máquinas
vagrant reload

# Reprovisionar (ejecutar scripts de nuevo)
vagrant provision web
vagrant provision db

# Destruir las máquinas
vagrant destroy
```


Para verificar que todo funciona correctamente:

1. Ejecuta `vagrant status` - ambas máquinas deben estar "running"
2. Accede a http://192.168.56.10 - debe mostrar la página de bienvenida
3. Accede a http://192.168.56.10/info.php - debe mostrar información de PHP
4. Accede a http://192.168.56.10/db-conexion.php - debe mostrar "Conexion exitosa" y la tabla con 3 estudiantes

