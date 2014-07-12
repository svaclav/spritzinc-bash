#!/bin/bash

#
# Storing your ssh private key somewhere is very dangerous. We know it all.
# Best way is to print your ssh private key into your brain forever.
# This bash script will helps you with this important task.
#

SSH_KEY="$(cat ~/.ssh/id_rsa | grep -v "RSA PRIVATE" | tr -d '\n')"
echo -en "How many characters do you want to print in one moment? (recommended is 2 or 4): " 
read N
echo -en "Set speed of text in seconds (recommended is 0.3): "
read SPEED
I=$((1-N))
N_INC=$((N-1))
for (( $I; I<${#SSH_KEY}; I++)); do
      I=$((I+$N_INC));
      if [ "$I" -gt "${#SSH_KEY}" ]; then
        exit;
      fi
      printf "%80s\033[0K\r" "${SSH_KEY:$I:N} ";
      sleep $SPEED
done;
