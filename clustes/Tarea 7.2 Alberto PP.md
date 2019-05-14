# Tarea 7.2
###  Análisis funcional de datos de microarreglos
##### Alberto Esteban Pérez Pedraza
### Profesor
##### Dr. Ricardo Verdugo Salgado
--------------------------------------------------

## Introducción

La expresión diferencial es el cambio de los niveles de expresión de uno o más genes, entre dos o varias condiciones. Los procesos de expresión génica generalmente depende de familias de genes para su funcionamiento, por lo que el observar los niveles de expresion de estas familias permite explicar algunas causas de padecimientos y enfermedad geneticas. Esto nos permite tener hipotesis más robustas hacerca de los fenomenos a los que esta sometida una celula.

El objetivo de este trabajo es detectar familias de genes que actuen diferencialmente de los niveles de testosterona de los raatones en el cromosoma Y, las cuales ayudan a regular el tamaño de los cardiomiocitos del corazon de los roedores. Esto nos ayudará a entender de mejor manera este proceso y a buscar alternativas para el tratamiento de este padecimiento en humanos.

## Metodología

Se utilizaron las 5000 sondas seleccionadas aleatoriamente en el ejercicio anterior obtenidas a partir del microarreglo BeadChips Illumina MouseRef-8 v2.0. Posteriormente se escalaron los datos para tener valores similares entre las muestras. 
Se obtuvo la suma de cuadrados de los sets de datos (muestras y sondas) y se generaron gráficos de suma de cuadrados para visualizar el posible número de agrupamientos de genes que pudieran existir.

Una vez identificado el número de posibles clusters que existian entre los dos sets de datos se realizaron particionamientos jerárquicos. Primeramente se hizo un particionamiento jerárquico para las muestras con la medida de distancia euclideana. Del mismo modo se realizó un particionamiento jerárquico de las sondas usando el complemento de la correlación de pearson como la medida de distancia. Este metodo nos ayudara a generar valores de soporte boostrap para nuestras hipotesis de agrupamiento. Para esto se utilizó el programa [pvclust v2.0](http://stat.sys.i.kyoto-u.ac.jp/prog/pvclust/), el cual genera valores de soporte a partir de permutaciones para dar robustes al análisis. 

## Resultado

Los resultados obtenidos nos muestran que existe cierta segregación entre las familias de genes dependiendo de los tratamientos a los que fueron sometidos (castración e intactos). Sin embargo, no es posible validar en su totalidad esta hipotesis pues varias de las muestras sometidas al análisis no estan sustentadas fuertemente por los valores de boostrap generados.

En el caso de las muestras se obtuvo un valor un poco bajo para la suma de cuadrados (39616), lo que indica que no existe gran variación dentro de los datos. La grafica de suma de cuadrados por muestra nos muestra que a partir del k=4 existe una disminución muy grande del número de sondas contenidas en cada cluster. Se decidió elegir a K=2 por esta misma razón, ya que al asignar varios clusters como posibles, la mayor parte de las sondas se posicionaron dentro de este agrupamiento. Esto se ve respaldado por los valores de boostrap obtenidos por el software pvclust v2.0, que solo nos arroja dos clusters con valores altos de boostrap. 

         
![Suma de cuadrados para las muestras](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/clustes/Captura%20de%20pantalla%20de%202019-05-13%2019-03-46.png "Suma de cuadrados para las muestras")

**Figura 1.** Suma de cuadrados para las muestras.

Los resultados graficados dentro del árbol generado para las muestras muestran cierta tendencia a segregar los individuos castrados de los intactos. Sin embargo, existe cierta incertidumbre entre los dos grupos principales. Por lo que este árbol no da resultados concluyentes del efecto de este tratamiento sobre las muestras. 

![Árbol generado para las muestras estudiadas](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/clustes/Captura%20de%20pantalla%20de%202019-05-13%2019-25-24.png "Árbol generado para las muestras estudiadas")

**Figura 2.** Árbol generado para las muestras estudiadas.

El resultado obtenido por la suma de cuadrados para las sondas fue de 263.8735, este valor es superior al obtenido por las muestras, lo que es congruente ya que es una mayor cantidad de datos las que se sometieron a este análisis, por lo que la variación es mayor. Por otro lado la grafica de suma de cuadrados para todas las sondas es un tanto más variante,ya que a pesar de tener esa misma tendencia de disminuir en las sondas captadas cuando se incrementa el número de k, existen picos en K=8 y K=14 que nos pudiera decir que esos agrupamientos podrían ser una opción valida para este set de datos. Sin embargo, al hacer el plot de las sondas solamente se identifican claramente dos grupos. Estadisticamente se detectaron estos mismos clusters (K=2) y los valores de boostrap respaldan esta suposición.

![Suma de cuadrados para las sondas](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/clustes/Captura%20de%20pantalla%20de%202019-05-13%2019-05-17.png "Suma de cuadrados para las sondas")

**Figura 3.** Suma de cuadrados para las sondas.

Los resultados del árbol obtenido para las sondas generado a partir de distancias de correlación de Pearson nos muestran dos grandes grupos que se separan claramente, sin embargo, no es posible visualizar si corresponden a los mismos del árbol anterior ya que se satura por el gran numero de sondas análizadas.

![Árbol generado para las sondas estudiadas](https://github.com/ALBERTOPP/Tareas_BioinfRepro2019_AEPP/blob/master/clustes/Captura%20de%20pantalla%20de%202019-05-11%2012-45-50.png "Árbol sondas")

**Figura 4.** Árbol generado para las sondas estudiadas.

## Conclusión
Se aprecia cierta diferenciación de la expresión genica de los tratamientos elejidos, sin embargo, no se encontro una diferencia significativa entre la expresion de las familias de genes de las muestras castradas y las intactas. Se pudiera concluir que esta modificacón en los patrones naturales de testosterona ha generado un cambio en la expresión de los genes que interactuan en este proceso, pero hace falta robustecer el análisis sometiendo a prueba el resto de las sondas para evidenciar claramente el aumentó del tamaño de los cardiomiocitos debido a la respuesta de los tratamientos. Se recomienda hacer una revisión de las muestras totales para ver si se conserva el patrón, así como para tratar de detectar interacciones no consideradas con nuestra muestra límitada. 

## Literatura

+ Llamas B, Verdugo RA, Churchill GA, Deschepper CF. Chromosome Y variants from different inbred mouse strains are linked to differences in the morphologic and molecular responses of cardiac cells to postpubertal testosterone. BMC Genomics 2009 Apr 7;10:150. 

