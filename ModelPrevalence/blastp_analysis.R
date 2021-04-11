#Upload blastp results of gold standard FDSIs against all known proteins in all six target species

library(tidyverse)

setwd("/home/fieldima/blastplus/blastp/blastPotentialFDSIs/blastOut")

colName <- c("Query Name", "Query Length", "Subject Name", "Subject Length", "Alignment Length", "Subject Seq", "Percent Query Coverage Per Subject", "Evalue", "Percent Similarity", "PercentIdentity", "Bitscore")

danio_rerio <- read.delim("./danio_rerio/danio_rerio_alignments", header = F, sep = "\t", stringsAsFactors = F, comment.char = "#", col.names = colName) %>% mutate(QS.ratio = Query.Length/Subject.Length) %>% mutate(AlignmentSubjectPer = Alignment.Length/Subject.Length)
latimeria_chalumnae <- read.delim("./latimeria_chalumnae/latimeria_chalumnae_alignments", header = F, sep = "\t", stringsAsFactors = F, comment.char = "#", col.names = colName) %>% mutate(QS.ratio = Query.Length/Subject.Length) %>% mutate(AlignmentSubjectPer = Alignment.Length/Subject.Length)
lepisosteus_oculatus <- read.delim("./lepisosteus_oculatus/lepisosteus_oculatus_alignments", header = F, sep = "\t", stringsAsFactors = F, comment.char = "#", col.names = colName) %>% mutate(QS.ratio = Query.Length/Subject.Length) %>% mutate(AlignmentSubjectPer = Alignment.Length/Subject.Length)
petromyzon_marinus <- read.delim("./petromyzon_marinus/petromyzon_marinus_alignments", header = F, sep = "\t", stringsAsFactors = F, comment.char = "#", col.names = colName) %>% mutate(QS.ratio = Query.Length/Subject.Length) %>% mutate(AlignmentSubjectPer = Alignment.Length/Subject.Length)
takifugu_rubripes <- read.delim("./takifugu_rubripes/takifugu_rubripes_alignments", header = F, sep = "\t", stringsAsFactors = F, comment.char = "#", col.names = colName) %>% mutate(QS.ratio = Query.Length/Subject.Length) %>% mutate(AlignmentSubjectPer = Alignment.Length/Subject.Length)
drosophila_melanogaster <- read.delim("./drosophila_melanogaster/drosophila_melanogaster_alignments", header = F, sep = "\t", stringsAsFactors = F, comment.char = "#", col.names = colName) %>% mutate(QS.ratio = Query.Length/Subject.Length) %>% mutate(AlignmentSubjectPer = Alignment.Length/Subject.Length)

#Filter alignments for only sequences similar to gsFDSIs as in FDSI_Identification.R
PotentialFDSIsDanio <- danio_rerio %>%
  filter(Evalue <= 0.005, QS.ratio >= 0.9, QS.ratio <= 1.1,
       Percent.Query.Coverage.Per.Subject >= 90, Percent.Similarity >= 30, AlignmentSubjectPer >= 0.9)

PotentialFDSIsLatimeria <- latimeria_chalumnae %>%
  filter(Evalue <= 0.005, QS.ratio >= 0.9, QS.ratio <= 1.1,
         Percent.Query.Coverage.Per.Subject >= 90, Percent.Similarity >= 30, AlignmentSubjectPer >= 0.9)

PotentialFDSIsLepisosteus <- lepisosteus_oculatus %>%
  filter(Evalue <= 0.005, QS.ratio >= 0.9, QS.ratio <= 1.1,
         Percent.Query.Coverage.Per.Subject >= 90, Percent.Similarity >= 30, AlignmentSubjectPer >= 0.9)

PotentialFDSIsPetromyzon <- petromyzon_marinus %>%
  filter(Evalue <= 0.005, QS.ratio >= 0.9, QS.ratio <= 1.1,
         Percent.Query.Coverage.Per.Subject >= 90, Percent.Similarity >= 30, AlignmentSubjectPer >= 0.9)

PotentialFDSIsTakifugu <- takifugu_rubripes %>%
  filter(Evalue <= 0.005, QS.ratio >= 0.9, QS.ratio <= 1.1,
         Percent.Query.Coverage.Per.Subject >= 90, Percent.Similarity >= 30, AlignmentSubjectPer >= 0.9)

PotentialFDSIsDrosophila <- drosophila_melanogaster %>%
  filter(Evalue <= 0.005, QS.ratio >= 0.9, QS.ratio <= 1.1,
         Percent.Query.Coverage.Per.Subject >= 90, Percent.Similarity >= 30, AlignmentSubjectPer >= 0.9)

#load biomart
library("biomaRt")

#Setting up biomaRt on our end
ensembl <- useMart("ensembl")

#Listing all the data in marts for us to search through
mart_datasets <- listDatasets(ensembl)

#setting up marts for each of the target species
danio_db <- useDataset("drerio_gene_ensembl", mart = ensembl)
drosophila_db <- useDataset("dmelanogaster_gene_ensembl", mart = ensembl)
takifugu_db <- useDataset("trubripes_gene_ensembl", mart = ensembl)
petromyzon_db <- useDataset("pmarinus_gene_ensembl", mart = ensembl)
latimeria_db <- useDataset("lchalumnae_gene_ensembl", mart = ensembl)
lepisosteus_db <- useDataset("loculatus_gene_ensembl", mart = ensembl)

#Showing attributes and filters in these datasets. Drosophila has unique attributes
mart_attributes <- listAttributes(danio_db)
dros_attributes <- listAttributes(drosophila_db)
mart_filters <- listFilters(danio_db)

#Get ensembl gene symbols for each protein for each species for ease of comparison
# "Fixed" data contains only query name, subject name, gene name, and ensembl id
danio_names <- getBM(attributes = c("ensembl_peptide_id_version", "external_gene_name", "ensembl_gene_id"),
                     filters = c('ensembl_peptide_id_version'),
                     values = PotentialFDSIsDanio$Subject.Name,
                     mart = danio_db,
                     uniqueRows = F) %>% dplyr::rename(Subject.Name = ensembl_peptide_id_version)
FixedPotentialDanio <- PotentialFDSIsDanio %>% dplyr::select(Query.Name, Subject.Name) %>% left_join(danio_names)

drosophila_names <- getBM(attributes = c("ensembl_peptide_id", "external_gene_name", "ensembl_gene_id"),
                     filters = c('ensembl_peptide_id'),
                     values = PotentialFDSIsDrosophila$Subject.Name,
                     mart = drosophila_db,
                     uniqueRows = F) %>% dplyr::rename(Subject.Name = ensembl_peptide_id)
FixedPotentialDrosophila <- PotentialFDSIsDrosophila %>% dplyr::select(Query.Name, Subject.Name) %>% left_join(drosophila_names)

latimeria_names <- getBM(attributes = c("ensembl_peptide_id_version", "external_gene_name", "ensembl_gene_id"),
                     filters = c('ensembl_peptide_id_version'),
                     values = PotentialFDSIsLatimeria$Subject.Name,
                     mart = latimeria_db,
                     uniqueRows = F) %>% dplyr::rename(Subject.Name = ensembl_peptide_id_version)
FixedPotentialLatimeria <- PotentialFDSIsLatimeria %>% dplyr::select(Query.Name, Subject.Name) %>% left_join(latimeria_names)

lepisosteus_names <- getBM(attributes = c("ensembl_peptide_id_version", "external_gene_name", "ensembl_gene_id"),
                     filters = c('ensembl_peptide_id_version'),
                     values = PotentialFDSIsLepisosteus$Subject.Name,
                     mart = lepisosteus_db,
                     uniqueRows = F) %>% dplyr::rename(Subject.Name = ensembl_peptide_id_version)
FixedPotentialLepisosteus <- PotentialFDSIsLepisosteus %>% dplyr::select(Query.Name, Subject.Name) %>% left_join(lepisosteus_names)

petromyzon_names <- getBM(attributes = c("ensembl_peptide_id_version", "external_gene_name", "ensembl_gene_id"),
                     filters = c('ensembl_peptide_id_version'),
                     values = PotentialFDSIsPetromyzon$Subject.Name,
                     mart = petromyzon_db,
                     uniqueRows = F) %>% dplyr::rename(Subject.Name = ensembl_peptide_id_version)
FixedPotentialPetromyzon <- PotentialFDSIsPetromyzon %>% dplyr::select(Query.Name, Subject.Name) %>% left_join(petromyzon_names)

takifugu_names <- getBM(attributes = c("ensembl_peptide_id_version", "external_gene_name", "ensembl_gene_id"),
                     filters = c('ensembl_peptide_id_version'),
                     values = PotentialFDSIsTakifugu$Subject.Name,
                     mart = takifugu_db,
                     uniqueRows = F) %>% dplyr::rename(Subject.Name = ensembl_peptide_id_version)
FixedPotentialTakifugu <- PotentialFDSIsTakifugu %>% dplyr::select(Query.Name, Subject.Name) %>% left_join(takifugu_names)

