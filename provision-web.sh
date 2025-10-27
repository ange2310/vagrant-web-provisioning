#!/usr/bin/env bash
# Actualizar paquetes
sudo apt-get update -y
# Instalar Apache y PHP
sudo apt-get install -y apache2 php libapache2-mod-php php-pgsql
# Habilitar Apache al inicio
sudo systemctl enable apache2
sudo systemctl start apache2
# Copiar archivos del proyecto (carpeta compartida Vagrant)
sudo cp /vagrant/index.html /var/www/html/
sudo cp /vagrant/info.php /var/www/html/
sudo cp /vagrant/db-conexion.php /var/www/html/
# Dar permisos
sudo chown -R www-data:www-data /var/www/html