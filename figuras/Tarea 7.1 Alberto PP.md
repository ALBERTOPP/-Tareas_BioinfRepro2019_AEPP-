# Tarea 7.1
### Expresión diferencial de genes

##### Alberto Esteban Pérez Pedraza
### Profesor
##### Dr. Ricardo Verdugo Laines
--------------------------------------------------

## Introducción

La expresión génica es el proceso por el cual los organismos transforman la información codificada en su genotipo en las proteínas necesarias para su desarrollo, funcionamiento y reproducción. Los niveles de expresion de cada gen dependeran de la etapa de desarrollo y del estimulo que presenten sus celulas hopederas, por lo que el observar los niveles de expresion de los genes nos permite detectar posibles causas de una enfermedad,fases de diferenciación y caracterización de las celulas y para medir el grado de exitacion que presenta la celula hacia estimuloss externos.

Por otro lado, a expresión diferencial es el cambio de los niveles de expresión de uno o mas genes entre dos o varios condiciones. Esto nos permite tener hipotesis más robustas hacerca de los fenomenos a los que esta sometida una celula, ya que la expresión de dos o varios gene que responden de la misma manera o en conjunto hacia cierto estimulo da robustes a nuestras hipotesis biologicas.

El objetivo de este trabajo es evaluar el efecto de la variación genética en el cromosoma Y del ratón sobre el tamaño de los cardiomiocitos y la posible dependencia de tales efectos en niveles de testosterona. Esto con el proposito de determinar si existe expresión diferencial entre genotipos y entre tratamientos, así como para evaluar las diferencias en la respuesta al tratamiento entre los dos genotipos.

## Metodología

El diseño experimental fue el siguiente. Se utilizaron ocho ratones machos adultos de dos cepas, C57BL/6J y C57BL/6J-chrY<A/J/NaJ> , denominadas B y BY de aquí en adelante. De cada cepa (genotipo), cuatro animales fueron castrados y cuatro fueron intervenidos con el mismo procedimiento quirúrjuico, excepto que no se realizó la castración (animales intactos usados como control) . El ARN se hibridizó a BeadChips Illumina MouseRef-8 v2.0 que contienen ocho microarreglos con 25,697 sondas cada uno. Se seleccionaron aleatoriamente 5000 sondas para este tutorial. La tabla con los datos completos está disponible en la base de datos GEO por ID [GSE15354](http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE15354)
 
Se sabe que cuando el cromosoma Y (chrY) de la cepa de ratón C57BL / 6J (abreviado como B) se sustituye por el de ratones A / J (ChrYA), cardiomiocitos de la 'sustitución de cromosoma' resultante C57BL / 6J -la cepa <A> (abreviada como BY) era más pequeña que la de sus contrapartes C57BL / 6J. A la inversa, cuando chrYA de ratones A / J se sustituyó por chrYB, los cardiomiocitos de la cepa A / J-chrYC57> resultante fueron más grandes que en sus contrapartes A / J. Además, utilizamos estas cepas (B y el BY consómico) para comprobar si el origen de la enfermedad también podría estar vinculado a las diferencias en el perfil de la expresión génica en sus ventrículos cardíacos izquierdos en ratones adultos en los que la cirugía simulada (animales intactos) o la castración tienen Realizado a las 3-4 semanas de edad.

Se consideraron transcritos cuando se detectó en al menos el 25% de las sondas en las muestras de todos grupos experimentales utilizando 500 permutaciones. Las pruebas de F se realizó utilizando una estimación de varianza residual por sonda (F1) y una estimación basada en contracción de varianza residual que utiliza información de múltiples sondas (Fs)

Para esto se utilizarón los programas [org.Mm.eg.db v3.8.2](https://bioconductor.org/packages/release/data/annotation/html/org.Mm.eg.db.html) para evaluar los datos crudos, [preprocessCore v3.6](https://bioconductor.org/packages/release/bioc/html/preprocessCore.html) para aplicar una normalización de cuantiles, [maanova v3.9](http://www.bioconductor.org/packages/release/bioc/html/maanova.html) para obtener valores estadisticos entre muestras (Prueba de F), [limma 3.9](https://bioconductor.org/packages/release/bioc/html/limma.html) para visualizar las intereacciones atraves de diagramas de Venn y [topGO v3.6](http://bioconductor.org/packages/release/bioc/html/topGO.html) para hacer pruebas funcionales.

## Resultado

Dentro de los analisis de calidad es posible observar que las sondas catalogadas como malas en calidad presentan menor intensidad de sus contrapartes. Estas sondas de baja calidad pueden llegar a generar resultados dudosos en los analisis por lo que eliminarlas es de crucial importancia para no obtener resultados erroneos.
         
![Diagramas de caja de datos sin procesar en escala log por microarreglo y calidad de sonda](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/figuras/boxplot_raw_probe_qc.png "Boxplot")
Figura 1. Diagramas de caja de datos sin procesar en escala log por microarreglo y calidad de sonda. El ancho de las cajas es proporcional al número de sondas.

Para los datos obtenidos al excluir las zondas de mala calidad se observa que existe una buena calidad dentro de los datos de ambos tratamientos donde destacan un poco más los del tratamiento "C".

![Diagramas de caja de datos en bruto por microarreglo](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/figuras/boxplot_raw_treatment.png "Boxplot por muestras")
Figura 2. Diagramas de caja de datos en bruto por microarreglo. Las cajas están coloreadas según tratamiento.

Para los valores de p calculados en nuestras muestars seleccionadas se observa que tanto los valores F1 como los valores ponderados con muestras semejantes (Fs) son muy similares. por lo que se puede considerar que nuestra muestra suele comportarse de esa manera y es predecible en cierto modo.

![Densidad de la distribución de los valores de p](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/figuras/P-values%20Hist.png "Densidad de la distribución de los valores de p")
Figura 3. Densidad de la distribución de los valores de p. Ptab: tabular, Pvalperm: permutación, F1: prueba de F convencional, Fs: prueba de F con contracción de la varianza usando información de múltiples sondas (técnica para aumentar el poder de la prueba).

Los diagramas de Venn nos muestran que el número de genes con efectos de interacción, pero repartidos ya sea por tratamiento o por genotipo. Es posible observar que la mayor parte de los genes respondieron al tratamiento en el genotipo BY. 

![Genes DE por efectos marginales y de interacción.](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/figuras/vennDiagram_DiffExprs.png "Diagrama de Venn")
Figura 5. Genes DE por efectos marginales y de interacción.

Del mismo modo, se pueden observar más diferencias entre los genotipos en los animales castrados.

![Genes DE por efectos de interacción](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/figuras/vennDiagram_Int.png "Diagrama de Venn")
Figura 6. Genes DE por efectos de interacción, divididos por tratamiento (izquierda) y genotipo (derecha).

## Conclusión
Se encontro diferencia entre la expresion genica de las muestras castradas. Por lo que se pudiera concluir que esta modificacón en los patrones naturales de testosterona genera un cambio en la expresion del gen y por ello son mas propensos aa

## Literatura

+ Llamas B, Verdugo RA, Churchill GA, Deschepper CF. Chromosome Y variants from different inbred mouse strains are linked to differences in the morphologic and molecular responses of cardiac cells to postpubertal testosterone. BMC Genomics 2009 Apr 7;10:150. 

+ 
 
+ 
 
