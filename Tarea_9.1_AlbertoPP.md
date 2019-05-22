## **Tarea 9.1** 

#### Alberto Esteban Pérez Pedraza

#### **Encargado**

#### Dra Alicia Masttreta Yanez

### **Ensamblaje de representación reducida de genomas**

#### **Introducción** 

Las nuevas técnicas de secuenciación (NGS) nos han permitido tener una visión más amplia de los procesos y patrones que se han forjado en las diferentes especies a través de su historia evolutiva. La obtención de un genoma completo permite contar la información contenida en los genes así como las regiones que modulan la expresión de los mismos. Sin embargo, no ha sido posible generar la secuencia completa de genomas de gran tamaño en un solo proceso, por lo que se generan fragmentos de la misma y posteriormente se someten a un proceso denominado ensamble. Este proceso trata de descifrar la secuencia genómica a partir de pequeños fragmentos de ADN, donde los fragmentos cortos se unen para formar fragmentos más grandes después de la eliminación de las superposiciones. 

Existen dos técnicas principales para realizar el ensamble. La primera se basa en ensamblar las secuencias a partir de la similitud de las mismas para tratar de generar una secuencia consenso (ensamble de novo). El segundo método consta en  ensamblaje por comparación, donde se utiliza un genoma como referencia para tratar de alinear las secuencias obtenidas. Del mismo modo se han implementado combinaciones donde se complementan estos métodos, donde en ocasiones se obtienen resultados más robustos. 

Los principales retos en el montaje del genoma son los errores de secuenciación, la contaminación por vectores bacterianos y las regiones de secuencias repetitivas. Para tratar de generar la mejor representación del genoma que deseamos se debe someter a diferentes filtros que ayudan a mejorar la calidad de la secuencia consenso. Uno de los filtros más importantes a la hora de realizar los alineamientos es el umbral de agrupación específica. Este hace referencia al porcentaje mínimo de similitud que una secuencia debe tener para ser reconocidas como parte de esa región del genoma (en ipyrad “clust_threshold”). Otro de los parámetros que se han considerado como importante es la cobertura mínima  (en ipyrad  “mindepth_statistical”) a la que se realizarán el llamado de bases, pues esto nos permite corroborar la información de las secuencias y darle peso a nuestra inferencia del genoma.

En este trabajo se harán recomendaciones de como variar estos parámetros en el programa [ipyrad](https://ipyrad.readthedocs.io/), para facilitar la búsqueda de los valores que mejor se ajusten a los datos de interés.

 
#### **Contenido** 

El programa [ipyrad](https://ipyrad.readthedocs.io/) es una herramienta interactiva que nos ayuda a procesar varios tipos de datos genéticos (RAD, ddRAD, GBS, entre otros) permitiendo realizar análisis de genética poblacional e inferencias filogenéticas. La principal función de este programa radica en el alineamiento de las secuencias. Como se mencionó anteriormente, se propone hacer una variación en los valores del **umbral de agrupamiento  (clust_threshold)** y **cobertura mínima (mindepth_statistical)** de la siguiente manera:

14. **Umbral de agrupamiento  (clust_threshold)**
Este es el nivel de similitud que deben presentar las secuencias en para ser reconocidas como homólogas. Este valor debe ingresarse en el param file como un decimal (ejemplo, 0.90). Este valor puede variar en gran medida dependiendo de la especie que se trabaja por lo que evaluar el nivel de similitud óptimo es una tarea de crucial importancia. Se recomienda evaluar a partir del 70% de similitud. Una de las cosas que se debe tener en cuenta es que el uso de valores superiores a 0,95 pueden generar que secuencias homologas no se agrupen, debido a la variación natural y a errores de secuenciación que pueden ser detectados en pasos posteriores (Ns, indeles, errores de secuenciación o polimorfismos). Es por esto que visualizar los datos obtenidos de distintos niveles de umbral nos permitirá tener una mejor idea del valor que debemos utilizar. Esto se efectúa a través del param file en los pasos 3 (secuencias crudas) y 6 (alineamiento maduro) por medio del siguiente comando:

Cambios es en el param file:

```
0.80 ## [14] umbral de agrupación establecido en 85%
0.85 ## [14] umbral de agrupación establecido en 85%
0.90 ## [14] umbral de agrupación establecido en 90%
0.95 ## [14] umbral de agrupación establecido en 85%
```

Comandos de ejecución paso 3 (-s 3):

```
>>> ipyrad -p params-data1-clust80.txt -s 3
>>> ipyrad -p params-data1-clust85.txt -s 3
>>> ipyrad -p params-data1-clust90.txt -s 3
>>> ipyrad -p params-data1-clust95.txt -s 3
```

11. **Cobertura mínima (mindepth_statistical)** 

Un aspecto importante en el alineamiento de las secuencias es el número de veces que cada base del genoma está presente en los reads producidos. Este valor se denomina profundidad de cobertura (depth of coverage) y es uno de los factores determinantes para evaluar la fiabilidad del nucleótido asignado a esa posición del genoma.

La profundidad mínima es el mínimo de reads que debe contener un alineamiento para que las bases llamadas sean consideradas como reales. El programa por default establece este valor en 6, que para la mayoría de las estimaciones de tasas de error razonables es aproximadamente la profundidad mínima a la que se puede distinguir una llamada de base heterocigótica de un error de secuencia. Sin embargo, esto no siempre es real, ya que este valor depende en gran mediad de las regiones del genoma que se están estudiando y de la especie en cuestión, por lo que hacer una búsqueda del valor que mejor optimice los datos es realmente importante para nuestros análisis. Este parámetro se utiliza en los pasos 4 (primer llamado de bases) y 5 (llamado consenso), al igual que los comandos anteriores se realizan a través de cambios en los param file, para ser ejecutados en los pasos subsecuentes. Ejemplo: 

Cambios es en el param file:

```
6 ## [11] establece estadísticas mínimas en 6
10 ## [11] ajustado a 10
```
Comandos de ejecución paso 4 (-s 4):

```
>>> ipyrad -p params-data1- mindepth2.txt -s 4
>>> ipyrad -p params-data1- mindepth3.txt -s 4
>>> ipyrad -p params-data1- mindepth4.txt -s 4
>>> ipyrad -p params-data1- mindepth5.txt -s 4
>>> ipyrad -p params-data1- mindepth6.txt -s 4
>>> ipyrad -p params-data1- mindepth7.txt -s 4
>>> ipyrad -p params-data1- mindepth8.txt -s 4
```

Posteriormente se recomienda visualizar los valores obtenidos al variar estos parámetros para decidir el valor óptimo del set de datos.

#### **Discusión**
Se eligieron estos parámetros como los más importantes sobre el alineamiento de las secuencias ya que, estos parámetros son los que mayor influencia presentan a la hora de obtener la información genética en el alineamiento, pues leves variaciones en los niveles asignados producen un sesgo importante en las muestras. Además de esto se recomienda replicar un par de muestras para averiguar el error promedio obtenido de la secuenciación y del ensamblado, con la finalidad de optimizar el proceso de alineamiento, dependiendo de la especie que se esté estudiando.
#### **Literatura**
•	Aguilar-Bultet, L., & Falquet, L. (2015). Secuenciación y ensamblaje de novo de genomas bacterianos: una alternativa para el estudio de nuevos patógenos. Revista de salud animal, 37(2), 125-132.

•	Eaton, D. A. R., & Overcast, I. (2016). ipyrad: interactive assembly and analysis of RADseq data sets.

•	Jesús Alvarado Valverde. (2016). Ensamble de genoma. 2019, Mayo 21, Conogasi.org Sitio web: http://conogasi.org/articulos/ensamble-de-genoma/

•	Rodríguez-Santiago, B., & Armengol, L. (2012). Tecnologías de secuenciación de nueva generación en diagnóstico genético pre-y postnatal. Diagnóstico Prenatal, 23(2), 56-66.
