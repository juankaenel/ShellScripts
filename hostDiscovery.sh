#!/bin/bash

# Herramienta para descubrimiento de hosts a través de una trama icmp

function ctrl_c() {
        echo -e "\n\n[*] Saliendo...\n"
        tput cnorm; exit 0
}

if [ $1 ]; then
	ip=$1
	tput civis; for i in $(seq 2 254); do
		timeout 1 bash -c "ping -c 1 $ip.$i > /dev/null 2>&1" && echo "Host $ip.$i - Activo" &
	done; wait 
	tput cnorm
else
	echo -e "\n[*] Uso: ./hostDiscovery.sh <Primeros 3 octetos de dirección-ip>\n"
	echo -e "[*] Ejemplo: ./hostDiscovery.sh 10.10.10"
	exit 1
fi

