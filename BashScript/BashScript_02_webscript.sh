#!/bin/bash

# Declaracao de variaveis
PACKAGE="httpd wget unzip"
SVC="httpd"
#URL="https://www.tooplate.com/zip-templates/2137_barista_cafe.zip"
#ART_NAME="2137_barista_cafe"
TEMP_DIR="/tmp/webfiles"

# Instalando dependencias 
echo "################################"
echo "instalando pacotes"
echo "################################"
sudo yum install $PACKAGE  -y > /dev/null
echo

# Iniciando e habilitando serviço
echo "################################"
echo "Iniciando e habilitando HTTPD"
echo "################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Configurando diretório temporario
echo "################################"
echo "Pasta Temporaria"
echo "################################"
mkdir -p $TEMP_DIR
cd $TEMP_DIR
echo

echo "################################"
echo "Download e descompactação template"
echo "################################"
wget $1 > /dev/null
unzip $2.zip  > /dev/null
sudo cp -r $2/* /var/www/html/
echo

echo "################################"
echo "Reiniciando serviço e apagando pasta temp"
echo "################################"
sudo systemctl restart $SVC
rm -rf $TEMP_DIR

