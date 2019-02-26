##Los datos se obtuvieron de la publicación "SNP discovery in wild and domesticated populations of blue catfish, Ictalurus furcatus, using genotyping‐by‐sequencing and subsequent SNP validation " (Li,
Waldbieser, Bosworth, Beck, Thongda & Peatman; 2014). Apartir de SNPs generados para el pez gato azul para poblaciones silvestres y domesticas.

Detalles: Los SNP fueron llamados por TASSEL 4.0 después de mapear las lecturas crudas de GBS al genoma del bagre azul por BWA. El archivo VCF que contiene información de SNP que retiene información sobre la profundidad de la cobertura para cada alelo, contiene todas las llamadas de SNP sin procesar.

#Se formo una carpeta docker con un run de vcf.

Analisiss="docker run --rm -v /home/alberto/Escritorio/ProyectoUnidad5_AEPP/Analisis:/data biocontainers/vcftools:0.1.15 vcftools"

##Se corren los datos con la opcion --vcf para ver el contenido.

$Analisiss --vcf all.mergedSNPs.vcf

###Estas son las especificaciones del archivo.
VCFtools - 0.1.15
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
	--vcf all.mergedSNPs.vcf

After filtering, kept 192 out of 192 Individuals
After filtering, kept 40217 out of a possible 40217 Sites
Run Time = 1.00 seconds

###Pasamos a hacer un filtrado y a formar un archivo plink con estos datos nuevos.
#Primero vemos las especificaciones y resultados

$Analisiss --vcf all.mergedSNPs.vcf --maf 0.05
VCFtools - 0.1.15
(C) Adam Auton and Anthony Marcketta 2009

Parameters as interpreted:
	--vcf all.mergedSNPs.vcf
	--maf 0.05

After filtering, kept 192 out of 192 Individuals
After filtering, kept 21877 out of a possible 40217 Sites
Run Time = 4.00 seconds


###Ahora a formar un outpout

$Analisiss --vcf all.mergedSNPs.vcf --maf 0.05 --recode --out gatos_maf05

###Lo pasamos a formato plink

$Analisiss --vcf gatos_maf05.recode.vcf --plink

##Usar plink para formar un archivo bed
##Este es el contenedor docker donde esta plink
47510c615eff        gelog/plink    "/usr/local/bin/plin…"

plink="docker run --rm -v /home/alberto/Escritorio/ProyectoUnidad5_AEPP/Analisis:/data gelog/plink plink"

####Como no pude usar el plink de biocontaiers descargue la aplicacion que corre con ./plink
###Hacer archivo bed

./plink --file gatosnp --make-bed --out gato_SNP

##ERROR EN PLINK##

./plink --file gatosnp --make-bed --out gato_SNP
PLINK v1.90b6.8 64-bit (15 Feb 2019)           www.cog-genomics.org/plink/1.9/
(C) 2005-2019 Shaun Purcell, Christopher Chang   GNU General Public License v3
Logging to gato_SNP.log.
Options in effect:
  --file gatosnp
  --make-bed
  --out gato_SNP

3830 MB RAM detected; reserving 1915 MB for main workspace.

Error: Invalid chromosome code '30' on line 12 of .map file.
(This is disallowed for humans.  Check if the problem is with your data, or if
you forgot to define a different chromosome set with e.g. --chr-set.)
