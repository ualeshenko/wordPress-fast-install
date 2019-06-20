#!/bin/bash

declare -A environment

keys=( $( echo ${@} | sed "s/\-\-//g" ) )

environment=( [domain]=localhost [ip]=127.0.0.1 )

for i in ${keys[@]} ; do
   echo "values[$(echo $i | cut -d'=' -f1)]=$(echo $i | cut -d'=' -f2)"
   environment[$(echo $i | cut -d'=' -f1)]=$(echo $i | cut -d'=' -f2)
done

echo ${environment[ip]}
