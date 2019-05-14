# Tarea 7.2
###  Analisis funcional de datos de microarreglos
##### Alberto Esteban Pérez Pedraza
### Profesor
##### Dr. Ricardo Verdugo Salgado
--------------------------------------------------

## Introducción

Los procesos de expresión génica generalmente depende de familias de genes para su funcionamiento y reproducción, por lo que el observar los niveles de expresion de los genes nos permite detectar grupos que genes que interactuan entre si para llevar a cabo cierta funion que a su vez explica algunas causas de padecimientos y enfermedad genetocas.La expresión diferencial es el cambio de los niveles de expresión de uno o más genes entre dos o varias condiciones. Esto nos permite tener hipotesis más robustas hacerca de los fenomenos a los que esta sometida una celula, ya que la expresión de dos o varios gene que responden de la misma manera o en conjunto hacia cierto estimulo da robustes a nuestras hipotesis biologicas.

El objetivo de este trabajo es detectar familias de genes que actuen en el cromosoma Y del ratón para regular el tamaño de los cardiomiocitos dependientes de los niveles de testosterona de los individuos. Esto nos ayudará a entender de mejor manera este proceso y a buscar alternativas para el tratamiento de este padecimiento en humanos.

## Metodología

Se utilizaron las 5000 sondas seleccionadas aleatoriamente en el ejercicio anterior obtenidas a partir del microarreglo BeadChips Illumina MouseRef-8 v2.0. Posteriormente se escalaron los datos para tener valores similares entre las muestras. 
Se obtuvo la suma de cuadrados de los sets de datos (muestras y sondas) y se generaron gráficos de suma de cuadrados para visualizar el posible número de agrupamientos de genes que pudieran existir.

Una vez identificado el número de posibles clusters que existian entre los dos sets de datos se realizaron particionamientos gerargicos. Primeramente se hizo un particionamiento jerárquico para las muestras con la medida de distancia euclideana. Del mismo modo se realizó un particionamiento jerárquico de las sondas usando el complemento de la correlación de pearson como la medida de distancia. Este metodo nos ayudara a generar valores de soporte boostrap para nuestras hipotesis de agrupamiento. Para esto se utilizó el programa [pvclust v2.0](http://stat.sys.i.kyoto-u.ac.jp/prog/pvclust/). 

## Resultado

Los resultados obtenidos nos muestran que existe cierta segregación entre las familias de genes sometidas a los tratamientos de castracion. Sin embargo, no es posible validar en su totalidad esta hipotesis pues varias de las muestras sometidas al análisis no estan sustentadas fuertemente por los valores de boostrap generados.

En el caso de las muestras se obtuvo un valor un poco bajo para la suma de cuadrados (39616), lo que indica que no existe gran variación dentro de los datos. La grafica de suma de cuadrados por muestra nos muestra que a partir del k=4 existe una disminución muy grande del número de sondas contenidas en cada cluster. Se decidió elegir a K=2 por esta misma razón, ya que al asignar varios clusters como posibles, la mayor parte de las sondas se posicionaron dentro de este agrupamiento. Esto se ve respaldado por los valores de boostrap obtenidos por el software pvclust v2.0, que solo nos arroja dos clusters con valores altos de boostrap. 

         
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
