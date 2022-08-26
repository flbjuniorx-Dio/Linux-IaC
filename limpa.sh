#!/bin/bash

. variaveis.txt

echo "Removendo diretórios..."
for FOLDER in ${FOLDERS[@]}; do
	rmdir /$FOLDER;
done

echo "Apagando grupos..."
for GRUPO in ${GRUPOS[@]}; do
	groupdel $GRUPO;
done

echo "Apagando usuários..."
for USER in ${USERS[@]}; do 
    userdel -r $USER
done
