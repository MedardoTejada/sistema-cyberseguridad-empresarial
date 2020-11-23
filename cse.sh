#!/bin/bash

op=`zenity --width=800 --height=300 --list --title="MENU PRINCIPAL" --text "BIENVENIDO AL MENU PRINCIPAL DEL SISTEMA EMPRESARIAL DE CIBERSEGURIDAD" --column "Seleccione una opcion" "1: Realizar un escaneo completo de su pagina web" "2: Escanear y mostrar el ip de todos los dispositivos encontrados en su red" "3: Escanear y mostrar todos los puertos abiertos de algun dispositivo de su empresa" "4: Mostrar la ubicacion de algun telefono de su empresa" "5: Salir del sistema"`


while true; do
     clear
     
   
    case $op in
        ["1: Realizar un escaneo completo de su pagina web"]* ) 
         clear
            echo "***********************************************"
            echo "**********   SCANNEAR MI SITIO WEB   **********"
            echo "***********************************************"
            echo ""
            
            variable_web=`(zenity --entry --title="Escaneando Sitio web de la empresa" \
--text "Introduzca la url de su sitio web para que la analizemos")`
           
             wpscan --url $variable_web     
         echo ''
         read variable_stop
        ;;

        
        
        ["2: Escanear y mostrar el ip de todos los dispositivos encontrados en su red"]* ) 
         clear
            echo "**************************************************************"
            echo "**********   IP CONECTADOS A LA RED DE SU EMPRESA   **********"
            echo "**************************************************************"
            echo ""
            netstat -rn
            
            
             variable_SubRed=`(zenity --entry --title="Escaneando Sitio web de la empresa" \
--text "Escriba la ip que se encuentra en la columna <Destination> (en caso de que hayan dos, ignorar la que empieze con <0>)")`
            
           
         
            echo ""
            echo "Escaneando..."
             nmap -sP $variable_SubRed/24 -oG - | awk '/Up$/{print $2}'
            echo ""
            echo "Listo!, Estas son todas las IP conectadas a la red de su Empresa"
            echo "Le recomendamos hacer un inventario de IP de las maquinas que tenga conectada a red, y estar alerta ante cualuqiera IP sospechosa."
         echo ''
         read variable_stop
         op=`zenity --width=800 --height=300 --list --title="MENU PRINCIPAL" --text "BIENVENIDO AL MENU PRINCIPAL DEL SISTEMA EMPRESARIAL DE CIBERSEGURIDAD" --column "Seleccione una opcion" "1: Realizar un escaneo completo de su pagina web" "2: Escanear y mostrar el ip de todos los dispositivos encontrados en su red" "3: Escanear y mostrar todos los puertos abiertos de algun dispositivo de su empresa" "4: Mostrar la ubicacion de algun telefono de su empresa" "5: Salir del sistema"`


        ;;

        ["3: Escanear y mostrar todos los puertos abiertos de algun dispositivo de su empresa"]* )
        clear
            echo "*****************************************************"
            echo "**********   DETECCION DE PUERTOS ABIERTOS **********"
            echo "*****************************************************"
            echo ""
            variable_puertos=`(zenity --entry --title="Escaneando Sitio web de la empresa" \
--text "Escriba la ip del dispositivo que desea escanear")`
          
            echo ""
            echo "Escaneando..."
             nmap -sV $variable_puertos
             
            echo ""
            echo "Listo!, dispositivo con ip " $variable_puertos "escaneado correctamente"
            echo "Le recomendamos dar una revision de todos los puertos listados en el reporte"
         echo ''
         read variable_stop
          op=`zenity --width=800 --height=300 --list --title="MENU PRINCIPAL" --text "BIENVENIDO AL MENU PRINCIPAL DEL SISTEMA EMPRESARIAL DE CIBERSEGURIDAD" --column "Seleccione una opcion" "1: Realizar un escaneo completo de su pagina web" "2: Escanear y mostrar el ip de todos los dispositivos encontrados en su red" "3: Escanear y mostrar todos los puertos abiertos de algun dispositivo de su empresa" "4: Mostrar la ubicacion de algun telefono de su empresa" "5: Salir del sistema"`


        ;;
        ["4: Mostrar la ubicacion de algun telefono de su empresa"]* ) 
         clear
            echo "******************************************************"
            echo "**********   ESCANEAR TELEFONO EMPRESARIAL  **********"
            echo "******************************************************"
            echo ""

            variable_telefono=`(zenity --entry --title="TELEFONO EMPRESARIAL" \
--text "INGRESE EL NUMERO DE TELEFONO (importante agregar la extension < +507 > seguido del numero pegado.)")`
         
        

            sudo python3 phoneinfoga.py -n $variable_telefono
            echo ""
            echo "Listo!, el telefono con numero " $variable_telefono " ha sido escaneado correctamente"
            echo "Le recomendamos dar revisar que todos los datos esten correctamente"
         echo ''
         read variable_stop
        op=`zenity --width=800 --height=300 --list --title="MENU PRINCIPAL" --text "BIENVENIDO AL MENU PRINCIPAL DEL SISTEMA EMPRESARIAL DE CIBERSEGURIDAD" --column "Seleccione una opcion" "1: Realizar un escaneo completo de su pagina web" "2: Escanear y mostrar el ip de todos los dispositivos encontrados en su red" "3: Escanear y mostrar todos los puertos abiertos de algun dispositivo de su empresa" "4: Mostrar la ubicacion de algun telefono de su empresa" "5: Salir del sistema"`


        ;;

        ["5: Salir del sistema"]* ) 
          variable_salir=`zenity --width=800 --height=300 --list --title="SALIR" --text "ESTA SEGURO QUE DESEA SALIR DEL SISTEMA?" --column "Seleccione una opcion" "Salir" "No"`
         
if [ $variable_salir = "Salir" ]
 then
   exit

fi

op=`zenity --width=800 --height=300 --list --title="MENU PRINCIPAL" --text "BIENVENIDO AL MENU PRINCIPAL DEL SISTEMA EMPRESARIAL DE CIBERSEGURIDAD" --column "Seleccione una opcion" "1: Realizar un escaneo completo de su pagina web" "2: Escanear y mostrar el ip de todos los dispositivos encontrados en su red" "3: Escanear y mostrar todos los puertos abiertos de algun dispositivo de su empresa" "4: Mostrar la ubicacion de algun telefono de su empresa" "5: Salir del sistema"`


          
         ;;        
        
        
    esac
done