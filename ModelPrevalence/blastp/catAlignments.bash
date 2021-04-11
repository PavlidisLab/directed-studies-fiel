#!/bin/bash

dir=/home/fieldima/blastplus/blastp/blastPotentialFDSIs/blastOut

cd $dir

cd ./danio_rerio
rm danio_rerio_alignments
cat *_alignment > danio_rerio_alignments
wait
cd $dir

cd ./drosophila_melanogaster
rm drosophila_melanogaster_alignments
cat *_alignment > drosophila_melanogaster_alignments
wait
cd $dir

cd ./latimeria_chalumnae
rm latimeria_chalumnae_alignments
cat *_alignment > latimeria_chalumnae_alignments
wait
cd $dir

cd ./lepisosteus_oculatus
rm lepisosteus_oculatus_alignments
cat *_alignment > lepisosteus_oculatus_alignments
wait
cd $dir

cd ./petromyzon_marinus
rm petromyzon_marinus_alignments
cat *_alignment > petromyzon_marinus_alignments
wait
cd $dir

cd ./takifugu_rubripes
rm takifugu_rubripes_alignments
cat *_alignment > takifugu_rubripes_alignments
wait
cd $dir

echo All done!
