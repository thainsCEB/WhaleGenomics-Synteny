#!/bin/bash

while read reference ref_asm
do
lastdb -v -P8 -uRY4 -cR11 ${ref_asm}db ${reference}.fasta
while read query q_asm
do
last-train -P8 --revsym -C2 ${ref_asm}db ${query}.fasta > ${ref_asm}-${q_asm}.train
lastal -P8 -D1e9 -C2 --split-f=MAF+ -p ${ref_asm}-${q_asm}.train ${ref_asm}db ${query}.fasta > ${ref_asm}-${q_asm}.many-to-one.maf
last-split -r -m1e-5 ${ref_asm}-${q_asm}.many-to-one.maf > ${ref_asm}-${q_asm}.one-to-one.maf
done < WhaleQueryB.txt
done < WhaleRefA.txt
