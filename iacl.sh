#!/bin/bash

. users.txt
. grupos.txt
. diretorios.txt

echo "Criando diretórios..."
for FOLDER in ${FOLDERS[@]}; do
	echo "dir $FOLDER";
	echo "chmod 770 $FOLDER";
done

echo "Criando grupos..."
for GRUPO in ${GRUPOS[@]}; do
	echo "groupadd $GRUPO";
	echo "chown root:$GRUPO
done

echo "Criando usuários..."
for USER in ${USERS[@]}; do 
    useradd $USER -m -s /bin/bash -p $(openssl passwd -crypt Senha123)
    if [($USER = "carlos") OR ($USER = "maria") OR ($USER = "joao")]; then
	    echo "usermod -G GRP_ADM $USER"
    elif [($USER = "debora") OR ($USER = "sebastiana") OR ($USER = "roberto")]; then
	    echo "usermod -G GRP_VEN $USER"
    elif [($USER = "josefina") OR ($USER = "amanda") OR ($USER = "rogerio")]; then
	    echo "usermod -G GRP_SEC $USER"
    fi
done


