#!/bin/bash

#Dependências
source ./config.sh
source ./ips.txt
source ./ssh_funcs.sh
source ./funcoes.sh

#Menu Principal

while true;do
	echo -e "\nOlá, Seja bem vindo!, ${USER}!\n"
	echo "PROGRAMA DE BACKUP REMOTO"
	echo -e "Escolha uma das opções a seguir:\n"
	
	#Opções
	echo "1- Configurações SSH"
	echo "2- Selecionar Dispositivo e iniciar Processo de Backup Remoto"
	echo "3- Listar dispositivos disponíveis"
	echo "4- Adicionar dispositivo remoto para backup"
	echo "5- Remover dispositivo remoto"
	echo "6- Listar Backups Salvos"
	echo "7- Encerrar programa"

	read -p "Selecione uma opção: " opcao
	case $opcao in
		"1")	limpar_tela
			echo "a) Verificar se há um SSH instalado"
			echo "b) Instalar o SSH"
			echo "c) Verificar se o SSH está rodando"
			echo "d) Inicializar o SSH"
			echo "e) Parar o SSH"
			echo "f) Sair das configurações SSH"
			read -p "Selecione uma opção: " ssh_opt

			case $ssh_opt in
				"a"|"A") limpar_tela
				       	 verifica_ssh ;;

				"b"|"B") limpar_tela
					 instalar_ssh ;;

				"c"|"C") limpar_tela
				         verificar_ssh_status ;;

				"d"|"D") limpar_tela
				       	 iniciar_ssh ;;

				"e"|"E") limpar_tela
			                 interromper_ssh ;;

			        "f"|"F") limpar_tela
					 echo "Voltando ao MENU PRINCIPAL" ;;
		 			 
			esac
	esac
done

