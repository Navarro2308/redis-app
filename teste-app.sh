#!/bin/bash
 
# Realiza a solicitação HTTP e armazena a resposta em RESULT
RESULT=$(wget -qO- http://localhost:8090)
 
# Verifica o status da solicitação HTTP
if [ $? -eq 0 ]; then
    echo 'ok - serviço no ar!'
else if [[ $RESULT == *"Number"* ]]; then
    echo 'ok - número de visitas'
    echo "$RESULT"
else
    echo 'not ok - número de visitas'
    exit 1
fi
