# Proyect 5

### Alberto Esteban Pérez Pedraza

This project consists of general diversity analyzes obtained from SNPs obtained from 5 wild and domesticated populations of catfish in the USA. First, genetic diversity analyzes were carried out in the program **PopGenome 2.6.1**. Subsequently, a PCA was performed with the values of SNPs filtered (maf = 0.5) with the program **SNPRelate 3.8**, this with the purpose of observing if there is structure among the populations. Finally, a tree without root of the individuals in the program **PHYLOVIZ 2.0** was made to observe the genetic interactions of all the populations. Subsequently, the program ggplot2 is used to generate 
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

### **PopGenome 2.6.1** [https://popgenome.weebly.com/] 
POPGENOME is a valuable tool for the analysis of genetic data and facilitates the implementation of multiple algorithms for analysis. It is available in CRAN and allows the entry of different formats such as impute.

### **SNPRelate 3.8** [https://bioconductor.org/packages/release/bioc/html/SNPRelate.html] 
SNPRelate is a statistical package of R that allows us to generate a PCA from the SNP data stored in the vcf file of the data folder of the repository. This program works through the statistical platform of R and is available in Bioconductor to be downloaded.

### **PHYLOVIZ 2.0** [http://www.phyloviz.net/]
PHYLOVIZ allows phylogenetic inference and data visualization for large datasets of sequence based typing methods, including Single Nucleotide Polymorphism (SNP) and whole genome. To incorporates new data analysis algorithms and new visualization modules, as well as the capability of saving projects for subsequent works.

### ![PEZ GATO AZUL](https://www.google.com/search?rlz=1C1CAFB_enMX617MX617&biw=1920&bih=888&tbm=isch&sa=1&ei=uWaZXJH8NYiSsAXeuKewBg&q=Ictalurus+furcatus&oq=Ictalurus+furcatus&gs_l=img.3..0.42097.42097..42476...0.0..0.101.101.0j1......1....2j1..gws-wiz-img.xeliHFdgNws#imgrc=eBWxfUqQf039tM: "Pez gato azul")
