#/bin/bash 
RESULT="(`wget -qO- http://localhost:8090`"
wget -q localhost:8090 
if [ $? -eq 0 ] 
then
    echo 'ok - serviço no ar!'
elif [[ $RESULT == *"Number"* ]] 
then
    echo 'ok - número de visitas'
    echo "$RESULT"
else
    echo 'not ok - número de visitas'
    exit 1
fi
