###vcfR####
#install.packages("vcfR")
library(vcfR)
library(pinfsc50)

setwd("/home/alberto/Escritorio/Tareas_BioinfRepro2019_AEPP/ProyectoUnidad5_AEPP./data./")

###Upload the doc.vcf###
pkg <- "pinfsc50"
vcf_file <- system.file("extdata", "pinf_sc50.vcf.gz", package = pkg)
vcf <- read.vcfR( vcf_file, verbose = FALSE ) ####Create a vcfR file

chrom <- create.chromR(name='Supercontig', vcf=vcf) ####Create chromosoma list
plot(chrom)###View plots

chrom <- masker(chrom, min_QUAL = 1, min_DP = 300, max_DP = 700, min_MQ = 59.9,  max_MQ = 60.1)
plot(chrom)###View plots

chromoqc(chrom, dp.alpha=20) #The function chromoqc() uses the R function layout() to make composite plots of the data. 

vars <- 1:100

#pairwise_genetic_diff
# Seperate heterozygotes and homozygotes.
gt <- extract.gt(vcf)
hets <- is_het(gt, na_is_false = FALSE)
vcfhe <- vcf
vcfhe@gt[,-1][ !hets & !is.na(hets) ] <- NA
vcfho <- vcf
vcfho@gt[,-1][ hets & !is.na(hets) ] <- NA
myOrdhe <- ordisample(vcfhe[vars,], sample = "P17777us22", plot = FALSE)
myOrdho <- ordisample(vcfho[vars,], sample = "P17777us22", plot = FALSE)
pairs(myOrdhe$data1)
pairs(myOrdho$data1)
hist(myOrdho$data1$PL, breaks = seq(0,9000, by=100), col="#8B4513") ##View histogram
