# WhaleGenomics-Synteny

## Format the chromosome assembly with sequence headers following this format: First letter of Genus name followed by the first two letters of the Species name in all caps. WhaleSpecies.txt file required for loop in this script

  sh FormatChromosomeFasta_for_Synteny.sh

### WhaleSpecies.txt

  MesDen1	GCA_025265405.1_mMesDen1_primary_haplotype_genomic.fna.masked	MDE

sh LASTAL.sh

### WhaleRefA.txt
  
  OrcOrc1	OOR
  SteCoe1	SCO

### WhaleQueryA.txt

  GloMel1	GME
  LagAlb1	LAL
  
sh LASTAL-to-SyntenyJCVI.sh

Still finishing this file (08/15/24)
