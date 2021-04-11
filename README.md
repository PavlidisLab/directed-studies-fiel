# directed-studies-fiel

This repository contains all the R and bash scripts used in my study on the intersection between alternative splicing and gene duplication. Included in the main directory
are workflow diagrams that explain my methodology, called Figure2a and Figure2b.

The folders in this repository will be as below:

## CandidateIdentification
This folder contains scripts necessary to determine candidate FDSIs. First, gene family members are identified via literature search. Next, all peptide
sequences for family members are pulled from ensembl using either the biomart community portal or the biomaRt tool in R. Then, blastp is performed using
gold standard FDSI sequences as query and family member sequences as subject. Finally, candidate FDSIs are determined from alignment results. 

## CDDAnnotation
Generating domain annotations of gold standard and candidate FDSIs. Peptide sequences are first run through the CDD web tool to generate domain annotations. 
The best match candidate FDSIs are then lined up with their respective gold standard FDSI and a table is produced to compare annotation similarity and identity.

## ModelPrevalence
All scripts and files needed to determine the prevalence of NI-model and I-model in the dataset. First, peptide databases of target species are pulled from ensembl 
via ftp protocol. Next, ensembl Gene Trees are pulled from Compara using the REST API and gene duplication events are inferred. Then, blastp is performed using 
gold standard FDSI sequences as query with peptide databases of target species as subject. Alignment sequences are then used to determine conservation of FDSIs 
in target species. Finally, conservation of FDSIs are analyzed following gene duplication events to determine prevalence of different models. 
