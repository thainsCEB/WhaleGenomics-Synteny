#!/bin/bash

while read asm fasta sp
do
seqkit seq -n ${fasta} | grep chromosome | grep -v unloc | seqtk subseq ${fasta} - | sed "/^>/s/>.*chromosome: />${sp}/g;/^>/s/>.*chromosome />${sp}/g;/^>/s/, .*$//g" > ${asm}.fasta
done < WhaleSp.txt
