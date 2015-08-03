#!/usr/bin/env bash
echo -e "\033[32;40;7m Cambiamos puerto SSH \033[0m"
echo -e "\033[31;47;7m Copiar esto a ~./ssh/config \033[0m"
IP=$(curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//')
echo "Host $HOSTNAME"
echo "    Hostname $IP"
echo "    Port $SSH_PORT"
echo "    User $NEWUSER"
