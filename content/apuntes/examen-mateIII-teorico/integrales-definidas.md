+++
date = '2026-07-24T15:40:37-03:00'
draft = false
title = 'Integrales Definidas'
author = 'Valentino Mendé'
tags = ["cálculo", "integrales", "cálculo integral"]
categories = ["Matemática"]
+++

Las [integrales definidas](https://www.superprof.es/apuntes/escolar/matematicas/calculo/integrales/integral-definida.html) nos permiten llevar a la práctica todo lo visto en el apartado de **Integrales Indefinidas**, ya que en vez de ver toda la familia de antiderivadas posibles para una función *f(x)*, empezamos a ver que la integral nos devuelve un valor puntual.

Este tipo de integrales nos permite calcular **el área comprendida** entre dos puntos en una curvatura, por lo que tiene una amplia utilidad al calcular áreas y **valores acumulativos** en general.

Me gusta pensar en integrales indefinidas como una introducción a las herramientas para agilizar el uso de integrales definidas; en mucha bibliografía se habla primero de la integral definida porque es un poco más intuitiva la idea, pero para tener una buena base me parece relevante conocer las integrales indefinidas.

# 1: Sumatorias
Nos resulta útil entender como funciona una [sumatoria](https://es.wikipedia.org/wiki/Sumatorio) para poder introducir conceptos más adeltane para entender formalmente que es una integral definida, por lo que brevemente hablaremos sobre esta herramienta. 

Una sumatoria consiste en una sucesión de sumandos, representada con la letra griega *sigma*, nos permite sumar desde i hasta n cantidad de veces una expresión.

Para verlo de una forma más intuitiva:

<img src="https://i.ibb.co/5WLVR4C0/sumatoria.png" alt="sumatoria" border="0">

Personalmente me gusta verlo como un ciclo for, por lo que podemos verlo intuitivamente con lógica de programación.

Algunas propiedades simples y relevantes:

<img src="https://i.ibb.co/7Jd548gz/propiedades-sumatorias.png" alt="propiedades sumatorias" border="0">

Y además cabe aclarar que para diferentes sumatorias (diferente parámetro de la función sumatoria), existe una función correspondiente o *fórmula* que da exactamente el mismo resultado, pero a mi parecer es tedioso recurrir a dichas funciones cuando se puede trabajar directamente con la sumatoria. (Pero eso no significa que sean inútiles, ya que por ejemplo, en un programa de computadora puede llegar a ser más óptimo el operar una función que iterar n cantidad de veces una expresión.)

Ejemplos de estas funciones son:

<img src="https://i.ibb.co/1ffXMCPN/formulas-sumatorias.png" alt="formulas sumatorias" border="0">

La idea no es memorizar dichas funciones, sino saber que hay una función correspondiente a cada valor expresado en función sumatoria. 

# 2: El problema del cálculo del área
Empezamos a meter mano en un tema de interés mayor para las integrales definidas, el calcular áreas bajo la curva de una función. 

Supongamos que tenemos una función *f(x)* y un área correspondiente en un intervalo *[a,b]* perteneciente a *x*, con el área *A*:

<img src="https://i.ibb.co/7JT9h1Gp/area-bajo-curva.png" alt="área bajo curva" border="0">

La idea con la que los matemáticos del pasado solucionaban el problema de calcular el área debajo de la función era con una sumatoria; esta gente llego a la idea de que bajo la curva, podían hacer una aproximación del área comprendida entre dos puntos y su imagen, a partir de la suma del área de n rectángulos. 

Entonces es fácil visualizar esta sumatoria:

<img src="https://i.ibb.co/C5YSSzcR/la-idea.png" alt="la idea" border="0">

Donde *delta x* sera tomada como la base del rectángulo, y su imagen sera la altura, por lo que es la sumatoria de productos entre base y altura.

También es relevante el percatar que hay un **error** en el valor del área debido a la precisión en los rectángulos, por lo que la idea es que los rectángulos sean lo más delgados posibles, y que haya una cantidad masiva de ellos, por lo que se va a formar una figura prácticamente idéntica al área verdadera de la curvatura comprendida entre *a* y *b*.

> Por lo que queremos decir que *n -> inf* y que *delta x -> 0*

Entonces, el proceso entero toma esta forma:
1. Se divide el intervalo *[a,b]* en *n* subintervalos *[x[k-1], x[k]]*, con *k = 1, 2, 3, 4, ...,n*,donde *x[0] = a* y *x[k] = b*.
2. Se denota la longitud de cada subintervalo (base de cada triángulo) con *delta x[k]*, y los intervalos no necesariamente tienen la misma amplitud.
3. Elegir la imagen de cada intervalo.
4. Formar el producto *f(x[k]).deltax[k]*, que es el área de cada rectángulo generado.
5. Se forma la sumatoria para obtener una aproximación del valor de A.

Con ese procedimiento, ahora se puede formular formalmente una definición de integral definida.

> A esta sumatoria se le conoce como [Sumatoria de Riemann](https://es.wikipedia.org/wiki/Suma_de_Riemann)

# 3: Definición de la integral definida
Vamos a ir trabajando la definición partiendo de lo que vimos anteriormente:

![definicion-integral-definida.png](https://i.postimg.cc/Fs9c6pYy/definicion-integral-definida.png)

Si bien podemos tener subintervalos de cualquier tamaño, es práctico hacer que todos sean del mismo tamaño y que el último subintervalo tenga como extremo derecho directamente al valor *b*, así podemos trabajar más sencillamente con la sumatoria de áreas.

Para tener esa frontera en el último subintervalo haciemos lo siguiente, teniento en cuenta que *x[0] = a*:

![frontera-del-subintervalo.png](https://i.postimg.cc/zv3NL4dk/frontera-del-subintervalo.png)

Sustituyendo algunos valores llegamos a la siguiente definición:

![definicion-integral-definida-2.png](https://i.postimg.cc/htndmrBv/definicion-integral-definida-2.png)

Y un ejemplo práctico del uso de esta definición:

![definicion-integral-definida-ejemplo.png](https://i.postimg.cc/P5K0sSfw/definicion-integral-definida-ejemplo.png)

Lo cual empieza a ser tedioso (no imposible), por lo que parte del **Teorema fundamental del cálculo** (todavía no hablamos de esto) propone una forma más intuitiva de resolver estas áreas, y sea bienvenida la definición **moderna** de integral definida.

> Denótese ||P|| a la amplitud del subintervalo más grande.

![definicion-moderna-de-integral-definida.png](https://i.postimg.cc/9X4d32jV/definicion-moderna-de-integral-definida.png)

# 4: Propiedades de las integrales definidas

![propiedades-integral-definida.png](https://i.postimg.cc/DwsW5fsX/propiedades-integral-indefinida.png)

Además, algunas notas relevantes a tener en cuenta:
* Una integral indefinida es una familia de funciones de *x*, una integral definida es un valor perteneciente a los reales.
* Si el límite superior de una integral definida es una variable *x*, entonces la integral es una función de *x*.
* La integral definida es un número fijo, siempre y cuando *a* y *b* sean números fijos también.

# 5: Teorema del valor medio 
Este teorema nos dice que hay un punto medio en la función, cuyo rectángulo generado por su altura *f(c)*, y su base formada por *b - a*, tendrá un área igual al área formada por la curvatura en el intervalo [a,b]. 

![Teorema-del-valor-medio-integrales.png](https://i.postimg.cc/XJmS2CTx/Teorema-del-valor-medio-integrales.png)

Y un ejemplo práctico para encontrar ese *f(c)* en la función:

![buscando-el-valor-medio.png](https://i.postimg.cc/K88b8xrL/buscando-el-valor-medio.png)

Y la demostración simple de esto:

De igual forma, para mayor claridad:

{{<youtube bB2y6-Pjtn0>}}

# 6: Teorema fundamental del cálculo
El elemento principal del teorema es la integral como inversa a la derivada. De ahí surge todo el estudio del cálculo integral.

El teorema se divide en dos formas, la primera tratando de la integral definida como área bajo la curva mediante una función acumulada. La segunda, la [Regla de Barrow](https://www.superprof.es/apuntes/escolar/matematicas/calculo/integrales/regla-de-barrow.html) hablando de como calcular esta área de forma sencilla.

![primera-parte-del-teorema.png](https://i.postimg.cc/HnPNWc0k/primera-parte-del-teorema.png)

Con lo que definimos la integral como una función acumulativa del área debajo de la curvatura de la función.

![primera-parte-del-teorema-2.png](https://i.postimg.cc/g2h7d0nT/primera-parte-del-teorema-2.png)

Y definimos la integral y la derivada como inversas.

La segunda forma del teorema nos sirve para abstraer las sumatorias de Riemann, ya que llegamos a una forma mucho más amigable a la hora de resolver problemas:

![segunda-parte-del-teorema.png](https://i.postimg.cc/8c9jR4dt/segunda-parte-del-teorema.png

Entonces, podemos resolver algún problema de forma trivial, como el siguiente:

![ejemplo-aplicacion-segunda-forma.png](https://i.postimg.cc/6QXzVLYZ/ejemplo-aplicacion-segunda-forma.png)

# 7: Aplicaciones de la integral definida

![ejemplo-aplicacion-1.png](https://i.postimg.cc/HxMCVCWf/ejemplo-aplicacion-segunda-forma-1.png)

![ejemplo-aplicacion-2.png](https://i.postimg.cc/pVDHvx6L/ejemplo-aplicacion-segunda-forma-2.png)

# 8: Integrales impropias
Por último, hablemos un poco de integrales impropias. Anteriormente mencionamos en una nota que una integral tiene que tener por extremo valores fijos para resultar en un valor fijo, pero que ocurre cuando esos valores resultan en indeterminaciones tales como el infinito?

![integrales-impropias.png](https://i.postimg.cc/pLdrypNH/integrales-impropias.png)

En los primeros dos casos, la integral impropia converge si el límite existe, de lo contrario diverge. En la tercera, la integral a la izquierda diverge si la integral a la derecha diverge.

> Convergencia significa que se acerca a un valor puntual, divergencia implica que tiene un crecimiento infinito y no se acerca a ningún valor en particular.
