+++
date = '2026-07-18T20:24:04-03:00'
draft = false
title = 'Aplicaciones Derivadas'
author = 'Valentino Mendé'
tags = ["cálculo", "derivadas", "cálculo diferencial"]
categories = ["Matemática"]
+++

Vimos anteriormente que es una derivada, ahora veremos para qué sirve. La idea intuitiva de derivada es que en un punto dado de una función, habrá una tangente (si es que el punto en cuestión es derivable), la pendiente de dicha tangente nos indicara el crecimiento o decrecimiento de la función en ese punto; esto tiene un gran peso, ya que con solo saber el valor de la derivada, podemos saber en qué puntos la derivada crece, decrece o inclusive, donde hay un punto de inflexión en la función, cuestiones complicadas de analizar a simple vista en una gráfica, por lo que nos da mucha más profundidad a la hora de **analizar funciones** (hablaremos más de esto después).

# 1: Razón de cambio
Empezamos hablando sobre la razón de cambio, que a grandes razgos es una relación entre el incremento en f(x) y el incremento en x.

![razon-de-cambio.png](https://i.postimg.cc/jqDQfXS2/razon-de-cambio.png)

Y de aquí nace la idea de la derivada como la razón de cambio para un valor puntual, indicada por la inclincacion de la pendiente de la tangente de la función en ese punto.

# 2: Diferencial
Primero que todo, hago una introducción al tema citando a un canal al que le tengo bastante apego.

{{<youtube T3w5WFDdPC8>}}

Entonces podemos conceptualizar un diferencial como una **aproximación** del cambio de una función usando la recta tangente en vez de la curva real de la función. Entonces tenemos la siguiente interpretación:

![introduccion-a-la-diferencial.png](https://i.postimg.cc/cJZPvkqX/introduccion-a-la-diferencial.png)

> Es importante destacar que la pendiente de la recta tangente se representa con *dy*/*dx*

Entonces podemos usar la diferencial de la función para predecir el comportamiento de la función con un incremento de acuerdo a la pendiente del valor puntual que se toma. En el ejemplo, la imagen de la función se aleja de la recta tangente entre mayor es el incremento.

![diferencial.png](https://i.postimg.cc/FFp0GM3s/diferencial.png)

La *diferencial* de una función es el producto de su derivada por la diferencial de la variable independiente (*dx*).

![diferencial-intuitiva.png](https://i.postimg.cc/rwHf5htH/diferencial-intuitiva.png)

Se tiene que tener en cuenta que *dy* es dependiente de *dx* en el contexto local de la operación, ya que no podemos tratar con esos mismos valores en otro contexto ajeno a su relación.

# 3: Teorema de Rolle
Considero que el [Teorema de Rolle](https://es.wikipedia.org/wiki/Teorema_de_Rolle) es algo conceptualmente intuitivo, y da base al análisis de funciones mediante uso de la derivada como herramienta.

![Rolle.png](https://i.postimg.cc/mDgt3G1z/Rolle.png)

Lo que dice el Teorema de Rolle es que si tenemos dos puntos cualesquiera en la imagen donde se cumple que *f(a) = f(b)* (dígase que están "al mismo nivel"), entonces habrá un punto en dicho intervalo donde la derivada (la pendiente de la recta tangente respecto a un punto) sera igual a 0, por lo que en ese valor puntual no habrá crecimiento ni decrecimiento. 

Si en un punto no hay crecimiento ni decrecimiento, dígase, que *f'(x) = 0*, entonces a este se le llama **punto crítico**, y un candidato a **máximo** o **mínimo**, ya sea **local** o **global**.

> Un [punto crítico](https://es.wikipedia.org/wiki/Punto_cr%C3%ADtico_(matem%C3%A1tica)) puede darse si bien la función no es diferenciable en ese punto o si *f'(x) = 0*, donde se llega a un **punto estacionario** de la función.

Igual hablaremos más a detalle sobre puntos críticos, máximos y mínimos cuando entremos más a fondo en análisis de funciones, por ahora la idea de Rolle es el tener un punto estacionario dado que tenemos dos puntos en la curvatura que tienen la misma imagen.

# 4: Teoremas del valor medio y de Cauchy
Empezando por el [Teorema del valor medio](https://es.wikipedia.org/wiki/Teorema_del_valor_medio), este sigue una idea similar a Rolle, pero ampliado más allá de buscar un punto estacionario; en Rolle buscamos un punto en el que la pendiente sea paralela al eje x con una pendiente 0 en su recta tangente. 

En el Teorema del valor medio buscamos algo similar, tendremos **dos puntos en la función**, por lo que comprendemos una **secante** que corta en esos dos puntos. El teorema dice que habrá algún punto intermedio en el que la recta tangente sea paralela a dicha secante.

![Lagrange.png](https://i.postimg.cc/DyZtXffn/Lagrange.png)

[Cauchy](https://es.wikipedia.org/wiki/Teorema_del_valor_medio_de_Cauchy) es una generalización del Teorema del valor medio que vimos anteriormente, este establece la base para la regla de L'Hopital, una herramienta muy pesada para simplificar el operar con limites.

![Cauchy.png](https://i.postimg.cc/4xDfPLBc/Cauchy.png)

Conceptualmente sigue la misma idea que el Teorema de Lagrange, pero introduce esta identidad interesante que nos sirve bastante.

{{<youtube 4-XN0Pilhcw>}}

Por último, una ecuación utilizando cauchy:

![Ejercicio-Cauchy.png](https://i.postimg.cc/65328P8n/Ejercicio-Cauchy.png)

# 5: Regla de L'Hopital y algunos limites interesantes
Con [la regla de L'Hopital](https://es.wikipedia.org/wiki/Regla_de_l%27H%C3%B4pital) podemos salvar algunas indeterminaciones de una forma mucho más trivial de lo que habíamos visto anteriormente, e incluso llega a ser una ruta alternativa frente a limites que antes veíamos como imposibles de salvar!

Se fundamenta fuertemente en el Teorema del valor medio de Cauchy, y se define de la siguiente manera:

![Lhopital.png](https://i.postimg.cc/rmMKCV9P/Lhopital.png)

Por lo que para escenarios de *0/0* o *+-inf/+-inf*, podemos solucionar de forma trivial utilizando derivadas y L'Hopital. Y además se pueden presentar situaciones bellas en las que podemos reescribir una expresión para causar un escenario con solución posible mediante L'Hopital, es una herramienta muy versátil.

A continuación, el desarrollo de algunos limites mediante L'Hopital:

![Lhopital-ejercicios.png](https://i.postimg.cc/66yFBDn9/Lhopital-ejercicios.png)

# 6: Derivadas sucesivas
Ya entrando en análisis de funciones, nosotros podemos usar como herramienta la derivada; de tal forma en la que podemos estudiar una función y valores puntuales relevantes de esta sin tener que recurrir a una gráfica o software para tener precisión.

La herramienta principal que utilizaremos serán las derivadas primera, segunda y tercera. Con estas derivadas nos referimos a literalmente derivar múltiples veces consecutivas para conseguir diferentes significados en cada una de ellas.

![derivadas-sucesivas.png](https://i.postimg.cc/76xDBXWb/derivadas-sucesivas.png)

la primera derivada nos da la pendiente de la recta tangente de ese punto, la segunda derivada nos indica concavidad y la tercera nos puede ayudar a encontrar puntos de inflexión (cambio de concavidad).

# 7: Análisis de funciones y sus herramientas
La idea de estudiar una función con derivadas, es que podemos encontrar valores puntuales de la función que sean relevantes para entender el comportamiento de esta. Puede llegar a ser complicado a simple vista indicar en qué valor puntual de *x* se genera un cambio de concavidad en *f(x)*, por lo que es mucho más intuitivo usar las herramientas que hemos desarrollado hasta este punto (limites y derivadas) para poder estudiar este comportamiento de una función *f(x)*.

![figura-para-analisis-de-funcion.png](https://i.postimg.cc/xCswN1Cj/figura-para-analisis-de-funcion.png)

## Puntos críticos
Me atrevo a empezar este tema hablando de **puntos críticos** (los mencionamos anteriormente cuando hablamos de Rolle), que nos van a simplificar el trabajo al **dividir la función en intervalos** separados por puntos de interés; estas divisiones serán marcadas por puntos críticos en la función, por lo que podremos tomar trozos distintos y determinar su crecimiento o decrecimiento, y concavidad.

![punto-critico.png](https://i.postimg.cc/SsgC8wCv/punto-critico.png)

Ya que dividimos en intervalos, podemos analizar cada intervalo por separado, modulando el estudio de la función.

## Extremos relativos
Empecemos hablando sobre crecimiento y decrecimiento.
> Supongamos un intervalo centrado en *a* y cualquier valor x dentro de ese intervalo. Si *x < a*, entonces *f(x) < f(a)* y decimos que el intervalo es **creciente**. En cambio, si *x<a* y *f(x) > f(a)*, entonces estamos hablando de un intervalo **decreciente**.

Además, podemos verlo también de forma intuitiva mediante el uso de la derivada primera, ya que al ser la pendiente de la recta tangente, y al haber separado la función previamente en intervalos separados por puntos críticos, entonces **basta con probar para un valor del intervalo**, ver si la pendiente para ese punto es positiva o negativa, y con base a eso puedes tomar conclusiones sobre todo el intervalo, ya que solo habrá un cambio en el signo de la pendiente a partir del punto crítico, y nosotros ya conocemos donde se encuentran estos puntos.

Entonces como extremos relativos nos referimos a un valor máximo o mínimo dependiendo de la información del **entorno del punto crítico en cuestión**, ya que si por izquierda es creciente y por derecha decreciente, entonces hablamos de un **valor máximo relativo**, y si por izquierda es decreciente y por derecha creciente, es un **valor mínimo relativo**. Esta información la podremos conseguir a partir del estudio previamente mencionado en los intervalos.

Ejemplifiquemos:

![extremos-relativos.png](https://i.postimg.cc/fyBCz8w3/extremos-relativos.png)

Además, también hay forma de plantear máximos y mínimos a partir de la derivada segunda, ya que nos da información sobre la concavidad en ese punto (más de esto en el apartado que viene).

## Concavidad
Como mencionamos anteriormente, podemos usar la derivada segunda para saber si un punto crítico sera un extremo relativo máximo o mínimo, pero también **nos da información sobre la concavidad de dicho valor puntual**. Si la derivada segunda nos da un valor positivo, hablamos de una concavidad hacia arriba (un mínimo), y si nos da un valor negativo, hablamos de una concavidad hacia abajo (un máximo).

Ahora, ¿qué es la concavidad?

> Que un punto sea **cóncavo hacia arriba** significa que la curva de la función está por arriba de la recta tangente en ese punto, y bajo la misma lógica, que un punto sea **cóncavo hacia abajo** significa que la curva de la función pasa por debajo de la recta tangente en ese punto.

![concavidad.png](https://i.postimg.cc/QxxGSYV8/concavidad.png)

Por lo que de forma simplificada podemos determinar si hay un máximo o mínimo. Ahora, si la derivada segunda nos da *f''(x) = 0*, tenemos un **candidato a punto de inflexión**, que probaremos con la derivada tercera o analizando su entorno.

## Puntos de inflexión
Cuando hablamos de un [punto de inflexión](https://es.wikipedia.org/wiki/Punto_de_inflexi%C3%B3n), nos referimos a un punto en el que se **transiciona de una concavidad a otra**. Para encontrar estos puntos, basta con igualar la segunda derivada a 0 (*f''(x) = 0*), en cuyo caso sera un **candidato a punto de inflexión**, y deberá cumplir también *f'''(x) != 0*, por lo que tenemos:

> Si *f''(x) = 0* y además *f'''(x) != 0*, entonces es un punto de inflexión.

![punto-de-inflexion.png](https://i.postimg.cc/fRRTQMKp/punto-de-inflexion.png)

Por lo que ahora conocemos que en *x = 0* hay un cambio de concavidad.

## Análisis completo de la función
Ya vimos todas las herramienas para poder estudiar los puntos relevantes en una función de una variable, ahora uniendo todos esos conceptos, junto a algunas cuestiones elementales, podemos modelar una función monovariable con exactitud.

![estudio-completo.png](https://i.postimg.cc/T17Kbh2q/estudio-completo.png)

Y con el uso trivial de derivadas pudimos estudiar una función de forma intuitiva. De haber sido una función racional, hubiera sido de interés el estudiar el comportamiento de la función al infinito, por lo que podríamos haber usado L'Hopital para saber si hay alguna asíntota horizontal.

Más adelante volveremos a ver cálculo diferencial en forma de ecuaciones diferenciales, por lo que sera de interés tener agilizados los conceptos de función explicita y su derivada, y los diferenciales.

---

# Extra: Algunas funciones analizadas
> Con el tiempo iré agregando ejemplos en este apartado
