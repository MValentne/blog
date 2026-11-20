+++
date = '2026-07-16T11:09:32-03:00'
draft = false
title = 'Derivadas'
author = 'Valentino Mendé'
tags = ["cálculo", "derivadas", "cálculo diferencial"]
categories = ["Matemática"]
+++

Basándonos en la teoría dada en [limites y continuidad]({{< relref "limites-y-continuidad.md" >}}), podemos dar el primer paso a lo que es el [cálculo diferencial](https://es.wikipedia.org/wiki/C%C3%A1lculo_diferencial). El cálculo diferencial, a grandes razgos, consiste en el análisis del cambio en una función. Una función puede incrementar, decrementar, o no tener un valor "muerto" donde su **pendiente** es cero.

Se trata bastante con el concepto de [pendiente](https://es.wikipedia.org/wiki/Pendiente_(matem%C3%A1tica)), dígase, el ángulo de la [tangente](https://es.wikipedia.org/wiki/Tangente_(trigonometr%C3%ADa)), ya que ese sera nuestro indicador para indicar el estado de un valor puntual de la función.

# 1: Introducción a la derivada
La [recta secante](https://es.wikipedia.org/wiki/Recta_secante) es la recta que pasa por dos puntos diferentes de una curva, para nuestro interés una función. La derivada representa una tasa de cambio en función de las variables de la función. Las derivadas pueden ser utilizadas para el estudio de funciones; podemos estudiar una función sin siquiera tener que graficarla.

![definicion-derivada.png](https://i.postimg.cc/PqhFPZH3/definicion-derivada.png)

Y la idea general de toda la definición es que partimos de una secante y su pendiente. Cuando nosotros establecemos un punto fijo y acercamos el otro punto a ese valor (mediante un límite), obtenemos una tangente. 

Utilizando la misma idea que con la pendiente de la secante, podemos intuir la pendiente de la tangente, que no es nada más que la [función derivada](https://es.wikipedia.org/wiki/Derivada). 

Por último para simplificar la notación, hacemos un reemplazo de *xsub0 - x* con *h*, hacemos las sustituciones necesarias, y tenemos una definición mucho más prolija para la función derivada.

Algunas notaciones usuales:

![notaciones-usuales.png](https://i.postimg.cc/289ZqfDS/notaciones-usuales.png)

Por ahora no es necesario complicarnos con la notación, por lo que por simplicidad utilizaremos *y'* para referirnos a una derivada primera, *y''*, *y'''*, derivada segunda y tercera respectivamente. Más adelante sera de mayor utilidad utilizar la [notación de Leibniz](https://es.wikipedia.org/wiki/Notaci%C3%B3n_para_la_diferenciaci%C3%B3n) (df/dx) cuando estemos trabajando con integrales y ecuaciones diferenciales.

Ejemplo práctico de derivada por definición:

![derivada-por-definicion.png](https://i.postimg.cc/PJpBmwxm/derivada-por-definicion.png)

# 2: Función derivada
Ahora hagamos un poco más de énfasis en la derivada como una función, nosotros podemos abstraer el significado geométrico de la derivada para verlo como una función que admite una entrada y una salida.

![funcion-derivada.png](https://i.postimg.cc/fLfRd1VN/funcion-derivada.png)

# 3: Derivada y continuidad
> Teorema: Si una función es derivable, entonces es continua. (No es recíproco)

![criterio-de-continuidad.png](https://i.postimg.cc/sgYb9WYS/criterio-de-continuidad.png)

Y si bien algo al ser derivable es continuo, esto no implica que el que sea continuo deba ser derivable. Para comprobar esto tenemos que aclarar que para que un valor sea derivable, este debe ser derivable a izquierda y derecha, por lo que es bilateral (como vimos en teoría de limites).

A continuación un ejemplo de esto:

![no-reciproco.png](https://i.postimg.cc/nrDrz2y9/no-reciproco.png)

Como se aprecia en este ejemplo, si bien por criterio de continuidad, la función en ese valor puntual es continua, eso no implica que sea derivable, ya que las derivadas laterales no coinciden en una derivada bilateral. También me parece elegante volver a la definición de límite salida de la definición de pendiente de secante para poder analizar la función derivada por izquierda y derecha.

# 4: Reglas de derivación
Y a partir de este punto, podemos abstraer la definición de derivada para utilizar reglas de derivación; nuestro primer acercamiento real a lo que es el cálculo "práctico", ya que no demostramos por definición cada escenario trivial que nos encontramos. Aquí es donde se populariza el uso de [tablas de derivación](https://es.wikipedia.org/wiki/Anexo:Derivadas).

Entre las reglas fundamentales, tenemos:

![reglas-fundamentales.png](https://i.postimg.cc/qM7CVfMt/reglas-fundamentales.png)

Cabe aclarar que deben ser derivables en primera instancia. A continuación, las demostraciones del producto y el cociente:

Para el producto:
![demostracion-producto.png](https://i.postimg.cc/HkfPXQsv/demostracion-producto.png)

Y para el cociente:
![demostracion-cociente.png](https://i.postimg.cc/TYxms0tp/demostracion-cociente.png)

El resto voy a dejarlas obviadas, porque de lo contrario consumiré demasiado tiempo en cosas triviales.

# 5: Regla de la cadena
Es frecuente el escenario donde tenemos que derivar [funciones compuestas](https://es.wikipedia.org/wiki/Funci%C3%B3n_compuesta), que consisten en pasar como parámetro de una función, a otra función.
Dígase:

> (f o g)(x) = f(g(x))

Y la cuestión es, como derivamos esto? De forma intuitiva, vamos resolviendo la derivada en orden de prioridad de cada función y multiplicamos con la siguiente en la cadena, vista de una forma más simple

> [f(g(x))]' = f'(g(x)) . g'(x)

Y demostrando esta regla:

![demostracion-regla-cadena.png](https://i.postimg.cc/xCf5sZSq/demostracion-regla-cadena.png)

Y un ejemplo práctico:

![ejemplo-regla-cadena.png](https://i.postimg.cc/66GcMnkL/ejemplo-regla-cadena.png)

Fuera de eso, se puede desarrollar de forma práctica la demostración de otras reglas de derivación, pero son triviales para el enfoque de este estudio; refiérase a la tabla de derivadas de la sección anterior. [Aunque como práctica previa a examen, posiblemente edite este post y agregue algunas demostraciones adicionales al final de la publicación.]

# 6: Derivación de funciones implícitas
Hasta ahora hemos visto derivación de funciones en su forma explicita, dígase en la forma:

> f(x) = ax+b, por decir algo.

Ahora vamos a trabajar con su forma [implícita](https://es.wikipedia.org/wiki/Funci%C3%B3n_impl%C3%ADcita), donde trataremos la función en el formato:

> y = ax + b, siguiendo el ejemplo anterior.

Donde *y* es función de *x*. Esta forma de representar funciones nos sera útil más adelante cuanto tengamos que ver **ecuaciones diferenciales**, ya que podemos resolver ecuaciones siguiendo esta forma.

Para derivar una función implícita, se tienen que aplicar las reglas de derivación previamente vistas, a este punto empezamos a obviar la definición formal para centrarnos en álgebra y reglas de derivación.

Algunos ejemplos de derivación implícita:

![derivadas-implicitas.png](https://i.postimg.cc/fymcj3z8/derivadas-implicitas.png)

# 7: Derivaciones de funciones inversas
No debería ser intimidante el derivar [funciones inversas](https://es.wikipedia.org/wiki/Funci%C3%B3n_inversa), ya que una función inversa no deja de ser una función, por lo que el procedimiento de derivación es el mismo. La distinción con los temas anteriores que podría sumar un poco de dificultad es el tener que encontrar la inversa de la función antes de derivar, para lo cual hacemos lo siguiente:

![derivadas-inversas.png](https://i.postimg.cc/HkxtFkBL/derivadas-inversas.png)

Simplemente buscamos la inversa y derivamos dicha función. Lo único relevante, y que debemos de tener en mente, es que la función original **admita una función inversa**, dígase, que la función es [biyectiva](https://es.wikipedia.org/wiki/Funci%C3%B3n_biyectiva), y obviamente además tiene que ser derivable en primera instancia.

---
# Extra: Algunas demostraciones adicionales 
> Con el tiempo iré agregando ejemplos en este apartado
