#!/bin/bash

dir=/space/scratch/fielDirectedStudies/
cd $dir

wget -r ftp://ftp.ensembl.org/pub/release-101/fasta/danio_rerio/pep/
wait
echo Zebrafish done

cd ./ftp.ensembl.org/pub/release-101/fasta/danio_rerio/pep/ 
gunzip *.gz

cd $dir

wget -r ftp://ftp.ensembl.org/pub/release-101/fasta/takifugu_rubripes/pep/
wait
echo Fugu done

cd ./ftp.ensembl.org/pub/release-101/fasta/takifugu_rubripes/pep/
gunzip *.gz

cd $dir

wget -r ftp://ftp.ensembl.org/pub/release-101/fasta/lepisosteus_oculatus/pep/
wait 
echo Spotted Gar done

cd ./ftp.ensembl.org/pub/release-101/fasta/lepisosteus_oculatus/pep/
gunzip *.gz

cd $dir

wget -r ftp://ftp.ensembl.org/pub/release-101/fasta/petromyzon_marinus/pep/
wait
echo Lamprey done

cd ./ftp.ensembl.org/pub/release-101/fasta/petromyzon_marinus/pep/
gunzip *.gz

cd $dir

wget -r ftp://ftp.ensembl.org/pub/release-101/fasta/latimeria_chalumnae/pep/
wait
echo Coelacanth done

cd ./ftp.ensembl.org/pub/release-101/fasta/latimeria_chalumnae/dna/
gunzip *.gz



