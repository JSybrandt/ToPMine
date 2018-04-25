#!/bin/bash

export BIN_DIR=$(readlink -f ./TopicalPhrases/bin)
export JAR_DIR=$(readlink -f ./external)
export CLASSPATH="$BIN_DIR:$JAR_DIR"
export MEM_FLG="-Xmx6g"

