#!/bin/bash

export BIN_DIR=$(readlink -f ./TopicalPhrases/bin)
export JAR_DIR=$(readlink -f ./external/)
#list jars, space to colon
export JARS=$(echo $JAR_DIR/*.jar | tr ' ' ':')
export CLASSPATH="$BIN_DIR:$JARS"
export MEM_FLG="-Xmx150g"

