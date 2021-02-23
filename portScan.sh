#!/bin/bash
trap ctrl_c INT

function ctrl_c() {
	echo -e "\n\n[*] Saliendo...\n"
	tput cnorm; exit 0
}

if [ $1 ]; then
	ip_address=$1
	tput civis; for port in $(seq 1 65535); do
		timeout 1 bash -c "echo '' < /dev/tcp/$ip_address/$port" 2>/dev/null && echo "[*] Puerto $port - Abierto" &
	done; wait
	tput cnorm
else
	echo -e "\n[*] Uso: ./portScan.sh <dirección-ip>\n"
	exit 1
fi
