#!/bin/bash

#Dependências
source ./ssh_funcs.sh
source ./funcoes.sh

#Menu Principal

while true;do
	echo -e "\nOlá, Seja bem vindo!, ${USER}!\n"
	echo "PROGRAMA DE BACKUP REMOTO"
	echo -e "Escolha uma das opções a seguir:\n"
	
	#Opções
	echo "1- Mensagem de Boas vindas"
	echo "2- Selecionar Dispositivo e iniciar Processo de Backup Remoto"
	echo "3- Listar dispositivos disponíveis"
	echo "4- Adicionar dispositivo remoto para backup"
	echo "5- Remover dispositivo remoto"
	echo "6- Listar Backups Salvos"
	echo "7- Encerrar programa"

	read -p "Selecione uma opção: " opcao
	case $opcao in

		"1") limpar_tela
		     echo 'Tu és time de tradição, raça, amor e paixão. Oh, meu Mengo!';;
		"2") limpar_tela
		     Realizar_Backup;;
	     	"3") Dispositivos_on;;
		"4") Cadastrar_PC;;
		"5") Remover_Dispositivo;;
		"6") Backups_Disponiveis;;
		"7") echo 'Programa finalizado com sucesso.'
		     break;;
	esac
done

