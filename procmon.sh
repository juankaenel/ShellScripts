#!/bin/bash

# ------------- script para verificar procesos y comandos ejecutados en tiempo real, orientado a la detección de procesos cron ---------- 
# ps -eo me command, me permite verificar que procesos/comandos están siendo ejecutados en ese momento

old_process=$(ps -eo command)

while true; do
	new_process=$(ps -eo command)
	diff <(echo "$old_process") <(echo "$new_process") | grep "[\>\<]" | grep -v "kworker" # aquí hago la comparativa entre procesos viejos y procesos actuales
	# como diff muestra la diferencia con < y > entonces hago el filtro por eso y también quito los procesos kworker.
	old_process=$new_process # actualizamos los procesos viejos
done

# Créditos S4vitar
