#!/bin/bash/

#quando em execução, o apache gera um código nesse arquivo httpd.pid. quando não está em execução, esse arquivo nao existe.

# $? retorna 0 se o comando deu certo e retorna algum numero quando o comando está/deu errado. então, ao tentar abrir o arquivo pid, se ele nao existir, $? trará um numero diferente de 0 como retorno

# -f verificar se o arquivo existe

echo "###################################"
date
#ls /var/run/httpd/httpd.pid &> /dev/null

#if [ $? -eq 0 ]
if [ -f /var/run/httpd/httpd.pid ]
then
        echo "Httpd process is running"
else
        echo "Httpd is not running"
        echo "starting the process"
        echo "###################################"
        systemctl start httpd
        if [ $? -eq 0 ]
        then
                echo "Httpd started successfully"
        else
                echo "Httpd starting failed"
        fi
        echo "###################################"
fi
~        
