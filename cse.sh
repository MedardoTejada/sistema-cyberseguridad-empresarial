#!/bin/bash

while true; do
clear
      echo "Seleccione 1: Para escanear la pagina web de su negocio"
      echo "Seleccione 2: Para escanear todos los ip conectados a la red de su empresa"
      echo "Seleccione 3: Para detectar puertos abiertos en alguna maquina de su empresa"
      echo "Seleccione 4: Para realizar un escaneo de algun telefono de tu empresa"
      echo "Seleccione 5: Para generar un reporte de los analisis realizados"
    
    read -p ":" op
    case $op in
        [1]* ) 
         clear
            echo "***********************************************"
            echo "**********   SCANNEAR MI SITIO WEB   **********"
            echo "***********************************************"
            echo ""
            

            echo 'introduzca la url de su sitio web para que la analizemos y luego presione la tecla ENTER: '
           

             read variable_web
             wpscan --url $variable_web     
         echo ''
         read variable_stop
        ;;

        
        
        [2]* ) 
         clear
            echo "**************************************************************"
            echo "**********   IP CONECTADOS A LA RED DE SU EMPRESA   **********"
            echo "**************************************************************"
            echo ""
            netstat -rn
            echo "Paso 1: copie la ip que se encuentra debajo de la columna >>Destination<<"
            echo 'Pegue la ip copiada justo en esta linea y presione >>ENTER<<: '
            read variable_SubRed
            echo ""
            echo "Escaneando..."
             nmap -sP $variable_SubRed/24 -oG - | awk '/Up$/{print $2}'
            echo ""
            echo "Listo!, Estas son todas las IP conectadas a la red de su Empresa"
            echo "Le recomendamos hacer un inventario de IP de las maquinas que tenga conectada a red en su empresa."
         echo ''
         read variable_stop
        ;;

        [3]* )
        clear
            echo "*****************************************************"
            echo "**********   DETECCION DE PUERTOS ABIERTOS **********"
            echo "*****************************************************"
            echo ""
            echo 'Escriba la IP del dispositivo que desea analizar: '
            read variable_puertos
            echo ""
            echo "Escaneando..."
             nmap -sV $variable_puertos
             
            echo ""
            echo "Listo!, dispositivo con ip " $variable_puertos "escaneado correctamente"
            echo "Le recomendamos dar una revision de todos los puertos listados en el reporte"
         echo ''
         read variable_stop

        ;;
        [4]* ) 
         clear
            echo "******************************************************"
            echo "**********   ESCANEAR TELEFONO EMPRESARIAL  **********"
            echo "******************************************************"
            echo ""
          echo 'Escriba el numero de telefono de su empresa, recuerda poner la extension >> +507 << seguido del numero SIN espacios: '
            read variable_telefono

            sudo python3 phoneinfoga.py -n $variable_telefono
            echo ""
            echo "Listo!, el telefono con numero " $variable_telefono " ha sido escaneado correctamente"
            echo "Le recomendamos dar revisar que todos los datos esten correctamente"
         echo ''
         read variable_stop

        ;;

        [5]* ) echo "Opción Seleccionada 5 !"; break;;        
        * ) echo "Seleccione una Opción de 1 a 5.";;
    esac
done