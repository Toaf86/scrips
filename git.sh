#! /bin/bash


#-------scrip para minimizar uso de git en linux-----------
#version 1.0  by TONY-TOAF
#date -21-02-28
clear
echo "---------------- by TONY-TOAF----------------------------"
echo

#lista de opsiones primra instancia
for i in "1--add\n\n""2--init\n\n""3--status\n\n""4--commit"
do 
	echo $i
done
echo 
#variable de eleccion
read -p "aja una eleccion>>>>>> " eleccion
echo

#condicion add del programa
if  [ $eleccion = 1 ]; then 
	clear
	echo "add seleccionada"
	read -p "nombre de los archivos>>>>> " archivos
	read -p "cofirmar cambios (y-n)>>>>> " confirmar

	if [ $confirmar = y ]; then
		git add $archivos
		echo "archivos cofirmarmados" $archivos
		echo
		read -p "commit de los archivos>>> " commit
		git commit -m "$commit"
		echo
		echo "commit $commit confirmado con exito"
		git push
		echo "fin del programa"
		exit

	elif [ $confirmar != 1 ]; then
		clear
		echo "operacion abortada"
		exit
	
	fi


#condicional  sobre inicializacion 
elif [ $eleccion = 2 ]; then 
	clear
	git init 
	echo "git iniciado con exito"


#condicional sobre condicional status
elif [ $eleccion = 3 ]; then
	#statements
	clear
	git status
	exit


#condifcional commit 
elif [ $eleccion = 4 ]; then
		read -p "commit de los archivos>>> " commit
		git commit -m "$commit"
		echo
		echo "commit $commit confirmado con exito"
		git push
		echo "fin del programa"
		exit


fi

