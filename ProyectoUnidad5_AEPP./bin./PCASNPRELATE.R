######SNPRELATE (PCA DE SNPŚ)#################
#Instalacion##if (!requireNamespace("BiocManager", quietly = TRUE))
#              install.packages("BiocManager")
#              BiocManager::install("SNPRelate", version = "3.8")

getwd()
.libPaths()
.libPaths("/home/alberto/R/x86_64-pc-linux-gnu-library/3.5")

browseVignettes("SNPRelate")

##Open pakcages####
library(gdsfmt)
library(SNPRelate)
library(ggplt2)

###Charger the doc.vcf###
vcf <- "all.mergedSNPs.vcf"
snpgdsVCF2GDS(vcf,"pro.gds",ignore.chr.prefix="chr_")##Do the *.gds file
pro.gds <- snpgdsOpen("pro.gds")##Open *.gds file
snpgdsSummary("pro.gds") ##Summary

# Check snp.id and head.id
head(read.gdsn(index.gdsn(pro.gds, "snp.id")))
head(read.gdsn(index.gdsn(pro.gds, "sample.id")))

###Get sample.id and snp.id
sample.id <- read.gdsn(index.gdsn(pro.gds, "sample.id"))
sample.id

snpset.id <- unlist(read.gdsn(index.gdsn(par.gds, "snp.id")))
snpset.id
###Do PCA analisis####
##PCA for aleles maf >0.5 ##
pca <- snpgdsPCA(par.gds, num.thread=2, maf = 0.05) ###PCA

###Percent of variation in EV's#####
pc.percent <- pca$varprop*100##Porcentaje de variacion
head(round(pc.percent, 2))##Ver valores

####Do plot's in ggplot2###
###Do data.frame######
tab<-data.frame(sample.id=pca$sample.id,##Crear data frame
                 EV1= pca$eigenvect [,1],
                 EV2= pca$eigenvect [,2],
                 StringsAsFactors= FALSE)
###A new colum whit the legend of sample.id###
tab=cbind(tab, Grupos= rep(c("RG","DB","Mo","Msr","Tx"), c(60,36,32,31,33))) 
tab

####Do de plot in ggplot2#######
ggplot(data= tab, aes(x=EV2, y=EV1, color=Grupos, shape=Grupos, ))+ geom_point() + 
  ylab(paste0("eigenvector 1 explainning ", round(pc.percent, 2) [1],"%")) +
  xlab(paste0("eigenvector 2 explainning ", round(pc.percent, 2) [2],"%")) +
  theme_bw()
