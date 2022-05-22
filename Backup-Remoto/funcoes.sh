#!/bin/bash

#Listar Backups que já estão salvos
function Backups_Disponiveis(){
	clear
	echo "Backups Disponíveis\n"
	ls -R /home/${USER}/Documentos/Backups
}

#Conectar no servidor SSH e realizar o backup
function Realizar_Backup(){
	clear
	format=$(date "+%d-%m-%Y")
	arquivo_backup="backup_$format.tar.gz"
	cat ips.txt
	read -p 'Escolha qual PC Deseja realizar o backup: ' pc
	user=$(cat ips.txt | grep PC-$pc | awk '{print $2}')
	ip=$(cat ips.txt | grep PC-$pc | awk '{print $3}')
	read -p 'Qual pasta você deseja fazer o backup?' pasta
	scp -r "$user@$ip:$pasta" "/home/${USER}/Documentos/Backups"
	echo "Backup Salvo em /home/${USER}/Documentos/Backups/"
}
#Cadastrar computadores disponíveis para backup
function Cadastrar_PC(){
	clear
	pcs=$(( $(wc -l < ips.txt) + 1 ))
	read -p "Digite o nome do usuário:" user
	read -p "Digite o IP do dispositivo:" ip
	echo "PC-$pcs $user $ip" >> ips.txt
	echo -e "Dispositivo $user@$ip cadastrado com sucesso!!\n"
}
#listar dispositivos disponiveis para backup
function Dispositivos_on(){
	clear
	echo -e "Dispositivos disponíveis\n"
	cat ips.txt
}

#Remover dispositivo de backup
function Remover_Dispositivo(){
	clear
	cat ips.txt
	read -p "Selecione o número do PC que você deseja remover: " pc
	sed -i $pc'd' ips.txt
        echo "PC-$pc Removido com sucesso."
}	
