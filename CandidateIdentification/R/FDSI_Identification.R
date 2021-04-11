#load data
library(tidyverse)

#Data loaded is the alignment results of a blastp with gold standard FDSIs as query
#and peptide sequences of all family members has subjects
allData <- read.delim("/home/fieldima/blastplus/blastp/blastAlignments/all_alignments", header = F, sep = "\t", stringsAsFactors = F, comment.char = "#", col.names = c("Query Name", "Query Length", "Subject Name", "Subject Length", "Alignment Length", "Percent Query Coverage Per Subject", "Evalue", "Percent Similarity", "PercentIdentity", "Bitscore", "Gaps"))

#Add a column to compare query and subject length
allData <- mutate(allData, QS.ratio = Query.Length/Subject.Length, GapPercentage = 100*(Gaps/Subject.Length))

#Filter all alignments for query sequences that are similar to gold standard FDSIs
FDSIsPotentialConserved30 <- allData %>% 
  filter(Evalue <= 0.005, QS.ratio >= 0.9, QS.ratio <= 1.1,
         Percent.Query.Coverage.Per.Subject >= 90, PercentIdentity >= 30)

#Group by query sequence to see how many unique FDSIs there are left
grouped_FDSI <- FDSIsPotentialConserved30 %>% group_by(Query.Name)
grouped_FDSI %>% summarise(n = n_distinct(Query.Name))

#Remove all alignments that do not have a unique sequence for each FDSI in a pair
to_remove <- c("CFLAR|c-FLIPl", "KLF6","Ron","e37b","Calca|Calcitonin","Homer1b","Il1-RAcP","mMOR-1J","mMOR-1Jb","mMOR-1Jc","Rbfox1_N")
queries <- grouped_FDSI$Query.Name %>% data_frame() %>% unique() %>% filter(! . %in% to_remove)

#List out all the genes remaining: These are the candidate genes
genes_to_search <- c("BCAR1","eIF4G1","TP63","Cacnb4","Cdc42","Lipin", "Myh10","Rock2","Ryr3", "Snap25")
write(genes_to_search, "/home/fieldima/R/DirectedStudies/CandidateGenes")

#Plotting the metrics for presentation

#Choosing the color palette
cbbPalette <- c("#D55E00","#0072B2" )

#Query and Subject Length
plotData <- allData %>% dplyr::select(Subject.Length) %>% mutate(Subject = "Subject") %>% dplyr::rename(Length = Subject.Length) %>% unique()
tempData <- allData %>% dplyr::select(Query.Length) %>% mutate(Subject = "Query") %>% dplyr::rename(Length = Query.Length) %>% unique()
plotData <- full_join(plotData, tempData)
ggplot(plotData, aes(x = Length)) + geom_histogram() + facet_wrap(~Subject, ncol = 1)+ theme_bw()

#Evalue
ggplot(allData, aes(x=Evalue)) + geom_histogram()  + theme_bw()

#Percent Similarity
identityData <- allData %>% mutate(Thirty = ifelse(PercentIdentity >= 30, "Yes","No"))
ggplot(identityData, aes(PercentIdentity, fill = Thirty)) + scale_fill_manual(values=cbbPalette) + geom_histogram(bins = 100) + guides(fill = F) + theme_bw()
ggplot(FDSIsPotentialConserved30, aes(PercentIdentity)) + geom_histogram()
ggplot(allData, aes(PercentIdentity, Percent.Similarity)) + geom_point() + geom_smooth(method = "lm") + geom_vline(xintercept = 30) + theme_bw()
ggplot(allData, aes(PercentIdentity, GapPercentage)) + geom_point() + geom_smooth(method = "lm") + theme_bw()
ggplot(FDSIsPotentialConserved30, aes(PercentIdentity, GapPercentage)) + geom_point() + geom_smooth(method = "lm") + theme_bw()

#Correlate vs log(Bitscore)
ggplot(allData, aes(Percent.Similarity, log10(Bitscore))) + geom_point() + geom_smooth(method = "lm") + theme_bw()
ggplot(allData, aes(PercentIdentity, log10(Bitscore))) + geom_point() + geom_smooth(method = "lm") + theme_bw()

#Percent Alignment
ggplot(allData, aes(Percent.Query.Coverage.Per.Subject)) + geom_histogram() + geom_vline(xintercept = 90) + theme_bw()
ggplot(allData, aes(log(Bitscore), Percent.Query.Coverage.Per.Subject)) + geom_point() + geom_smooth(method = "lm") + theme_bw()
plot(log(allData$Alignment.Length), allData$Percent.Query.Coverage.Per.Subject)
ggplot(allData, aes(Percent.Query.Coverage.Per.Subject, PercentIdentity)) + geom_point() + theme_bw()



