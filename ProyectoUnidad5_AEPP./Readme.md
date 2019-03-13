#Proyect 5

###Alberto Esteban Pérez Pedraza

This project consists of the generation of a PCA and an analysis of demographic growth from a set of SNPs. 
For this, SNPRelate and G_PhoCs programs will be used. Subsequently, the program ggplot2 is used to generate 
a graph that represents the results for both analyzes.

The project consists of a README, a SUMMARY and three folders (data, bin, meta) that contain the data and 
scripts necessary for the realization of the project. Inside the folder "data" is stored the information 
of the SNPs obtained in its vcf format. In the folder "bin" the scripts that were used and some notes that
facilitate the replication of the analyzes. In the folder "meta" the manual of the programs that were used 
and the graphs obtained in the analyzes.

The data were obtained from the publication "SNP discovery in wild and domesticated populations of blue 
catfish, Ictalurus furcatus, using genotyping-by-sequencing and subsequent SNP validation" 
(Li, Waldbieser, Bosworth, Beck, Thongda & Peatman, 2014).[https://www.ncbi.nlm.nih.gov/pubmed/24797164] 
Share of SNPs generated for blue catfish for wild and domestic populations.They utilized genotyping-by-sequencing
(GBS) to capture and genotype SNP markers on 190 individuals from five wild and domesticated populations 
(Mississippi River, Missouri, D&B, Rio Grande and Texas). Stringent filtering of SNP-calling parameters 
resulted in 4275 SNP loci represented across all five populations.

*+SNPRelate* [https://bioconductor.org/packages/release/bioc/html/SNPRelate.html] SNPRelate is a statistical 
package of R that allows us to generate a PCA from the SNP data stored in the vcf file of the data folder of the repository. 
This program works through the statistical platform of R and is available in Bioconductor to be downloaded.

*+G_PhoCs* [http://compgen.cshl.edu/GPhoCS/] G_PhoCs (A Generalized Phylogenetic Coalescent Sampler) G-PhoCS is a software 
package for inferring ancestral population sizes, population divergence times, and migration rates from individual genome sequences.
G-Parameter inference is done in a Bayesian manner, using a Markov Chain Monte Carlo (MCMC). This software works in bash plataform.
