#!/bin/bash

# Atualizando Sistema
apt-get update -y && apt-get upgrade -y

# Instalando utilidades
apt install wget unzip -y

# Instalando Apache2
apt install apache2 -y

# Pegando a última versão do site
cd /tmp/
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip

# Descompactando site
unzip main.zip

# Copiando arquivos de fomra recursiva
cp -rf /tmp/linux-site-dio-main/* /var/www/html/

# Removendo do TMP (Limpando)
rm -rf /tmp/linux-site-dio-main/ main.zip

# Habilitando o Apache2
systemctl enable apache2
systemctl start apache2