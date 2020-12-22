#!/bin/bash

#Script para crear una sesión en tmux

time=0.5

#creamos una nueva sesion en un tiempo de 0.5 seg, con -d indico que será detached, es decir en segundo plano, abrá que hacer un atach para llamarlo, -t el nombre de la sesión
tmux new-session -d -t "HTB" && sleep $time   

 # renombramos la primer ventana con window y le damos un division horizontal, luego seleccionamos el primer panel
tmux rename-window "VPN" && tmux split-window -h && tmux select-pane -t 1

#creamos una nueva ventana llamada scanning, con -t HTB:2 le digo que hace referencia a la segunda ventana
tmux new-window -t HTB:2 -n "Scanning" && sleep $time 

