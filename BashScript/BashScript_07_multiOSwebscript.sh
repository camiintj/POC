#!/bin/bash

#modificação do script webscript para setar a config dependendo do sistema operacional (se usa yum ou apt como pacote gerenciador)

# Declaracao de variaveis
#PACKAGE="httpd wget unzip"
#SVC="httpd"
#URL="https://www.tooplate.com/zip-templates/2137_barista_cafe.zip"
#ART_NAME="2137_barista_cafe"
TEMP_DIR="/tmp/webfiles"

yum --help &> /dev/null

if [ $? -eq 0 ]
then
	PACKAGE="httpd wget unzip"
	SVC="httpd"

	echo "CentoOS"

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

	sudo systemctl status $SVC
	ls /var/www/html/
else 
	PACKAGE="apache2 wget unzip"
        SVC="apache2"

	echo "Ubuntu"

	# Instalando dependencias 
	echo "################################"
	echo "instalando pacotes"
	echo "################################"
	sudo apt update
	sudo apt install $PACKAGE  -y > /dev/null
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

	sudo systemctl status $SVC
	ls /var/www/html/
fi

