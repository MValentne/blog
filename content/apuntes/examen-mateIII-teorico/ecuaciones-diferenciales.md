+++
date = '2026-07-26T14:10:53-03:00'
draft = false
title = 'Ecuaciones Diferenciales'
author = 'Valentino Mendé'
tags = ["cálculo", "álgebra"]
categories = ["Matemática"]
+++

Esta es la ultima unidad contenido de examen, por delante quedan algunos otros temas que serán vistos por interés propio; el enfoque de estudio principal llega hasta este capítulo (inclusivo).

Las ecuaciones diferenciales toman concepto de la derivada y la integral para resolver, mediante álgebra, ecuaciones en las que no encontramos el valor de una variable, sino que una función en concreto. A lo largo del post referenciare el siguiente video, que me parece bastante completo:

{{<youtube MdKOjS8-oNw>}}

El estudio de las ecuaciones diferenciales se extiende más allá de lo que se puede dar en un curso cuatrimestral centrado en análisis matemático, ya que es una área de estudio por sí sola. Nosotros nos centraremos en algunos aspectos tirando a prácticos para entender conceptualmente que es una ecuación diferencial.

# 1: Introducción a las ecuaciones diferenciales
Una ecuación diferencial no toma como incógnita un valor, sino que una función. Se llaman ecuaciones diferenciales debido a que no incluyen solamente el valor de la función incógnita, sino que también a la derivada de esta función.

Existen muchos tipos de ecuaciones diferenciales, ya que es un campo grande y no hay una solución genérica para cada tipo, dígase, cada uno usa una metodología distinta.

> De ahora en adelante nos conviene utilizar *y* en vez de *f(x)* para facilitar la notación.

![en-que-consiste-una-ecuacion-diferencial.png](https://i.postimg.cc/FsnWZgcG/en-que-consiste-una-ecuacion-diferencial.png)

Entonces podríamos tener algo como esto:

![definicion-de-ED.png](https://i.postimg.cc/xTh246d9/definicion-de-ED.png)

Entonces, en pocas palabras decimos que una ED es una ecuación con al menos una derivada para la variable dependiente con respecto a por lo menos una variable independiente.

Estas ecuaciones se pueden clasificar mediante tres métricas:
1. Tipo
2. Grado / Orden
3. Linealidad

# 2: Clasificación por tipo
A aquellas que llamamos [EDOs](https://es.wikipedia.org/wiki/Ecuaci%C3%B3n_diferencial_ordinaria) (Ecuaciones Diferenciales Ordinarias), cuentan con:
* Una sola variable independiente
* Y una o más derivadas respecto de tal variable.
* Contiene solo derivadas ordinarias

![Ejemplo-de-EDO.png](https://i.postimg.cc/HnWyFpBW/Ejemplo-de-EDO.png)

> Y nos estaremos centrando principalmente en las EDOs, por lo que no nos son tan relevantes las EDPs para este estudio.

A aquellas que llamamos [EDPs](https://es.wikipedia.org/wiki/Ecuaci%C3%B3n_en_derivadas_parciales) (Ecuaciones Diferenciales Parciales), cuentan con:
* Contiene derivadas parciales de **una o más** variables dependientes
* Sus variables son dependientes de **dos o más** variables independientes.

![Ejemplo-de-EDP.png](https://i.postimg.cc/sDhjykqz/Ejemplo-de-EDP.png)

# 3: Breve explicación de la notación de Leibniz
A lo largo de esta unidad estaremos usando mucho la notación de Leibniz, por lo que es importante hacer aclaraciones sobre esta:

![Tipos-de-notaciones.png](https://i.postimg.cc/bNDxPvqm/Tipos-de-notaciones.png)

Por lo que nos resulta útil jugar con la identidad de *y' = dy/dx* para informalmente jugar algebraicamente con los diferenciales.

# 4: Clasificación por orden
El **orden** de una ED (ya sea EDO o EDP), es el valor mayor *n* en una derivada, dígase, el valor máximo de *n* en una expresión *y^n*.

El **grado** grado de una ED, es el **grado algebraico** de la derivada de mayor orden.

![EDO-2ndo-orden.png](https://i.postimg.cc/8CRnw5qb/EDO-2ndo-orden.png)

Para pensar en el orden de una ED, es tan simple como ver el grado de la derivada, dígase: *y', y'', y''', y^n, ...*

A veces se muestran las EDOs en **forma diferencial**, donde simplemente es igualar a 0 y agrupar en sus diferenciales correspondientes.

![EDO-forma-diferencial.png](https://i.postimg.cc/PxrzMtGm/EDO-forma-diferencial.png)

También tenemos las formas **general** y **normal** de orden *n* de una EDO:

![EDO-forma-general-y-normal.png](https://i.postimg.cc/MTqxPFt7/EDO-forma-general-y-normal.png)

Que son formas comunes que usamos todo el tiempo, y nótese la relación entre ambas (en los ejemplos usamos la misma función y es un despeje simple la diferencia).

Ejemplos de determinación de grado y orden:

![EDO-orden-y-grado.png](https://i.postimg.cc/MH9X7QkL/EDO-orden-y-grado.png)


# 5: Clasificación por linealidad
Para que una EDO sea lineal, debe cumplir con lo siguiente:
1. Que todas sus derivadas (*y',y'',y''', ... y^n*) estén elevadas exclusivamente a la potencia 1.
2. No hay productos entre *y* y sus derivadas, ni entre derivadas de distinto orden.
3. No hay funciones [no lineales](https://www.ck12.org/flexi/es/grado-8/resolver-sistemas-lineales-mediante-graficas/cual-es-un-ejemplo-de-una-funcion-no-lineal/) que dependan de *y* (sí dependen de x, está bien).
4. Los coeficientes *a[i]* pueden depender de *x* libremente. (no rompe linealidad)

Si se incumple con cualquiera de esas reglas, clasificamos como EDO no lineal. Se dan de la siguiente forma:

![EDO-linealidad.png](https://i.postimg.cc/SQz7fQjH/EDO-linealidad.png)

Y algunas categorizaciones más con base a linealidad:

![EDO-linealidad-ejemplos.png](https://i.postimg.cc/CMCvyHpQ/EDO-linealidad-ejemplos.png)

# 6: Solución formal de una EDO
La solución de una EDO es una función que al reemplazar su valor en la función da una solución. Hay distintos tipos de soluciones. 

Una EDO puede tener:
* Infinitas soluciones
* Una única solución
* Ninguna solución

Vuelvo a usar esta imagen para aclarar la ultima etapa.

![en-que-consiste-una-ecuacion-diferencial.png](https://i.postimg.cc/FsnWZgcG/en-que-consiste-una-ecuacion-diferencial.png)

Nosotros podemos buscar la solución de la EDO **como se nos ocurra**, inclusive mediante fuerza bruta, aunque no es tan inteligente ni metódico, ya que sigue siendo solución. Lo relevante es poder probar que la solución a la que llegamos es realmente la solución. 

Por ejemplo, demostremos esta solución a la ecuación dada:

![EDO-comprobacion-de-solucion.png](https://i.postimg.cc/Lsnyrnzc/EDO-comprobacion-de-solucion.png)

Otro ejemplo en el que no se verifica:

![EDO-comprobacion-de-solucion-2.png](https://i.postimg.cc/mgbZNGQH/EDO-comprobacion-de-solucion-2.png)

Y ahora hagamoslo a la inversa, tenemos una función y queremos encontrar una ecuación diferencial que la satisfaga:

![EDO-creacion-de-la-ecuacion.png](https://i.postimg.cc/Hk8GMYxz/EDO-creacion-de-la-ecuacion.png)

Y a continuación, nosotros tenemos distintas posibles soluciones a una EDO:

## Solución explicita
La variable dependiente está expresada solamente en términos de variables independientes y constantes.
> *y* está despejada sola y solo sale de un lado de la ecuación. Del otro lado hay constantes e independientes. *y = f(x)*, donde *f(x)* no contiene *y* en ningún lado.

![EDO-solucion-explicita.png](https://i.postimg.cc/CL30mBWw/EDO-solucion-explicita.png)


## Solución implícita
Siguen una forma *G(x, y, C) = 0*, por lo que la variable dependiente y la independiente están *enredadas* en la expresión.
> Expresada de tal forma en la que *y* no está despejada sola.

![EDO-solucion-implicita.png](https://i.postimg.cc/LsTwjnzx/EDO-solucion-implicita.png)

## Familias de soluciones, solución particular y solución singular.
Englobo estos tres títulos en uno solo debido a su interesante relación. Cuando hablamos de **familias de soluciones**, nosotros ya debemos estar acostumbrados a pensar en una forma genérica incluyendo una constante *C*, tal que *C* es un valor cualquiera, por lo que la solución dada en algo que incluya a tal *C* engloba a una infinidad de posibles soluciones por cada valor puntual que tome *C*. 

Una **solución particular** consiste en una sola de estas ramas posibles de la familia de soluciones. Estamos hablando de que *C*, al tomar un valor en concreto, no da un valor particular, por lo que solo nos referimos a ese valor de *C* que cumple con la identidad planteada para la ecuación.

Y ahora, una **solución singular** se refiere a aquella que **no tiene solución** generable a partir de los valores de *C*. Satisface la ecuación pero no mediante *C*. 

# 7: Problemas de valores iniciales (PVI)
También llamados [Problemas de Cauchy](https://es.wikipedia.org/wiki/Problema_de_Cauchy), consisten en encontrar la solución de una ED que además satisfaga condiciones iniciales en *y(x)* y en sus derivadas. Lo mismo que venimos haciendo, pero con información y restricciones adicionales sobre la solución.

Un problema de Cauchy consiste en:
* Una EDO de orden *n*.
* Una o más condiciones iniciales, todas evaluadas en el mismo punto.
* Deben haber tantas condiciones iniciales como *n* en el orden, por ende *n* condiciones.

Un ejemplo simple:

![EDO-problema-de-Cauchy.png](https://i.postimg.cc/V5QnzyY3/EDO-problema-de-Cauchy.png)

# 8: Resolución de ecuaciones diferenciales
No existe un método general para resolver una ED, por lo que hablamos antes uno puede llegar a una solución como quiera, siempre y cuando cumpla con la condición de la ecuación. Pero si existen **casos conocidos** con procedimientos para solucionarse. 

El **único método** fiel que tenemos para resolver estas ecuaciones, es el poder **clasificar** la ED que queremos resolver para identificar de qué tipo es. Si es un caso conocido, aplicamos el procedimiento correspondiente; si no es un caso conocido, podemos intentar forzarla a una forma de caso conocido.

## Separación de variablese
Este es el método más básico para EDOs de primer orden. 

> Si una EDO de primer orden puede escribirse en forma explícita Y ADEMÁS el lado derecho se puede factorizar como producto de una función de *x* por una función de *y*, entonces es separable y se puede resolver por ese método.

Se opera de la siguiente manera:
1. Se escribe de forma explicita
2. Se integran ambos lados
3. Se suma la constante de integración en solo un lado
4. A este punto tendremos una solución en forma implícita, pero podemos llevarla a explicita y mostrar el valor de *y*

Un ejemplo de este método:

![EDO-separable.png](https://i.postimg.cc/QttBxHgd/EDO-separable.png)

> Es clave recordar que podemos resolver de forma implícita con esta información: *y(4) = -3* implica que *x = -3* y que *y = 4*

Y en caso de que no podamos llegar a la condición inicial planteada mediante alguna alteración en *C*, estaríamos frente a una **solución singular**.

# 9: Ecuaciones lineales
Ya vimos que necesita cumplir una ecuación para ser considerada una ED lineal. Ahora vamos a profundizar en su forma y solución.

![EDO-lineal-ejemplo.png](https://i.postimg.cc/B6wZnpNH/EDO-lineal-ejemplo.png)

## Factor integrante
El método estándar para solucionar EDOs lineales de primer orden es mediante el [factor integrante](https://es.wikipedia.org/wiki/Factor_integrador), nos ayuda a convertir una ED **no exacta** a una ED **exacta**.

Este factor **servirá siempre** que se cumpla esta forma.

![factor-integrante.png](https://i.postimg.cc/tgdHsjt7/factor-integrante.png)

Y esto aplicado a un escenario real: 

![factor-integrante-ejemplo.png](https://i.postimg.cc/5ynW9SJ9/factor-integrante-ejemplo.png)

No es lo más elegante que pude haber hecho pero espero se entienda la intención.
