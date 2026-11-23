+++
title = 'Memoria Virtual'
date = '2026-11-21T14:35:37-03:00'
toc = true
draft = false
author = 'Valentino Mendé'
tags = ['Sistema Operativo']
categories = ['Computación']
+++

## Parte 1: Fundamentos y Paginación bajo Demanda
1. **Concepto de Memoria Virtual:** ¿Cómo permite la memoria virtual ejecutar programas parcialmente cargados en RAM y qué ventajas aporta a la multiprogramación?

La idea detrás de la memoria virtual es poder cargar procesos parcialmente en RAM, utilizando solo aquellas páginas necesarias para su operación y guardando el resto de las páginas en alguna memoria secundaria, logrando efectivamente una mejor utilización de recursos, aumentando la multiprogramación, y teniendo *virtualmente* más memoria a disposición.

La multiprogramación se vuelve bastante útil, ya que nos permite trabajar con más memoria de la que realmente tenemos a disposición, al costo de un overhead por operación (swap). 

2. **Paginación bajo demanda (*Demand Paging*):** ¿Qué es la carga bajo demanda y en qué se diferencia de la paginación pura?

La paginación bajo demanda, a diferencia de la paginación pura, nos permite tener cargadas las páginas en memoria requeridas al momento, bajo demanda, por lo que es menos intensivo que cargar todo el programa desde un inicio, ya que este puede abarcar un gran espacio en memoria cuando activamente no requiere de todos esos recursos.

3. **Bit de Validez (V/I):** ¿Qué indica el bit de *válido/inválido* en las entradas de la tabla de páginas?

Aquí se introduce el concepto del *lazy swapper*, que se encarga de cargar bajo demanda las páginas necesarias en cierto momento. 

En un inicio, las páginas en el TLB cuentan con un atributo $i$ (de inválido), lo cual causa que cuando se requiera una página, se genera una trampa al sistema operativo para que pase de memoria secundaria a principal el registro necesario y el bit pase a $v$ (válido). 

El bit de válido/inválido sirve par asaber si la página necesaria está cargada o no en memoria principal 

---

## Parte 2: Fallo de Página (*Page Fault*) y Copia en Escritura (COW)
1. **Secuencia del Fallo de Página:** ¿Cuáles son los 6 pasos exactos que ejecuta el SO cuando la CPU referencia una página con bit inválido (interrupción, E/S y reinicio de instrucción)?

- La CPU intenta acceder a una dirección de memoria con una página con bit $i$.
- Se genera una trampa por fallo de página.
- El sistema operativo detecta la trampa y verifica que sea una operación legal.
- El SO encuentra un marco libre en la RAM y transfiere los datos.
- Se registra en la tabla de páginas y se intercambia el bit $i$ por un bit $v$.
- Se restaura el estado anterior y continúa la operación del proceso.

2. **Impacto en el EAT:** ¿Cómo afecta el tiempo de servicio de fallo de página ($t_{\text{servicio}}$ en ms) al Tiempo Efectivo de Acceso?

En caso de un fallo de página, se tiene que ejecutar una secuencia para poder reconocer la operación, por lo que impacta seriamente al tiempo de acceso efectivo (EAT). Prefiero no meterme tanto en esto.

3. **Copia en Escritura (*Copy-on-Write / COW*):** ¿Cómo optimiza COW la llamada al sistema `fork()` compartiendo páginas de solo lectura hasta que un proceso intenta modificar una?

El problema con la llamada al sitema *fork()* es la duplicación del espacio de memoria del proceso padre, y esto es más notorio cuando se usa un *exec()* y se descarta toda esa memoria clonada, efectivamente desperdiciando recursos. 

La solución moderna para esta problemática es el *Copy-on-Write*; cuando se ejecuta un *fork()*, en realidad no se clona el espacio de memoria del padre desde un inicio, sino que se enlaza la tabla de páginas del padre y el nuevo proceso hijo, pero bajo solo lectura, por lo que el hijo accede al mismo espacio en forma de lectura hasta que se solicita una escritura, donde en ese momento se genera la copia con los datos modificados. 

---

## Parte 3: Algoritmos de Reemplazo de Páginas
1. **Algoritmo FIFO y Anomalía de Belady:** ¿En qué consiste el reemplazo FIFO y por qué sufre de la anomalía de Belady (más marcos pueden producir más fallos)?

Primero que todo, estos algoritmos de reemplazo de páginas entran en juego cuando se requiere cargar una página a memoria principal pero esta se encuentra llena, sin espacios disponibles para cargar las páginas necesarias. Entonces, buscamos reemplazar una de las páginas cargadas, y la problemática se transforma a la decisión de que páginas reemplazar.

El reemplazo FIFO consiste en reemplazar la primera página en haber entrado, la página que lleva más tiempo cargada en la RAM. Si bien es simple de entender y programar, llega a ser ineficaz por el reemplazo de procesos necesarios que fueron cargados al inicio de la ejecución de un programa.

La anomalía de Belady consiste en un escenario paradójico, en el que a mayor cantidad de marcos de memoria disponibles, mayor cantidad de fallos de paginación, cuando lo esperable sería que conseguir más memoria mantenga o incluso disminuya los fallos de página. Esto ocurre con algunos algoritmos FIFO. 

2. **Algoritmo Óptimo (OPT):** ¿Por qué OPT ofrece la cota inferior teórica de fallos de página y por qué es irrealizable en la práctica?

Es irrealizable en la práctica, ya que no podemos predecir el futuro. El algoritmo óptimo consiste en reemplazar la página que no se volverá a consultar, o por lo menos el que lo hará a mayor futuro. 

3. **Algoritmo LRU (Menos Usada Recientemente):** ¿Cómo funciona LRU y cuáles son sus implementaciones por contador de reloj o por pila?

El algoritmo LRU (Least Used Recently) consiste en reemplazar la página que menos ha sido utilizado recientemente; para tener esta noción de cuál se ha usado recientemente y cuál no, se implementa de dos formas: 
* Mediante contador de reloj: Se asigna un valor incremental a cada página activa.
* Mediante una pila: Es trivial, cada vez que una página es referenciada, sube a la cima de la pila.

---

## Parte 4: Asignación de Marcos y Hiperpaginación (*Thrashing*)
1. **Asignación Local vs. Global:** ¿En qué se diferencia el reemplazo de marcos local frente al global entre procesos?

Tratamos con muchos procesos debido a la multiprogramación, por lo que naturalmente habrán marcos relacionados bajo un mismo proceso. 

La asignación global trata con todos los marcos disponibles, por lo que en la práctica puede "robar" a otros procesos, mientras que la asignación local solo es referente a su proceso en particular.

2. **Hiperpaginación (*Thrashing*):** ¿Qué es el *thrashing*, por qué ocurre cuando la CPU baja su ocupación y la E/S se satura, y cómo se detecta?

Es un caso de colapso de la memoria donde la CPU pasa más tiempo procesando swaps que instrucciones útiles. Los marcos necesitan cierta cantidad mínima de memoria para poder operar, si no se les asigna esta cantidad mínima, la CPU empieza a generar más swaps que procesamiento de instrucciones, por lo que el overhead salta a los cielos.

3. **Modelo del Conjunto de Trabajo (*Working-Set*):** ¿Cómo previene el *thrashing* midiendo la localidad temporal mediante la ventana $\Delta$?

Si el sistema se satura y entra en este estado, fuerza la detención de algún proceso para tener un respiro. 

4. **Frecuencia de Fallos de Página (PFF):** ¿Cómo ajusta el SO el número de marcos de un proceso mediante límites superior e inferior de tasa de fallos?

Se establece un número de fallos máximos para los procesos, y si superan este límite, se les asignan más marcos. Si no hay marcos libres disponibles, se descarta algún proceso.

