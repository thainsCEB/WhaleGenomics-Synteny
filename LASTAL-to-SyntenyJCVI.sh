#!/bin/bash

ref=$1
qry=$2

for ref in $(cat $1)
do
for qry in $(cat $2)
do
mv $ref-$qry.one-to-one.maf $qry-$ref.1-1.maf

perl /home/FM/thains/muntjac_code/Fusion_mechanism_analysis/fusion_events_by_mcscan/scripts/maf.rename.species.S.pl $qry-$ref.1-1.maf $ref $qry $qry-$ref.1-1.renamed.maf
perl /home/FM/thains/muntjac_code/Fusion_mechanism_analysis/fusion_events_by_mcscan/scripts/maf2region_lzs.pl $qry-$ref.1-1.renamed.maf $ref.$qry

grep -v 'sv' $ref.$qry.record | sed '/^\s*$/d;/\*/d' | awk '$3-$2>=1000{print$0}' > $ref.$qry.filter.record

awk '{print $1"_"$2"\t"$1"_"$3"\t"$6"_"$7"\t"$6"_"$8"\t500\t"$9}' $ref.$qry.filter.record> $ref.$qry.simple   ## Using the same method, we also obtained the "CWD.CM.simple", "CM.BMF.simple" and "BMF.BMM.simple".
awk '{print $1"\t"$2-1"\t"$2+1"\t"$1"_"$2"\t0\t"$4"\n"$1"\t"$3-1"\t"$3+1"\t"$1"_"$3"\t0\t"$4}' $ref.$qry.filter.record> $qry.$ref.$ref.bed  ##Using the same method ,we alsome obtained the "CWD.CM.CM.bed", "CM.BMF.BMF.bed" and "BMF.BMM.BMM.bed"
awk '{print $6"\t"$7-1"\t"$7+1"\t"$6"_"$7"\t0\t"$9"\n"$6"\t"$8-1"\t"$8+1"\t"$6"_"$8"\t0\t"$9}' $ref.$qry.filter.record> $qry.$ref.$qry.bed  ## Using the same method, we also obtained the  "CWD.CM.CWD.bed", "CM.BMF.CM.bed" and "BMF.BMM.BMF.bed"
done
cat *.$ref.$ref.bed > $ref.bed
done
