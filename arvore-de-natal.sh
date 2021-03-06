#!/bin/bash

#--------------------------------------------------
# Data: 24 de Dezembro de 2016
# Script: arvore-de-natal.sh
# Criado por: Juliano Santos [SHAMAN]
# Página: http://www.shellscriptx.blogspot.com.br
# Fanpage: https://www.facebook.com/shellscriptx
#--------------------------------------------------

# Arquivo contendo os códigos da árvore de natal.
ARVORE="$PWD/cod-arvore.txt"

# Nome do script
SCRIPT=$(basename $0)

# Verifica as dimensões da janela.
if [ $(tput cols) -lt 62 -o $(tput lines) -lt 47 ]; then
	echo "$SCRIPT: ajuste o tamanho da janela" 
	echo 'Mínimo: 62x47'
	exit 1
elif [ ! -e "$ARVORE" ]; then
	echo "$SCRIPT: nenhuma árvore de natal foi encontrada."
	exit 1
fi

# As coordenadas 'x' e 'y' de cada lâmpada.
X=(38 34 30 26 22 42 38 34 30 26 22 18 14 47 43 39 35 31 27 23 19 15 11 49 45 41 37 33 29 25 21 17 14 9 5 49 45 41 37 33 29 25)
Y=(7 8 9 10 11 12 13 14 15 16 17 18 19 15 16 17 18 19 20 21 22 23 24 21 22 23 24 25 26 27 28 29 30 31 32 28 29 30 31 32 33 34)

# Status da lâmpada. 'ligado' e 'desligado'
LAMPADAS=('\033[8;41m \033[0;m' '\033[0;m ')
# Total de lâmpadas
TOTAL=$((${#X[@]}-1))

# Define fundo branco
tput setb 7; clear

# Desenha a árvore de natal, inserindo a mensagem no rodapé.
echo -e '\t\t  FELIZ NATAL E BOAS FESTAS !!!' | cat $ARVORE -

# Mantém animação de iluminação.
while :
do
	# Lê as lâmpadas.
	for POS in $(seq 0 $TOTAL)
	do
		# Aplica o status
		tput cup ${Y[$POS]} ${X[$POS]}
		# Alterna entre os status da lâmpada aleatoriamente criando um efeito pisca-pisca.
		echo -e "${LAMPADAS[$(($RANDOM%2))]}"
	done
	# Intervalo 
	sleep 0.5
	#done
done
#FIM
