#!/bin/bash
echo $PWD
export PWD="$PWD/vault"
echo "" > $PWD/volumes/logs/vault.logs 
docker-compose down 
rm -f $PWD/volumes/logs/key.txt &
rm -R $PWD/volumes/data/* & 
