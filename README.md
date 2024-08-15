# WhaleGenomics-Synteny

## Format the chromosome assembly with sequence headers following this format: First letter of Genus name followed by the first two letters of the Species name in all caps. WhaleSp.txt file required for loop in this script

  sh FormatChromosomeFasta_for_Synteny.sh

## Run LASTAL using a Ref and Query file for a loop. WhaleRefA.txt and WhaleQueryA.txt are uploaded as separate files so you can see the input format.

  sh LASTAL.sh

## Input a list of References and Query species using the species codes (First letter of Genus name followed by the first two letters of the Species name in all caps) as the $1 and $2 variable for this shell script.

sh LASTAL-to-SyntenyJCVI.sh Reference.list Query.list

Still finishing this file (08/15/24)
