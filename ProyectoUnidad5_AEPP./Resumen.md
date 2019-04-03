# Proyecto 5

Este proyecto consta de análisis de diversidad generales obtenidos a partir de SNPs obtenidos en 5 poblaciones silvestres y domesticadas de pez gato en EUA. Primeramente se realizaron análisis de diversidad genética en el programa  **PopGenome 2.6.1**. Posteriormente se efectuó un PCA con los valores de SNPs filtrados (maf =0.5) con el programa **SNPRelate 3.8**, esto con la finalidad de observar si existe estructura entre las poblaciones. Finalmente se realizó un árbol sin raíz de los individuos en el programa **PHYLOVIZ 2.0** para observar las interacciones genéticas de todas las poblaciones. 

Los datos se obtuvieron de la publicación "SNP discovery in wild and domesticated populations of blue catfish, Ictalurus furcatus, using genotyping‐by‐sequencing and subsequent SNP validation " (Li, Waldbieser, Bosworth, Beck, Thongda & Peatman; 2014). En un formato .vcf.

Este proyecto se subdivide en tres carpetas (bin, meta, data). donde la carpeta "data" contiene el archivo .vcf del cual se obtuvieron los SNPs.La carpeta "meta" contiene las imagenes de las graficas obtenidas y comentarios adicionales. La carpeta "bin" contiene los scrips de los analisis realizados y comentarios de los mismos.

**RESULTADOS**
Aparentemente las poblaciones de pez gato siguen compartiendo gran parte de sus recursos geneticos, aunque es posible evidenciar la segregacion de dos grupos importantes Mo y Msr.

![SNP calidad](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/ProyectoUnidad5_AEPP./meta./SNP%20quality.png "SNP calidad")

![PCA de SNPs realizado en SNPRelate](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/ProyectoUnidad5_AEPP./meta./PCASNPR.png "PCA de SNPs realizado en SNPRelate 3.8")

En el PCA se muestra que existen grupos fuertemente relacionados, sin embargo los grupos Mo y Msr se separan del resto gradualmente.

![Árbol de SNPs realizado en SNPRelate](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/ProyectoUnidad5_AEPP./meta./treeSNPs.PNG "Árbol de SNPs realizado en PHYLOVIZ 2.0")

El arbol de los genotipos nos muestra un patron similar al encontrado en el PCA, sin embargo, este  nos permite apreciar de mejor manera que existen individuos de los grupos divergentes que aún estan cercanamente relacionados con los grupos originales.
