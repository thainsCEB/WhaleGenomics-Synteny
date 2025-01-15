Reformat each genome fasta file that was downloaded from NCBI to change retain only chromosomes and rename them using a cytogenetic format (First letter of Genus name followed by first two letters of the species name in capitals followed by chromozome number/name (1 through X and Y)

	sh FormatChromosomeFasta.sh Genomes.txt

### Example of Genomes.txt
	
	mDelDel1	/mnt/nfs/volume1/bucket/Combined_Storage/thains/WhaleGenomes/GCA_949987515.2_mDelDel1.2_genomic.fna	DDE
	mGloMel1	/mnt/nfs/volume1/bucket/Combined_Storage/thains/WhaleGenomes/GCA_963455315.2_mGloMel1.2_genomic.fna	GME

## Run LAST 
Based on the phylogeny order the species from the root to the most recent tips so that when you generate the synteny plot, the order from top to bottom matches the position in a phylogenetic tree
Pick a species from every other two as Reference individuals and the species above and below the Reference as Query species. You will generate a Ref file and Query file with two species in each file, however, for every reference file there are two query files
For example, RefA.txt is run with QueryA.txt and QueryB.txt and RefB.txt is run with QueryC.txt and QueryD.txt and so on.

### Run with RefA.txt and QueryA.txt

	sh Lastal.sh

### Run with RefA.txt and QueryB.txt
	sh Lastal.sh

### Example of WhaleRef.txt

	OrcOrc1	OOR
	SteCoe1	SCO
	
### Example of WhaleQuery.txt

	GloMel1	GME
	LagAlb1	LAL

## Convert filtered MAFs for Synteny Plot
When all species have been aligned to a reference with LAST, convert MAFs into files for JCVI to use
Run with a list of all the References in one file using the cytogenetic format name and a Query file with all query species using the cytogenetic format name.

	sh LASTAL-to-SyntenyJCVI.sh Ref.list Query.list

### Example of Ref.list

	OOR
	SCO
	TTR
	PSI
	IGE
	MDE
	BRI
	ERO
	EGL

### Example of Query.list

	GME
	LAL
	LAL
	DDE
	DDE
	PPH
	PPH
	NAS
	NAS
	HAM
	HAM
	KBR
	KBR
	BMU
	BMU
	BAC

## Generate the seqids file for JCVI
Have a list of all Species fasta names (with the .fasta) in the order of the phylogeny

	sh GenerateSeqIDs.sh SpeciesOrder.txt

### SpeciesOrder.txt

	GloMel1
	OrcOrc1
	LagAlb1
	SteCoe1
	DelDel1
	TurTru1
	PhoSin1
	PhoPho1
	NeoAsi
	IniGeo1
	HypAmp2
	MesDen1
	KogBre1
	BalRic1
	BalMus1
	EscRob2
	BalAcu1
	EubGla1
	HipAmp2

## Generate layout file
Using the layout template file provided, edit in a text editting software

	python -m jcvi.graphics.karyotype pangolin_seqids layout_pangolins --notex --figsize=13x11 --dpi=600 --format=pdf -o 		Pangolin_karyotype.pdf

## Get Pairwise divergence from each pairwise alignment using maffilter

	maffilter input.file=DDE-TTR.1-1.renamed.maf input.file.compression=none output.log=DDE-TTR.1-1.maf.log params=paramsA.txt

### Calculate average PairwiseDivergence
	cat Downloads/GME-OOR.summary.txt| awk '{sum+=$20} END {print sum/NR}'

### Number of synteny block >1Kbp
	cat Downloads/GME-OOR.summary.txt| tail -n+2 | wc -l

### Calculate average size of synteny blocks >1Kbp
	cat Downloads/GME-OOR.summary.txt | awk '{sum+=$4} END {print sum/NR}'

### params.txt

	maf.filter=\
	MinBlockLength(min_length=1000),\
	SequenceStatistics(\
		statistics=(\
			BlockLength(),\
			SequenceLength(\
				species=DDE),\
			SequenceLength(\
				species=SCO),\
			SiteStatistics(\
				species=DDE),\
			SiteStatistics(\
				species=SCO),\
			AlnScore(),\
			PairwiseDivergence(\
				species1=DDE,\
				species2=SCO)),\
		ref_species=DDE,\
		file=DDE-SCO.summarty.txt)



