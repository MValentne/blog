+++
date = '2026-07-13T18:11:20-03:00'
draft = false
title = 'Limites Y Continuidad'
author = 'Valentino Mendé'
tags = ["cálculo", "limites", "continuidad"]
categories = ["Matemática"]
+++
El interés de esta unidad es hablar sobre las bases fundamentales del cálculo, en particular del concepto de límite, ya que todo se desarrolla a partir de ese concepto.

# 1: Intervalos
Empecemos hablando sobre algo simple, intervalos.
Siendo que tenemos *a < b*:

![intervalos.png](https://i.postimg.cc/ZnjjSvKG/intervalos.png)

Se tiene en cuenta que hablamos de valores pertenecientes al conjunto de los Reales, por lo que nos referimos a valores **continuos**, dígase, que hay una cantidad infinita de valores entre un punto *u* y otro *v*.

Puede ser un intervalo abierto o cerrado, lo cual considera si se incluyen o no sus extremos como parte del conjunto intervalo.

# 2: Entornos
Un entorno consiste en el alrededor de un valor puntual en un intervalo. Si un punto *a* es un valor cualquiera en la recta real y *h* es un valor positivo, un entorno de centro *a* y radio *h* es el intervalo abierto **(a-h, a+h)**. A esto se le designa **E(a,h)**:

![entornos.png](https://i.postimg.cc/dt6QbsRt/entornos.png)

En el entorno reducido, no se toma en cuenta el valor puntual de *a*.

# 3: Punto de acumulación
El punto de acumulación es la base para el límite y la derivada. Acá un gran video explicativo del tema:

{{<youtube GlPcclwproI>}}

La idea clave es que exista un *x* para todo entorno reducido de *a*, cuya intersección con el conjunto *C* sea distinta de vacío.

![Punto-de-acumulacion.png](https://i.postimg.cc/3Jx6SYtQ/Punto-de-acumulacion.png)

Se puede observar que *y* no es punto de acumulación, ya que si bien, se puede expandir el entorno reducido para cumplir con la condición, esta intersección debe cumplir para todos los posibles entornos reducidos de *x*, por lo que al haber por lo menos un entorno que no cumple, rompe la condición y no es punto de acumulación.

# 4: Límite intuitivo y definición formal
Ahora tocamos el tema principal y fundamental para todo lo que veremos a partir de ahora, el **límite**. Ejemplifico con una idea intuitiva para entender el peso del concepto; supongamos que tengo una taza frente a mi, si bien hay una distancia fija entre la taza y mi mano, la distancia es un valor continuo, por lo que hay una infinidad de valores entre la taza y mi mano. Ahora la idea central, yo al agarrar la taza, bajo esa misma idea de valores continuos, puedo acercarme con una precisión infinitesima al mango de la taza, dígase, entre más se acerca mi mano a la taza, puedo acercarme infinitesimamente a la taza sin tocarla, hasta que eventualmente entro en contacto con ella. Puedo decir que antes de entrar en contacto con la taza, hubo una distancia infinitesimamente pequeña entre el mango y mis dedos.

Esa es la idea intuitiva del límite, el poder acercarse infinitesimamente a un valor sin tener que tomar puntualmente dicho valor, por lo que observamos que ocurre alrededor de ese valor. 

Que ocurre cuando hacemos una división por 0? error matemático. pero que pasa cuando nos acercamos infinitesimamente a ese valor? 

![division-por-0.png](https://i.postimg.cc/28j38cwf/division-por-0.png)

Vemos que en la imagen de la función, cuando *x* **tiende** a 0, toma un valor infinito. Aquí entra ontro concepto importante, los **limites laterales**. Cuando *x -> 0* por izquierda, la función devuelve un valor infinitamente negativo, y cuando *x -> 0* por derecha, devuelve un infinito positivo. No evaluamos el valor puntual de *x*, solo observamos que ocurre cuando nos acercamos infinitesimamente a *x*.

Y a partir de esta idea intuitiva, podemos formalizar el concepto:

![limite-formal.png](https://i.postimg.cc/pVfqtT0Z/limite-formal.png)

# 5: Limites laterales
Sea *f(x)* una función definida en el intervalo *(a,b)* donde *a < b*. Si *f(x)* está arbitrariamente cerca de *L* cuando *x* tiende a *a* desde dentro del intervalo, decimos que *L* es el **límite por derecha** de *f* en *a*. 

Decimos:
> el límite por derecha cuando *x* tiende a *a*, en *f(x)* es igual a *L*.

Sea *f(x)* una función definida en un intervalo *(c, a)* donde *c < a*. Si *f(x)* está arbitrariamente cerca de *M* cuando *x* tiende a a desde dentro del intervalo, decimos que *M* es el **límite por izquierda** de *f* en *a*.

Decimos:
> el límite por izquierda cuando *x* tiende a *a*, en *f(x)* es igual a *M*

Los limites laterales nos sirven para determinar si hay un límite bilateral, dígase, si existe un límite en primera instancia. Aquí es donde consideramos cuestiones de **continuidad**, ya que en una función, comúnmente en funciones por tramos, suelen haber saltos en la función, por lo que podemos tener saltos finitos (algunos arreglables al redefinir la función) o saltos infinitos (asíntotas). 

![limites-laterales.png](https://i.postimg.cc/Gh4srgK8/limites-laterales.png)

Y por último, una función tiene un límite bilateral, dígase, tiene un límite, si los limites laterales por izquierda y derecha coinciden a un mismo valor, el cual deberá coincidir con la imagen del valor puntual evaluado.

# 6: Infinidad en limites
Y a partir de este punto empezamos a jugar con **infinitos**. Primero tenemos que aclarar que el **infinito** es un valor indeterminado, que no toma un valor puntual. Cuando hablamos de infinito, pensemos en un crecimiento o decrecimiento descomunal, no en un solo número. Es por eso que una indeterminación de división por 0, llega a tener un crecimiento y decrecimiento infinitos analizando a izquierda y derecha; de ahí surge una asíntota.

![limites-laterales-formalizado.png](https://i.postimg.cc/tRw6hvxF/limites-laterales-formalizado.png)

La idea clave es que para cualquier valor que tome *M*, siempre habrá una imagen entre *a* y *x* que sea mayor o menor que *M*, por lo que intuitivamente podemos caracterizar el crecimiento infinito de la función cuando *x* tiende a *a*, ya sea por izquierda o derecha.

También es frecuente el escenario en el que queremos estudiar que ocurre cuando *x* tiende al infinito en *f(x)*, a esto lo llamamos un **límite al infinito**.

![limites-al-infinito.png](https://i.postimg.cc/ncbh8xFK/limites-al-infinito.png)

Y por último, también es posible un **límite infinito en el infinito**, al que podemos visualizar intuitivamente como un crecimiento sin limitaciones, por lo que cuando *x* tiende a *infinito* en *f(x)*, *f(x)* también va a tender a *infinito*.

# 7: Propiedades de los limites
Ya entrando un poco más en cuestiones practicas, tenemos las siguientes propiedades fundamentales al operar con limites:

![propiedades-de-los-limites.png](https://i.postimg.cc/43ShV0zv/propiedades-de-los-limites.png)

> La demostración de estas propiedades requiere de **demostraciones epsilon - delta**, que regresan a la definición formal del límite. Eso va más allá de la intención de este estudio, ya que lo damos por hecho.

También hay que aclarar que si no se presenta una indeterminación al remplazar el valor inmediato de *x*, entonces el límite tiene una solución trivial.

# 8: Teorema del emparedado
Esto es intuitivo y nos da una herramienta útil a la hora de trabajar con algunas expresiones trigonométricas:

![teorema-del-emparedado.png](https://i.postimg.cc/h41M79Cw/teorema-del-emparedado.png)

Y eso fundamenta la siguiente identidad, que es bastante recurrente:

![aplicacion-teorema-del-emparedado.png](https://i.postimg.cc/xd91qVcn/aplicacion-teorema-del-emparedado.png)

# 9: Indeterminaciones
Aquí nos es relevante tener un álgebra decente para poder enfrentarnos a las **indeterminaciones** que pueden surgir al operar con infinitos. Con **resolver una indeterminación** nos referimos a arreglar la expresión, usualmente mediante el uso de **artificios matemáticos** para que al resolver el límite inmediato, este no resulte en una indeterminación y nos de un valor final.

Tenemos las siguientes indeterminaciones posibles:

![Indeterminaciones.png](https://i.postimg.cc/TYHspV1M/Indeterminaciones.png)

Cada una de ellas tiene un método distinto para intentar salvar dicha indeterminación, a continuación algunos desarrollos prácticos de cada tipo:

![Indeterminaciones-0-0.png](https://i.postimg.cc/TYtCGZYD/Indeterminaciones-0-0.png)

En este tipo de indeterminaciones buscamos factorizar polinomios para poder simplificar y arreglar el problema con el denominador.

También es común el siguiente escenario:

![Indeterminaciones-0-0-complemento.png](https://i.postimg.cc/Ls1cJHnv/Indeterminaciones-0-0-complemento.png)

Donde utilizamos un **artificio matemático** para multiplicar por *1*, lo cual no afecta a la expresión; multiplicamos y dividimos por el conjugado del numerador, por lo que llegamos a una [diferenca de cuadrados](https://es.wikipedia.org/wiki/Diferencia_de_dos_cuadrados).

![Indeterminaciones-inf-inf.png](https://i.postimg.cc/TwCXrTXY/Indeterminaciones-inf-inf.png)

Se puede observar que el grado del numerador y del denominador son los factores de mayor relevancia en este tipo de indeterminaciones, ya que a simple vista podemos ver, dependiendo de si es una fracción propia o impropia, el resultado que dará el límite.

![Indeterminaciones-0-x-inf.png](https://i.postimg.cc/P5g6F9M3/Indeterminaciones-0-x-inf.png)

La idea es reescribir el producto a una división, por lo que tenemos una expresión más fácil de manejar, o a lo sumo, otra indeterminación distinta.

![Indeterminaciones-inf-inf.png](https://i.postimg.cc/RFBM1vbx/Indeterminaciones-inf-inf.png)

Factorizamos, convertimos en un producto y pasa a tener una solución trivial.

![Indeterminaciones-exponente-0.png](https://i.postimg.cc/sgVrnn3K/Indeterminaciones-exponente-0.png)

Resolvemos utilizando propiedades del logaritmo natural, por lo que nos queda euler elevado a un límite.

![Indeterminaciones-exponente-inf-a-1.png](https://i.postimg.cc/BngYYm2F/Indeterminaciones-exponente-inf-a-1.png)

Usamos bastante juego con propiedades de exponentes y resolvemos de forma trivial siguiendo la forma. Note la constante presencia de euler...

# 10: Continuidad
Como tema de cierre, nos interesa analizar si una función es continua, pero que significa que una función sea continua? de manera informal y poco rigurosa podemos decir:

> Una función continua es aquella que podemos dibujar sin levantar el lápiz de la hoja

Y esto es correcto, pero nos es más nutritivo entenderlo a profundidad;

![criterio-de-continuidad.png](https://i.postimg.cc/MGYSY0pf/criterio-de-continuidad.png)

Esto, explicado brevemente, nos ayuda a saber si un valor puntual es continuo dentro de la función.
1. La imagen existe en ese punto.
2. Cuando la función tiende a ese punto, existe un límite (bilateral).
3. La imagen y el límite coinciden en ese punto.

# 11: Discontinuidades de funciones
Cuando hablamos de discontinuidades nos referimos principalmente a tres tipos:
1. Discontinuidad evitable.
2. Discontinuidad inevitable - salto finito.
3. Discontinuidad inevitable - salto infinito.

![discontinuidades.png](https://i.postimg.cc/Qdh269K1/discontinuidades.png)

Y a este punto debió haber surgido esta duda, nosotros estamos probando que la función es continua en un valor puntual, pero como analizamos más allá de solo un punto?

# 12: Propiedades de continuidad
Las siguientes propiedades nos sirven para probar la continuidad de más allá de un solo punto en la función:
**si las funciones *f* y *g* son continuas en *x = c*, entonces las siguientes funciones son continuas en:**
1. *f* + *g* y *f* - *g*
2. *fg*
3. *kf*, donde *k* es cualquier número real.
4. *f/g*, si *g(c) != 0*
5. *(f(c))^(m/n)*, si *f(x)* está en un intervalo que contenga a *c*, y *m* y *n* son enteros.

Y además, para funciones **polinómicas** y **racionales**:
> Todo polinomio es continuo en cualquier punto de la recta real. Toda función racional es continua en cualquier punto de la recta real, siempre y cuando el denominador sea distinto de cero.
