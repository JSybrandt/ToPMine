#!/bin/bash

#java arguments
inputFile=$1 #the raw text file
datasetName="input"; # create a folder with the same name, and store all files under this folder
minsup=10	# the minimal support a word needs to satisfy
startsWithID=4 # 1 -> no doc id/no doc label;  2 -> doc id/no doc label; 3 -> with doc id and doc label #4 id . text
stopwordFile='stoplists/custom.txt'

echo $inputFile
echo $datasetName
echo $minsup
echo $startsWithID


#first run prepare data
echo ___
echo "Warning: This is going to write a logging error, unimportant."
className="DataPreparation/PrepareData"
java $MEM_FLG $className $inputFile $datasetName $minsup $startsWithID $stopwordFile


#second run parepare partition
echo ___
className="DataPreparation/PreparePartitionFile"
java $MEM_FLG $className $inputFile $datasetName $startsWithID
echo ___

