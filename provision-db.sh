#!/usr/bin/env bash

# Actualizar sistema
sudo apt-get update -y

# Instalar PostgreSQL
sudo apt-get install -y postgresql postgresql-contrib

# Configurar PostgreSQL para aceptar conexiones remotas
echo "listen_addresses = '*'" | sudo tee -a /etc/postgresql/12/main/postgresql.conf
echo "host all all 0.0.0.0/0 md5" | sudo tee -a /etc/postgresql/12/main/pg_hba.conf

# Crear base de datos y tabla con datos
sudo -u postgres psql <<EOF
CREATE DATABASE tallerdb;
\c tallerdb
CREATE TABLE estudiantes (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT,
    carrera VARCHAR(100)
);
INSERT INTO estudiantes (nombre, edad, carrera) VALUES 
('Angelica Marcillo', 20, 'Ingenieria Informatica'),
('Melanny Salguero', 21, 'Ingenieria Industrial'),
('Samuel Arredondo', 21, 'Ingenieria Mecatronica');
ALTER USER postgres PASSWORD 'vagrant123';
EOF

# Reiniciar PostgreSQL
sudo systemctl restart postgresql