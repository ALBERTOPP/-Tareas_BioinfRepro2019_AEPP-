# Tarea 7.1
### Expresión diferencial de genes

##### Alberto Esteban Pérez Pedraza
### Profesor
##### Dr. Ricardo Verdugo Laines
--------------------------------------------------
## Introducción
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

El objetivo es evaluar el efecto de la variación genética en el cromosoma Y del ratón sobre el tamaño de los cardiomiocitos y la posible dependencia de tales efectos en niveles de testosterona.

Determinar si existe expresión diferencial entre genotipos.
Determinar si existe expresión diferencial entre tratamientos.
Evaluar las diferencias en la respuesta al tratamiento entre los dos genotipos.
Para obtener más información sobre los datos y los resultados biológicos, consulte (Llamas et al. 2009) . Para un análisis más técnico y una descripción de metodologías estadísticas y diseño experimental, ver (Verdugo et al. 2009) .

## Metodologia
 El conjunto de datos completo está disponible en la base de datos GEO por ID [GSE15354](http://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE15354)
 
Se ensayaron ocho ratones machos adultos de dos cepas, C57BL/6J y C57BL/6J-chrY<A/J/NaJ> , denominadas B y BY de aquí en adelante. De cada cepa (genotipo), cuatro animales fueron castrados y cuatro fueron intervenidos con el mismo procedimiento quirúrjuico, excepto que no se realizó la castración (animales intactos usados como control) . El ARN se hibridizó a BeadChips Illumina MouseRef-8 v2.0 que contienen ocho microarreglos con 25,697 sondas cada uno. Solo se seleccionaron arbitrariamente 5000 sondas para este tutorial
 
Hemos informado previamente que cuando el cromosoma Y (chrY) de la cepa de ratón C57BL / 6J (abreviado como B) se sustituyó por el de ratones A / J (ChrYA), cardiomiocitos de la 'sustitución de cromosoma' resultante C57BL / 6J -la cepa <A> (abreviada como BY) era más pequeña que la de sus contrapartes C57BL / 6J. A la inversa, cuando chrYA de ratones A / J se sustituyó por chrYB, los cardiomiocitos de la cepa A / J-chrYC57> resultante fueron más grandes que en sus contrapartes A / J. Además, utilizamos estas cepas (B y el BY consómico) para comprobar si el origen de la enfermedad también podría estar vinculado a las diferencias en el perfil de la expresión génica en sus ventrículos cardíacos izquierdos en ratones adultos en los que la cirugía simulada (animales intactos) o la castración tienen Realizado a las 3-4 semanas de edad.
 
 Posteriormente 
 se utilizo el comando
Se utilizaron los programas:

org.Mm.eg.db
preprocessCore
maanova
limma
topGO
 
La posición de las matrices, desde A a H, se muestra en el eje x porque las matrices de Illumina pueden tener un efecto de posición, con una mayor intensidad en las primeras posiciones y una más baja en las últimas (Verdugo et al. 2009) . Este fue el caso en este experimento, aunque el efecto no es obvio en el subconjunto de 5000 sondas utilizadas en este tutorial.

Pruebe cada contraste utilizando 200 permutaciones de las muestras. En una situación real se recomiendan al menos 1.000 permutaciones. Las pruebas de F se realizarán utilizando una estimación de varianza residual por sonda (F1) y una estimación basada en contracción de varianza residual que utiliza información de múltiples sondas (Fs)

Contar genes expresados diferencialmente
En este experimento, una pregunta de interés fue cuántos genes responden de manera diferente al tratamiento de la castración en los dos genotipos. En otras palabras, ¿existe un efecto de interacción entre el genotipo y el tratamiento sobre la expresión génica en los cardiomiocitos? En segundo lugar, es interesante evaluar la naturaleza de la interacción. ¿Ambos genotipos responden al tratamiento pero en direcciones opuestas? ¿O el tratamiento tiene un efecto en uno de los genotipos y no en el otro? Para responder a la primera pregunta, se podría contar el número de sondas que muestran un efecto significativo para el contraste Int, es decir, el número de sondas que tienen un FDR por debajo de un umbral para la prueba Int.Pvalperm. Si aún no sabe cómo calcular esto en R, abra el archivo DE_results.csv un editor de hoja de cálculo como Calc OpenOffice y use filtros para calcular este número. Luego trate de hacer esto en R y compare los resultados.

Para responder la segunda pregunta, podemos usar los diagramas de Venn. Queremos contar el número de genes que se seleccionan en cada genotipo, pero solo entre aquellos que muestran un efecto de interacción significativo.

Advierta que los genes están representados por múltiples sondas en esta plataforma de microarreglos. Es una buena idea contar los genes solo una vez, pero hay que decidir cómo contar un gen cuando diferentes sondas dan diferentes señales, es decir, una está diciendo que el gen está seleccionado, mientras que la otra dice que no. Esta plataforma se basó en RefSeq (http://www.ncbi.nlm.nih.gov/RefSeq/), que es una base de datos curada de transcriptos de referencia para genes conocidos y se diseñó para evitar la redundancia (http://www.illumina.com/products/mouseref-8_expression_beadchip_kits_v2.ilmn). Por lo tanto, asumiremos que cada sonda está probando diferentes señales biológicas, y no una medida repetida de la mismo transcripto. Contaremos un gen como seleccionado si se selecciona alguno de los transcriptos (sondas). Para otras plataformas donde las sondas proporcionan mediciones repetidas para la misma transcripción, uno puede querer usar un enfoque de votación o promedios para resumir los resultados a nivel génico.

El segundo tema a considerar es qué hacer con las sondas no anotadas, es decir, aquellas que no se pueden anotar con ningún gen en la base de datos de EntrezGene. Aquí consideraremos cada una de ellos como un gen separado, aunque en una aplicación real, uno puede querer mejorar la anotación del gen utilizando fuentes alternativas como las bases de datos Ensembl o UCSC Genome Browser.

## Resultado
          

![Diagramas de caja de datos sin procesar en escala log por microarreglo y calidad de sonda](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/figuras/boxplot_raw_probe_qc.png "Boxplot")
Figura 1. Diagramas de caja de datos sin procesar en escala log por microarreglo y calidad de sonda. El ancho de las cajas es proporcional al número de sondas.

![Diagramas de caja de datos en bruto por microarreglo](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/figuras/boxplot_raw_treatment.png "Boxplot por muestras")
Figura 2. Diagramas de caja de datos en bruto por microarreglo. Las cajas están coloreadas según tratamiento.

![Densidad de la distribución de los valores de p](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/figuras/P-values%20Hist.png "Densidad de la distribución de los valores de p")
Figura 4. Densidad de la distribución de los valores de p. Ptab: tabular, Pvalperm: permutación, F1: prueba de F convencional, Fs: prueba de F con contracción de la varianza usando información de múltiples sondas (técnica para aumentar el poder de la prueba).

![Genes DE por efectos marginales y de interacción.](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/figuras/vennDiagram_DiffExprs.png "Diagrama de Venn")
Figura 5. Genes DE por efectos marginales y de interacción.

![Genes DE por efectos de interacción](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/figuras/vennDiagram_Int.png "Diagrama de Venn")
Figura 6. Genes DE por efectos de interacción, divididos por tratamiento (izquierda) y genotipo (derecha).

Ambas gráficos en la Figura 6 muestran la misma prueba de dos formas diferentes, es decir, el número de genes con efectos de interacción, pero repartidos ya sea por tratamiento o por genotipo. Debido a que en la práctica estamos mostrando los resultados de cuatro pruebas diferentes (pero relacionadas), el número total de genes seleccionados en cada diagrama puede no ser exactamente el mismo, pero deberían estar de acuerdo en gran medida.

Aunque los números aquí son pequeños porque usamos solo una pequeña muestra de sondas, verá que has más genes respondiendo al tratamiento en el genotipo BY que en el genotipo B. Además, se pueden observar más diferencias entre los genotipos en los animales castrados. Este fue el patrón observado en el conjunto de datos completo también. Ver Figura 4 de (Llamas et al. 2009) 

## Conclusión
Se encontro diferencia entre la expresion genica de las muestras castradas. Por lo que se pudiera concluir que esta modificacón en los patrones naturales de testosterona genera un cambio en la expresion del gen y por ello son mas propensos aa

## Literatura

+ Llamas B, Verdugo RA, Churchill GA, Deschepper CF. Chromosome Y variants from different inbred mouse strains are linked to differences in the morphologic and molecular responses of cardiac cells to postpubertal testosterone. BMC Genomics 2009 Apr 7;10:150. 

+ 
 
+ 
 
