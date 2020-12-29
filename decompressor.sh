#!/bin/bash

name_decompressed=$(7z l contenido.gzip | grep "Name" -A 2 | tail -n 1 | awk 'NF{print $NF}') # obtener el nombre del archivo a comprimir  

7z x contenido.gzip > /dev/null 2>&1 # ejecuta la decompresion y mandamos la salida al dev null, y pasamos el stderr al stdin 

while true; do
        7z l $name_decompressed > /dev/null 2>&1
        
        if [ "$(echo $?)" == "0" ]; then #si el codigo de estado es 0 
                decompressed_next=$(7z l $name_decompressed | grep "Name" -A 2 | tail -n 1 | awk 'NF{print $NF}') # Actualizamos el nombre del archivo decomprimido 
                7z x $name_decompressed > /dev/null 2>&1 && name_decompressed=$decompressed_next 
        else #si el codigo de estado es 1, es decir ya no se puede decomprimir más hago un cat del ultimo archivo decomprimido y borro los demás  devolviendo un exi>
                cat $name_decompressed; rm data* 2>/dev/null #con 2>/dev/null mando el stederr al dev null
                exit 1                 
        fi 
done 
