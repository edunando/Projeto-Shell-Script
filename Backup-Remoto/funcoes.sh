#!/bin/bash

#Listar Backups que já estão salvos
function Backups_Disponiveis(){
	clear
	echo "Backups Disponíveis"
	ls "${PWD}/Backups/"
}

#Conectar no computador cliente via SCP e realizar o backup
function Realizar_Backup(){
	clear
	format=$(date +"%F-%H%M%S")
	arquivo_backup="backup_$format.tar.gz"
	cat ips.txt
	read -p 'Escolha qual PC Deseja realizar o backup: ' pc
	user=$(cat ips.txt | grep PC-$pc | awk '{print $2}')
	ip=$(cat ips.txt | grep PC-$pc | awk '{print $3}')
	read -p 'Qual pasta você deseja fazer o backup?' pasta
	mkdir "${PWD}/Backups/PC-$pc/$(basename $pasta)" &> /dev/null
	scp -r "$user@$ip:$pasta" "${PWD}/Backups/PC-$pc/$(basename $pasta)"
	tar -czvf $arquivo_backup "${PWD}/Backups/PC-$pc/$(basename $pasta)/$(basename $pasta)"
	clear
	rm -rf "${PWD}/Backups/PC-$pc/$(basename $pasta)/$(basename $pasta)"
	cp $arquivo_backup "./Backups/PC-$pc/$(basename $pasta)"
	rm $arquivo_backup
	echo "Backup Salvo em ${PWD}/Backups/PC-$pc/$(basename $pasta)"
	echo ""
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
