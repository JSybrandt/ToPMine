#!/bin/bash

#java arguments
parFile="input_dataset_output/input_partitionedTraining.txt"	#partitio file
canFile="input_dataset_output/candidate"	#candidate file

stopWordFile="stoplists/en.txt" #stop words file
vocFile="input_dataset/input_vocFile"      #voc file
rawFile=$1      #raw file
outFile="input_dataset_output/unmapped_phrases"
maxPattern=$2


echo "Unstemming..."

className="unStem/CandidatePhraseGen"
java $MEM_FLG  $className $parFile $canFile


className="unStem/UnStemPhraseClass"
java $MEM_FLG $className $canFile $stopWordFile $vocFile $rawFile $outFile $maxPattern
