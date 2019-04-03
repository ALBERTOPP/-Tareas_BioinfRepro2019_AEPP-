# Proyect 5

### Alberto Esteban Pérez Pedraza

This project consists of general diversity analyzes obtained from SNPs obtained from 5 wild and domesticated populations of catfish in the USA. 

The data were obtained from the publication ["SNP discovery in wild and domesticated populations of blue 
catfish, Ictalurus furcatus, using genotyping-by-sequencing and subsequent SNP validation"](https://www.ncbi.nlm.nih.gov/pubmed/24797164) (Li, Waldbieser, Bosworth, Beck, Thongda & Peatman, 2014). 
Share of SNPs generated for blue catfish for wild and domestic populations.They utilized genotyping-by-sequencing
(GBS) to capture and genotype SNP markers on 190 individuals from five wild and domesticated populations 
(Mississippi River, Missouri, D&B, Rio Grande and Texas). Stringent filtering of SNP-calling parameters 
resulted in 4275 SNP loci represented across all five populations.

The project consists of a README, a SUMMARY and three folders (data, bin, meta) that contain the data and 
scripts necessary for the realization of the project. 

- Inside the folder [data](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/tree/master/ProyectoUnidad5_AEPP./data.) is stored the information of the SNPs obtained in its vcf format. 

- In the folder [bin](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/tree/master/ProyectoUnidad5_AEPP./bin.) the scripts that were used and some notes that facilitate the replication of the analyzes. 

- In the folder [meta](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/tree/master/ProyectoUnidad5_AEPP./meta.) the graphs obtained in the analyzes.

A preliminary visualization of the data will be done using the **vcfR 1.8 program**. Subsequently, a PCA was performed with the values of SNPs filtered (maf = 0.5) with the program **SNPRelate 3.8**, this with the purpose of observing if there is structure among the populations. Finally, a tree without root of the individuals in the program **PHYLOVIZ 2.0** was made to observe the genetic interactions of all the populations. Subsequently, the program ggplot2 is used to generate 
a graph that represents the results for both analyzes.

### [**vcfR 1.8**](https://cran.r-project.org/web/packages/vcfR/index.html) 
This software allows us to read and do analysis of * .cvf files. In the same way it allows us to convert files to different formats such as * .fasta, among others.

### [**SNPRelate 3.8**](https://bioconductor.org/packages/release/bioc/html/SNPRelate.html)
SNPRelate is a statistical package of R that allows us to generate a PCA from the SNP data stored in the vcf file of the data folder of the repository. This program works through the statistical platform of R and is available in Bioconductor to be downloaded.

### [**PHYLOVIZ 2.0**](http://www.phyloviz.net/)
PHYLOVIZ allows phylogenetic inference and data visualization for large datasets of sequence based typing methods, including Single Nucleotide Polymorphism (SNP) and whole genome. To incorporates new data analysis algorithms and new visualization modules, as well as the capability of saving projects for subsequent works.


![Ictalurus furcatus](https://www.tnaqua.org/images/uploads/our_animals/ID_BlueCatfish_1200x490.jpg "Ictalurus furcatus")



