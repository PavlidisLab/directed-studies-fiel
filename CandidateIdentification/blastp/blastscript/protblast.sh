#!/bin/bash

# Running the blastp

echo Alignment start

QUERY=$1
DATABASE=$2
OUTPUT=$3

INPUT=/home/fieldima/blastplus/blastp/blastquery/$QUERY
DB=/home/fieldima/blastplus/blastp/blastdb/$DATABASE
OUT=/home/fieldima/blastplus/blastp/blastAlignments/$OUTPUT


blastp -query $INPUT -subject $DB -out $OUT -outfmt "07 qaccver qlen saccver slen length qcovs evalue ppos pident bitscore gaps"  &

echo Alignment Success




