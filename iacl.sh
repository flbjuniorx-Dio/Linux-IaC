#!/bin/bash

. variaveis.txt

echo "Criando diretórios..."
for FOLDER in ${FOLDERS[@]}; do
	mkdir /$FOLDER;
	if [ $FOLDER = "publico" ]; then
		chmod 777 /$FOLDER
	else
		chmod 770 /$FOLDER
	fi
done

echo "Criando grupos..."
for GRUPO in ${GRUPOS[@]}; do
	groupadd $GRUPO;
	if [ $GRUPO = "GRP_ADM" ]; then
		chown root:$GRUPO /adm;
	elif [ $GRUPO = "GRP_VEN" ]; then
		chown root:$GRUPO /ven;
	elif [ $GRUPO = "GRP_SEC" ]; then
		chown root:$GRUPO /sec;
	fi

done

echo "Criando usuários..."
for USER in ${USERS[@]}; do 
    useradd -p $(openssl passwd Senha123) -s /bin/bash -m $USER
done

echo "Atribuindo grupos..."
for ADM_USER in ${GROUPADM[@]}; do
       usermod -G GRP_ADM $ADM_USER
done
for VEN_USER in ${GROUPVEN[@]}; do
       usermod -G GRP_VEN $VEN_USER
done

for SEC_USER in ${GROUPSEC[@]}; do
       usermod -G GRP_SEC $SEC_USER
done
