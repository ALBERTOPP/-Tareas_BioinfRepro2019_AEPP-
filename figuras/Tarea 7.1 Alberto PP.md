#Tarea 7.1
###Expresión diferencial de genes

#####Alberto Esteban Pérez Pedraza
###Profesor
#####Dr. Ricardo Verdugo Laines
--------------------------------------------------
##Introducción
La expresión génica es el proceso por medio del cual todos los microorganismos procariotas y células eucariotas transforman la información codificada por los ácidos nucleicos en las proteínas necesarias para su desarrollo, funcionamiento y reproducción con otros organismos.

Definición
La expresión diferencial es el cambio de los niveles de expresión de uno o mas genes
entre dos o varios condiciones
Algunos análisis típicos donde se emplean estas técnicas son:
• Para detectar posibles causas de una enfermedad (muestras sanas frente a muestras
patológicos o muestras que corresponden a distintas fases de la enfermedad)
• Para caracterizar las diferencias entre diferentes tipos celulares (hígado frente a cerebro,
etc.)
• En el desarrollo (no-diferenciado frente a diferenciado o los diferentes fases de
diferenciación)
• Para medir los efectos de estímulos externos: medicamentos, luz, alimentación, sueño, etc
• Células o organismos mutantes frente al wild-type

El objetivo es evaluar el efecto de la variación genética en el cromosoma Y del ratón sobre el tamaño de los cardiomiocitos y la posible dependencia de tales efectos en niveles de testosterona.

El diseño experimental fue el siguiente. Se ensayaron ocho ratones machos adultos de dos cepas, C57BL/6J y C57BL/6J-chrY<A/J/NaJ> , denominadas B y BY de aquí en adelante. De cada cepa (genotipo), cuatro animales fueron castrados y cuatro fueron intervenidos con el mismo procedimiento quirúrjuico, excepto que no se realizó la castración (animales intactos usados como control) . El ARN se hibridizó a BeadChips Illumina MouseRef-8 v2.0 que contienen ocho microarreglos con 25,697 sondas cada uno. Solo se seleccionaron arbitrariamente 5000 sondas para este tutorial (Figura 1).

Objetivos del análisis de datos:

Determinar si existe expresión diferencial entre genotipos.
Determinar si existe expresión diferencial entre tratamientos.
Evaluar las diferencias en la respuesta al tratamiento entre los dos genotipos.
Para obtener más información sobre los datos y los resultados biológicos, consulte (Llamas et al. 2009) . Para un análisis más técnico y una descripción de metodologías estadísticas y diseño experimental, ver (Verdugo et al. 2009) .

##Metodologia
 El conjunto de datos completo está disponible en la base de datos GEO por ID [GSE15354](http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE15354)
 
 
Hemos informado previamente que cuando el cromosoma Y (chrY) de la cepa de ratón C57BL / 6J (abreviado como B) se sustituyó por el de ratones A / J (ChrYA), cardiomiocitos de la 'sustitución de cromosoma' resultante C57BL / 6J -la cepa <A> (abreviada como BY) era más pequeña que la de sus contrapartes C57BL / 6J. A la inversa, cuando chrYA de ratones A / J se sustituyó por chrYB, los cardiomiocitos de la cepa A / J-chrYC57> resultante fueron más grandes que en sus contrapartes A / J. Además, utilizamos estas cepas (B y el BY consómico) para comprobar si el origen de la enfermedad también podría estar vinculado a las diferencias en el perfil de la expresión génica en sus ventrículos cardíacos izquierdos en ratones adultos en los que la cirugía simulada (animales intactos) o la castración tienen Realizado a las 3-4 semanas de edad.
 
 Posteriormente 
 se utilizo el comando
Se utilizaron los programas:

org.Mm.eg.db
preprocessCore
maanova
limma
topGO
 
##Resultados
GOdata <- new("topGOdata", ontology="BP", allGenes=genes.int,+           description="Genes DE by Trt by GenoInteraction", nodeSize=5,+              annotationFun=annFUN.org, mapping="org.Mm.eg.db", ID="entrez")               

![Boxplot](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/figuras/boxplot_raw_probe_qc.png "Boxplot")

![Boxplot por muestras](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/figuras/boxplot_raw_treatment.png "Boxplot por muestras")

![Valores de P](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/figuras/P-values%20Hist.png"Valores de P")

![Diagrama de Venn](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/figuras/vennDiagram_DiffExprs.png"Diagrama de Venn")

![Diagrama de Venn](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/figuras/vennDiagram_Int.png"Diagrama de Venn")

##Conclusión
Se encontro diferencia entre la expresion genica de las muestras castradas. Por lo que se pudiera concluir que esta modificacón en los patrones naturales de testosterona genera un cambio en la expresion del gen y por ello son mas propensos aa

##Literatura

+ Llamas B, Verdugo RA, Churchill GA, Deschepper CF. Chromosome Y variants from different inbred mouse strains are linked to differences in the morphologic and molecular responses of cardiac cells to postpubertal testosterone. BMC Genomics 2009 Apr 7;10:150. 

+ 
 
+ 
 