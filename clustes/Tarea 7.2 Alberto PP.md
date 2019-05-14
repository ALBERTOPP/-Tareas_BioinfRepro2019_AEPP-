# Tarea 7.2
###  Analisis funcional de datos de microarreglos
##### Alberto Esteban Pérez Pedraza
### Profesor
##### Dr. Ricardo Verdugo Salgado
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
         
Se obtuvo un valor un poco bajo para la suma de cuadrados de las muestras (39616), lo que indica que no existe una variación muy grande dentro de los datos. La grafica de suma de cuadrados por muestra nos muestra que a partir del k=4 existe una disminución muy grande del número de sondas contenidas en cada cluster. Se decidió elegir a K=2 por esta misma razón, ya que al asignar varios clusters como posibles, la mayor parte de las sondas se posicionaron dentro de este agrupamiento. Esto se ve respaldado por los valores de boostrap obtenidos por el software pvclust v2.0, que solo nos arroja dos clusters con valores altos de boostrap. 

         
![Suma de cuadrados para las muestras](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/clustes/Captura%20de%20pantalla%20de%202019-05-13%2019-03-46.png "Suma de cuadrados para las muestras")

**Figura 1.** Suma de cuadrados para las muestras.

Los resultados graficados dentro del árbol generado para las muestras muestran cierta tendencia a segregar los individuos castrados de los intactos. Sin embargo, existe cierta incertidumbre entre los dos grupos principales. Por lo que este árbol no da resultados concluyentes del efecto de este tratamiento sobre las muestras. 

![Árbol generado para las muestras estudiadas](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/clustes/Captura%20de%20pantalla%20de%202019-05-13%2019-25-24.png "Árbol generado para las muestras estudiadas")

**Figura 2.** Árbol generado para las muestras estudiadas.

![Suma de cuadrados para las sondas](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/clustes/Captura%20de%20pantalla%20de%202019-05-13%2019-05-17.png "Suma de cuadrados para las sondas")

**Figura 3.** Suma de cuadrados para las sondas.



![Árbol generado para las sondas estudiadas](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/clustes/Captura%20de%20pantalla%20de%202019-05-11%2012-45-50.png "Árbol sondas")

**Figura 4.** Árbol generado para las sondas estudiadas.

## Conclusión
Se encontro una diferencia significativa entre la expresion genica de las muestras castradas. Por lo que se pudiera concluir que esta modificacón en los patrones naturales de testosterona genera un cambio en la expresión del gen y por ello se produce el aumentó del tamaño de los cardiomiocitos. Varios genes cardiacos respondieron a la testosterona, lo que indica que el cromo puede estar relacionado con las diferencias morfológicas de las células cardiacas de ratones adultos, a través de la interferencia con los eventos reguladores de andrógenos. Se recomienda hacer una revisión de las muestras totales para ver si se conserva el patrón, así como para tratar de detectar interacciones no consideradas con nuestra muestra límitada. 

## Literatura

+ Llamas B, Verdugo RA, Churchill GA, Deschepper CF. Chromosome Y variants from different inbred mouse strains are linked to differences in the morphologic and molecular responses of cardiac cells to postpubertal testosterone. BMC Genomics 2009 Apr 7;10:150. 
