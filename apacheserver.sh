#!/bin/bash
#acrips para optimizar la  creacion de servidors apache
clear
echo 'SERVIDORES APACHE V1, BY TOAF86'
echo 
for i in "1..New Folder" "2..New File"
do
    echo $i
done
read -p "Eleccion>>>>> " elect
newfolder(){   #creacion de carpeta
   
    clear
    echo "creando numero servidor apache local"
    echo
    echo
    echo "nombre de la carpeta de /var/www"
    read -p "Nombre Carpeta>>>>>>> " ncarpeta
    sudo mkdir /var/www/$ncarpeta
    echo "se creo la carpeta en /var/www"
    ls -la /var/www
    echo 
    read -p "crear index (true, false)>>>> " continue

} 
newindex(){   #creacion de archivo index de var/www
    echo "nombre del archivo index"
    read -p "Nombre archivo index>>>>>>> " nindex
    sudo touch /var/www/$nindex
    echo "se creo el archivo index en /var/www/$nindex"
    ls -la /var/www/$nindex
    echo 
    read -p "editar index file (true, false)>>>> " continue

} 
editionfileindex(){#edicion de archivos index
    sudo gedit /var/www/$nindex
    echo "archivo index editado con exito"
    echo "cambios guardados"
    read -p "crear archivo .conf (y or no)>>> " continue

}

confcreateconf(){ #creacion del achivo conf
    echo "nombre del archivo conf de /etc/apache2/sites-available"
    read -p "Nombre Carpeta>>>>>>> " fileconf
    sudo mkdir /var/www/$fileconf
    echo "se creo el archivo .confpeta en /etc/apache2/sites-available/"
    ls -la /etc/apache2/sites-available
    echo 
    read -p "agnadir archivo a servidor a2ensite (true, false)>>>> " continue

}
addfitoa2enside(){ #funcin agnadir archivo con a2ensite
    echo "agnadiendo archivo con a2ensite"
    ls -la /etc/apache2/sites-available
    echo 
    read -p "Nombre del archivo>>>>> " nfile
    sudo a2ensite $nfile
    echo "se actualizo el documento"
    echo 
    read -p "actualizar host (true, false)>>>> " continue
}
hostsedition(){ #funcion para editar el host
    clear
    echo "editar el host, agnadir el proxi"
    sudo gedit /etc/hosts
    echo 
    echo "hosts actualizado"
    echo 
    read -p "actualiar apache2 (true, false)>>>> " continue

}
updateapache(){ #actualizacion de apache
    echo "recargando el apache2"
    echo
    sudo systemctl apache2 reload
    echo "apache2 actualizado"
    exit
}

#parte de los condicionales
if [ $elect = 1 ]; then #folder creator and call to funtions 
    newfolder
    if [ $continue = true]; then 
         newindex
         if [ $continue = true ]; then 
            editionfileindex
             if [ $continue = true ]; then 
                confcreateconf
                if [ $continue = true ]; then 
                    addfitoa2enside
                    if [ $continue = true ]; then 
                        hostsedition
                        if [ $continue = true ]; then 
                            updateapache
                         fi
                    fi
                
                fi
             fi
         fi

    else
        echo "finishing program"

    fi

    


fi