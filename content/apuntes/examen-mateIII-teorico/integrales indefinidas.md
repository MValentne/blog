+++
date = '2026-07-22T12:28:12-03:00'
draft = false
title = 'Integrales Indefinidas'
author = 'Valentino Mendé'
tags = ["cálculo", "integrales", "cálculo integral"]
categories = ["Matemática"]
+++

Anteriormente hablamos sobre infinidad e indeterminaciones con limites, y dimos cálculo diferencial con derivadas y sus aplicaciones. Ahora introducimos un tema aplicado muy ampliamente en las mastematicas; el [cálculo integral](https://es.wikipedia.org/wiki/Integraci%C3%B3n).

El cálculo integral da introducción a una **función inversa a la derivada**, la [antiderivada](https://es.wikipedia.org/wiki/Integraci%C3%B3n_indefinida) o **integral indefinida** (después hablaremos de la definida).

En términos de Layman, una integral es una función que nos da un valor de salida, y dependiendo el contexto, este puede ser interpretado de diferentes formas. Una forma común, mediante un teorema que presentaremos después, nos permite calcular el área debajo de una curva, lo cual aplicado a funciones da paso a muchas aplicaciones usadas en física, estadística, economía, medicina, etc. Siendo usada para calcular **magnitudes acumulativas**.

# 1: Integrales indefinidas
En este apartado nos dedicaremos al estudio de las integrales indefinidas. Llamamos integral indefinida a la familia de funciones inversas de la derivada. Decimos que es una familia de funciones debido a que para una derivada, existen una infinita cantidad de funciones inversas que dan "solución" a la inversa, por lo que generalizamos esta idea en una *integral indefinida*

# 2: Función primitiva y su notación
Primero que todo, si una función es derivable en cualquier punto, ese punto también admitirá una integral, que no es más que la inversa de la derivada, por lo que podemos pensarlo como:

> *f(x)* es una función. Llamamos *F(x)* a la integral indefinida de *f(x)*. La derivada de la antiderivada nos resulta en la función original *f(x)*, por lo que: *F'(x) = f(x)*

Ejemplificado visualmente:
![ejemplo-integral-indefinida.png](https://i.postimg.cc/W3tBvL20/ejemplo-integral-indefinida.png)

Por lo que introducimos esta nueva notación para la integral. Ahora, mencionamos que hay una familia de funciones para la antiderivada, esto se da de la siguiente manera:

![primitiva-de-una-funcion.png](https://i.postimg.cc/wxfVSyPD/primitiva-de-una-funcion.png)

Se puede apreciar que el resultado de cada una de las integrales deja una *C*, y que al final esas *C's* se unen en una *C* genérica, eso representa cualquier valor real, por lo que se incluye en la expresión final a toda la familia de funciones inversas posibles de *f'(x)*. Cada valor que tome *C* implica una primitiva distinta, por lo que:

> Al conjunto de todas las funciones primitivas de *f(x)* se le llama *integral indefinida de f(x)*

# 3: Integración inmediata
Se denominan integrales inmediatas a las que resultan **evidentes** por ser el integrando la derivada de una función conocida. Dígase, soluciones triviales. De aquí viene, de igual forma que con las derivadas, el uso popular de [tablas de integración](https://es.wikipedia.org/wiki/Anexo:Integrales), que abstraen el tener que resolver manualmente cada integral, por lo que se agiliza bastante el trabajar con integrales.

Aquí algunas integrales comunes:

![integrales-comunes.png](https://i.postimg.cc/JnmmJ4WW/integrales-comunes.png)

También es relevante el comportamiento para una función compuesta:

![integral-de-una-funcion-compuesta.png](https://i.postimg.cc/NGZDxN0r/integral-de-una-funcion-compuesta.png)

Lo cual nos es fundamental a la hora de usar el método de sustitución, del cual hablaremos después.

# 4: Propiedades de la integral indefinida
Las propiedades serán muy importantes al trabajar con integrales, ya que simplifican notioramente el manejo de expresiones que parecen complicadas en primera instancia.

![propiedades-de-las-integrales-indefinidas.png](https://i.postimg.cc/jq8H8MSt/propiedades-de-las-integrales-indefinidas.png)

# 5: Métodos de integración
Trabajaremos con algunos métodos de integración, que a grandes razgos consisten en transformar una expresión para después integrar en algo más sencillo de operar.

## Integración por descomposición en sumandos.
Consiste en separar una expresión en sumas de integrales más pequeñas, es simplemente aplicar la propiedad que vimos anteriormente, por ejemplo:

![descomposicion-en-sumandos.png](https://i.postimg.cc/595MCk1P/descomposicion-en-sumandos.png)

## Integración por cambio de variable o sustitución.
Esta es mi favorita en lo personal, ya que demanda de cierto pensamiento para determinar algebraicamente que es lo mejor a sustituir. 

![sustitucion.png](https://i.postimg.cc/L5PkJZrn/sustitucion.png)

Se pone bastante interesante cuando tienes que jugar algebraicamente con la expresión derivada *du*, hay veces en las que no es tan trivial la solución, por lo que uno tiene que usar artificios algebraicos para solucinar y es bastante agradable.

## Integración por partes.
Y bienvenida sea **la famosa vaca vestida de uniforme**! De aquí surge un famoso mnemotécnico que facilita el recordar la siguiente fórmula:

![vaca-vestida-de-uniforme.png](https://i.postimg.cc/Gtn8SgSN/vaca-vestida-de-uniforme.png)

> *"Un día vi una vaca sin cola vestida de uniforme"*

Esta es una identidad muy frecuente a la que podemos llegar con sustitución, reglas de integración y un poco de álgebra: 

![por-partes.png](https://i.postimg.cc/MTB2p9KX/por-partes.png)

Es bastante sencillo, ya que se llega a la forma indicada por la fórmula y solo queda acomodar para dejar prolijo, aunque no es de vital importancia. Puede ser también que se presente un escenario en el que se tenga que volver a integrar usando el mismo método.

También es posible un **escenario cíclico**, en el que el usar el método resulta en una expresión idéntica a la original, es un caso interesante, por lo que a continuación ejemplifico con esto mismo: 

![por partes](https://i.ibb.co/spQvdgst/por-partes.png)

Se puede apreciar como llegamos a la expresión original partiendo de la forma de la integral por partes, entnces es importante detectar que estamos cayendo en un ciclo para no volver a integrar sin sentido. Creamos una igualdad y resolvemos la ecuación.

## Integración de funciones racionales.
En este apartado tratamos con funciones de la forma *f(x) / g(x)*, donde ambas *f(x)* y *g(x)* son funciones polinómicas, por lo que podemos asignarles grado *m* y *n* respectivamente. Por lo que se dividen en dos categorías, **propias e impropias**, ahora veremos como tratar con cada una. 

Empezando por las **propias**, su grado *m > n*, por lo que el **numerador sera de mayor grado**. El método consiste en descomponer en fracciones simples, a lo que se suele llamar **Cover Up Method**:

{{<youtube fgPviiv_oZs>}}

A continuación, un ejemplo de esto:

![raíces reales simples](https://i.ibb.co/Pvyp5JHV/raices-reales-simples.png)

Descompusimos en raíces simples, usamos Cover Up para determinar los valores de A y B, y resolvimos la intergal trivialmente.

Ahora, pasamos a ver **racionales con raíces reales múltiples**, donde si bien la idea es similar, cambia el juego con el denominador:

{{<youtube TdDCzoUwvnY>}}

Un ejemplo de esto: 

![raíces reales múltiples](https://i.ibb.co/8nLFVp20/raices-reales-multiples.png)

Donde la idea es llegar a una ecuación o un sistema de ecuaciones para encontrar los valores de *A*, *B*, *C*, ..., para después resolver trivialmente la integral. Cable recordar que podemos probar con diversos valores de *x* para resolver la ecuación, yo inicialmente escogí *x = 5* ya que es raíz.

Otro ejemplo:

![raíces reales múltiples 2](https://i.ibb.co/DfDtVfxF/raices-reales-multiples-2.png)

Y por último, abordamos **raíces parciales imaginarias**, donde no tenemos factores reductibles. 

{{<youtube OsFW_cxMie4>}}

Un ejemplo de como resolver, aunque a partir del como acomodar la forma, es un proceso similar a lo que venimos viendo.

![raíces imaginarias simples](https://i.ibb.co/1GbDsG9N/raices-imaginarias-simples.png)

## Integración de funciones trigonométricas.
Para lidiar con funciones trigonométricas, usualmente tenemos que recurrir a [identidades trigonométricas](https://es.wikipedia.org/wiki/Anexo:Identidades_trigonom%C3%A9tricas) particulares para poder solucionar las integrales de forma trivial, es sencillo una vez que conocemos algunas de estas.

Un método para resolver ciertos escenarios es mediante la paridad del exponente de las funciones, por ejemplo:

![identidades de paridad](https://i.ibb.co/TXg9xh3/identidades-de-paridad.png)

Son identidades fundamentales para trabajar mediante sustitución en algunos escenarios, a continuación desarrollo alguno:

* Ejemplificamos con un ejercicio en el que tenemos la forma de la integral de un producto de *seno* y *coseno*, uno tiene exponente par, el otro impar.

![trigonométricas paridad](https://i.ibb.co/xqxHnZzx/trigonometricas-paridad.png)

* En este otro ejemplo, ambos exponentes son enteros positivos pares, por lo que usaremos las identidades que mostramos más arriba en este apartado.

![trigonométricas paridad 2](https://i.ibb.co/zW1yR3bG/trigonometricas-paridad-2.png)

Ahora, como tratamos con una integral compuesta por **el producto** de funciones trigonométricas? Nuevamente, utilizamos identidades de la siguiente forma:

![trigonométricas productos](https://i.ibb.co/9jZ5YTM/trigonometricas-productos.png)

*Ahora ejemplificamos un ejercicio solucionado mediante el uso de estas.

![trigonométricas producto ejemplo](https://i.ibb.co/GKfXggR/trigonometricas-producto-ejemplo.png)

Lo cual es utilizar las identidades que vimos y jugar con álgebra y propiedades de la integral, nada del otro mundo.

> Originalmente pensaba en incluir **Integrales Definidas** dentro de esta misma publicación, pero viendo lo extenso que se está haciendo esto, voy a dividir el tema en dos partes. Véase el siguiente post, Integrales Definidas, para ver la aplicación práctica de todo lo que hemos dado en esta parte.
