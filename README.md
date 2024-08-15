# WhaleGenomics-Synteny

## Format the chromosome assembly with sequence headers following this format: First letter of Genus name followed by the first two letters of the Species name in all caps. WhaleSp.txt file required for loop in this script

  sh FormatChromosomeFasta_for_Synteny.sh

## Run LASTAL using a Ref and Query file for a loop. WhaleRefA.txt and WhaleQueryA.txt are uploaded as separate files so you can see the format for inputs.

  sh LASTAL.sh
  
sh LASTAL-to-SyntenyJCVI.sh

Still finishing this file (08/15/24)
