#!/bin/bash

#Diretório qual deseja fazer o backup
diretorio_de_backup="${HOME}"

#Diretório onde será salvo o Backup
armazenamento_backup="${HOME}/Documentos/Backups"

#Arquivo de backup
format=$(date "+%d-%m-%Y")
arquivo_backup="backup_$format.tar.gz"

#arquivo de logs
arquivo_log="/var/log/log-backup.log"



