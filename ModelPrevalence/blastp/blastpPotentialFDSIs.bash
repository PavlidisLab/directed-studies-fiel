#!/bin/bash

#file not done, need to make a ton of edits

dir=/space/scratch/fielDirectedStudies/ftp.ensembl.org/pub/release-101/fasta
blastdir=/home/fieldima/blastplus/blastp/blastPotentialFDSIs/blastQueries
blastout=/home/fieldima/blastplus/blastp/blastPotentialFDSIs/blastOut

echo Alignment start

QUERY=$1
OUTPUT=$2

STRING="07 qaccver qlen saccver saccall slen length sseq qcovs evalue ppos pident bitscore"

INPUT=$blastdir/$QUERY
OUT1=$blastout/danio_rerio/$OUTPUT
OUT2=$blastout/lepisosteus_oculatus/$OUTPUT
OUT3=$blastout/petromyzon_marinus/$OUTPUT
OUT4=$blastout/latimeria_chalumnae/$OUTPUT
OUT5=$blastout/takifugu_rubripes/$OUTPUT
OUT6=$blastout/drosophila_melanogaster/$OUTPUT

db1=$dir/danio_rerio/pep/Danio_rerio_db
db2=$dir/lepisosteus_oculatus/pep/Lepisosteus_oculatus_db
db3=$dir/petromyzon_marinus/pep/Petromyzon_marinus_db
db4=$dir/latimeria_chalumnae/pep/Latimeria_chalumnae_db
db5=$dir/takifugu_rubripes/pep/Takifugu_rubripes_db
db6=$dir/drosophila_melanogaster/pep/Drosophila_melanogaster_db

blastp -query $INPUT -db $db1 -out $OUT1 -outfmt "07 qaccver qlen saccver saccall slen length sseq qcovs evalue ppos pident bitscore" 

blastp -query $INPUT -db $db2 -out $OUT2 -outfmt "07 qaccver qlen saccver saccall slen length sseq qcovs evalue ppos pident bitscore"

blastp -query $INPUT -db $db3 -out $OUT3 -outfmt "07 qaccver qlen saccver saccall slen length sseq qcovs evalue ppos pident bitscore"

blastp -query $INPUT -db $db4 -out $OUT4 -outfmt "07 qaccver qlen saccver saccall slen length sseq qcovs evalue ppos pident bitscore"

blastp -query $INPUT -db $db5 -out $OUT5 -outfmt "07 qaccver qlen saccver saccall slen length sseq qcovs evalue ppos pident bitscore"

blastp -query $INPUT -db $db6 -out $OUT6 -outfmt "07 qaccver qlen saccver saccall slen length sseq qcovs evalue ppos pident bitscore"

wait

echo Alignment finish
