#!/bin/bash

#Verificar se existe um SSH instalado no dispositivo.

function verifica_ssh(){
	echo "$(ssh -V)"
	echo "Caso apareça uma mensagem com 'OpenSSH' e sua versão..."
	echo -e "Então, o SSH está instalado. Caso contrário será necessário sua instalação"
}

#Instalar o openssh-server caso necessário

function instalar_ssh(){
	echo "$(sudo apt-get install openssh-server)" && echo
}


#Nesse comando irei executar o comando service sshd statuss para verificar o status ssh
#e irá capturar apenas a 3ª linha dele e, em seguida, irá mostrar o resultado da linha 3 e a segunda coluna com AWK na tela.

function verificar_ssh_status(){
	status="$(service sshd status | head -3 | tail -1 | awk {'print $2'})"
	if [ $status == "inactive" ]; then
	       	echo "O SSH está inativo." && echo
       	else
		if [ $status == "active" ]; then
		       	echo "O SSH está ativo." && echo
		fi
	fi
}

#Iniciar serviço ssh

function iniciar_ssh(){
	echo "$(service sshd start)"
        echo -e "O SSH foi iniciado!\n"
}

#Interromper serviço ssh

function interromper_ssh(){
	echo "$(service sshd stop)"
        echo -e "O SSH foi encerrado!\n"
}


