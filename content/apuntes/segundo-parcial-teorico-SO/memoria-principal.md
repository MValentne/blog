+++
title = 'Gestión de Memoria Principal'
date = '2026-11-19T20:43:00-03:00'
draft = false
toc = true
author = 'Valentino Mendé'
tags = ['Sistema Operativo']
categories = ['Computación']
+++

Planteo cada sección como una serie de preguntas guía para entender el tema.

## Parte 1: Conceptos Fundamentales y Necesidad de Gestión
1. **¿Por qué es indispensable la gestión de memoria en un sistema operativo multiprogramado?**

Es indispensable ya que buscamos la máxima utilización y aprovechamiento de la RAM (nuestra memoria principal). Queremos tener múltiples procesos corriendo en memoria, pero si estos procesos se almacenan de forma contigua, podemos causar una fragmentación interna o externa.

- Fragmentación Interna: Supongamos que reservamos 15 bits de memoria para un proceso, pero el proceso solo pesa 11. Quedan 4 bits de memoria inutilizados dentro del bloque reservado. A esto se le llama fragmentación interna. Quedan celdas inutilizadas dentro de un bloque reservado.

- Fragmentación Externa: Ahora, contemplando toda la memoria disponible, si almacenamos multiples procesos y quedan espacios no utilizados, estamos hablando de una fragmentación externa, ya que quedan celdas de memoria difíciles de aprovechar entre procesos.

2. **¿Qué diferencia a la memoria principal de los registros de la CPU y del almacenamiento masivo en cuanto a velocidad de acceso y directitud para la CPU?**

Consideramos una jerarquía clara; tiende a seguir el patrón de a mayor velocidad de acceso, mayor costo, y por ende menor capacidad de almacenamiento (sale mucha plata), por lo que los ordenamos de la siguiente forma:

- Registros de CPU (mayor velocidad de acceso): Pueden ser accedidos directamente por la CPU, son utilizados para operaciones directas. Toma un solo ciclo de reloj acceder a estos registros.

- Memoria principal: Puede tomar decenas o centenas de ciclos de reloj el acceso a esta memoria. Se suele complementar con memoria caché para agilizar su acceso.

- Almacenamiento masivo: La CPU no puede interactuar con almacenamiento masivo, para eso interfiere el sistema operativo. Puede llegar a tomar milisegundos el acceder a esta memoria, pero tiene una capacidad de almacenamiento muy amplia. 

3. **¿Cómo garantizan la protección de memoria los registros base y límite (o de relocalización)?**

Delimitan la memoria legal para un proceso. Si se accede a un espacio de memoria fuera de este límite, se lanza una trampa (trap) que atrapa el kernel. 

4. **¿Cuál es la diferencia exacta entre el espacio de direcciones lógico (o virtual) y el espacio de direcciones físico?**

- Dirección lógica: Es aquella generada por la CPU en la ejecución de un programa. El conjunto de estas direcciones es el espacio de direcciones lógicas.

- Dirección física: Es la ubicación real de determinada celda en memoria principal (RAM). Se lee y procesa mediante el bus de datos. El conjunto de ellas es conocida como el espacio de direcciones físicas. 

Se hace esta diferencia para abstraer el espacio de direcciones físico. Si los programas manipularan directamente direcciones físicas de la RAM, habría un fallo de seguridad crítica considerando que podrían manipular celdas indiscriminadamente; por eso se tiene un espacio de direccionamiento lógico, ya que este es interpretado por la **MMU (Memory Management Unit)** que se encarga de establecer los registros base y límite para cada proceso. 

Para el proceso, su memoria es un espacio limpio para trabajar, por lo que se evita la complejidad de todo lo cargado globalmente en la RAM; esto se logra gracias a la **paginación**, que permite cargar las **paginas** del programa de forma no contigua en la diversidad de **marcos** no contiguos en RAM, y así eliminando el problema de la fragmentación externa.

5. **¿Qué rol cumple la Unidad de Gestión de Memoria (MMU) y cómo realiza la traducción de direcciones en tiempo de ejecución?**

La MMU se dedica a la traducción de páginas a marcos, logrando esa conexión entre direccionamiento lógico y físico; esto lo logra en tiempo de ejecución. Además, se encarga de la definición de espacios legales de memoria mediante registros base y límite. 

El **TLB (Translation Lookaside Buffer)** es un componente de hardware adicional, una memoria caché dedicada a la MMU; su función principal es resolver el problema del doble acceso a memoria debido a la tabla de direcciones, que introduce la paginación. El flujo de trabajo con el TLB consiste en primero buscar la página a traducir directamente en el TLB (de forma paralela entre todos sus registros), en caso de encontrarla surge un **TLB HIT** y obtiene inmediatamente el marco a buscar, en cambio, si no se encuentra, surge un **TLB MISS** y se recurre a buscar en la tabla de páginas de la RAM, traducirla y cargar la nueva entrada en el TLB para su futura referencia.

---

## Parte 2: Ciclo de Vida del Programa y Enlace de Direcciones
1. **¿En qué momentos del ciclo de vida de un programa se puede realizar el enlace (*binding*) de instrucciones y datos a direcciones de memoria (compilación, carga o ejecución)?**

El **binding** consiste en la asociación o traducción de instrucciones y datos de un programa a direcciones de memoria. Es el proceso en el que se crea esa correspondencia entre nombres del código fuente a direcciones de memoria física.

El binding puede generarse en tres momentos; en tiempo de ejecución, tiempo de compilación o tiempo de carga.

- Tiempo de compilación: Se utiliza cuando de antemano se conoce la dirección de memoria física exacta en la que se ubicará el proceso. El compilador genera el código absoluto directamente. Pero si la posición de inicio cambia en el futuro, surge la necesidad de recompilar todo el programa.

- Tiempo de ejecución: **Es lo utilizado por los sistemas operativos modernos**. Se retrasa el enlace hasa el tiempo de ejecución, lo que permite que un proceso se mueva de un espacio de memoria a otra durante su ejecución. Esto requiere de un soporte de hardware (MMU) para poder traducir las direcciones dinámicamente en ejecución.

- Tiempo de carga: Se utiliza cuando no se conoce de antemano la dirección de memoria física exacta en la que se ubicará el proceso. No hace falta tener que recompilar todo al volver a ejecutar el programa.

2. **¿En qué consiste la carga dinámica (*dynamic loading*) y por qué evita cargar rutinas que no se ejecutan?**

Resulta efectivo en programas de gran volumen de código, ya que consiste en la carga del programa bajo demanda. El programa se carga en RAM moduladamente y bajo demanda, por lo que se procesa por pedazos y no hace falta cargar el programa por completo en RAM para su ejecución, lo cual implica un mejor aprovechamiento de la memoria.

3. **¿Cómo funciona el montaje dinámico (*dynamic linking*) y qué papel cumplen los marcadores de posición (*stubs*) en las bibliotecas compartidas?**

El montaje dinámico consiste en el enlazado de las bibliotecas hasta el tiempo de ejecución, a diferencia del montaje estático en el que en tiempo de compilación se establecen todos los enlaces con las bibliotecas directamente en el binario generado.

Los stubs consisten en fragmentos de código que se incluyen en vez de el código real de la biblioteca. Al invocar la rutina por primera vez, este stub busca la biblioteca en memoria RAM y se reemplaza a sí mismo por la dirección en memoria de la biblioteca solicitada. 

> El stub es como un comodín.

---

## Parte 3: Asignación Contigua y Fragmentación
1. **¿Cómo funciona la asignación contigua en esquemas de monoprogramación, particiones fijas y particiones variables?**

- En esquemas de monoprogramación, se consideran dos espacios de memoria base, espacio de kernel y espacio de usuario. En este esquema se considera un solo proceso activo a la vez en espacio de usuario, y hay una consideración de seguridad, el límite entre el espacio de kernel y usuario. No se admite multiprogramación en este esquema.

- En esquemas de particiones fijas (MFT), se divide el espacio de usuario en particiones de magnitud fija (que pueden diferir entre sí). Cada partición aloja exactamente un proceso, y cuando un proceso termina, libera sus recursos para que otro proceso pueda tomar su lugar. El grado de multiprogramación es limitado por la cantidad de particiones que hayan. Si bien no se contempla el problema de fragmentación externa, al ser espacios de memoria fijos, se contempla una fragmentación interna.

- En esquemas de partición variable (MVT), se eliminan las limitaciones planteadas en los esquemas de partición fija. La memoria disponible es un gran bloque contiguo llamado agujero (hole), y se asignan bloques de memoria a procesos con su magnitud fija bajo demanda. Al liberar un proceso, el agujero se redimensiona con espacios libres adyacentes para volver a ser contiguo. Pero vuelve el problema de la fragmentación externa, donde pueden quedar algunos bloques de memoria "abandonados", sin memoria libre adyacente, de poca magnitud, por lo que quedan inutilizables.

2. **¿En qué consisten y cómo se comparan las estrategias de asignación de huecos: Primer Ajuste (*First-fit*), Mejor Ajuste (*Best-fit*) y Peor Ajuste (*Worst-fit*)?**

Estas estrategias consisten en formas para asignar memoria en bloques libres (agujeros).

- Primer Ajuste: El agujero que primero admita la magnitud del proceso a almacenar, lo almacena.
- Mejor Ajuste: Entre todos los agujeros disponibles, el mínimo superior a la magnitud del proceso lo almacena. Tiende a generar mucha fragmentación interna.
- Peor Ajuste: El espacio más grande disponible lo almacena. 

Esta variabilidad es lo que genera la fragmentación externa.

3. **¿Cuál es la diferencia fundamental entre la fragmentación interna y la fragmentación externa?**

La fragmentación interna consiste en espacio desaprovechado dentro de un bloque reservado, mientras que la fragmentación externa trata de espacios chicos entre bloques de memoria ocupada que no serán utilizados por su limitada capacidad.

4. **¿Qué es la compactación de memoria, cuándo es posible aplicarla y por qué resulta costosa computacionalmente?**

La idea de la compactación de memoria consiste en desplazar todos los procesos en memoria RAM hacia un extremo de la memoria disponible, para asi tener un bloque contiguo de memoria libre formado por todos los espacios de fragmentación externa, pudiendo dar uso a esos pedazos de memoria que quedaban "abandonados". 

Esta es una operación costosa ya que tiene que operar con gigabytes de información en memoria principal, sobrecargando el bus de datos y consumiendo valiosos ciclos de CPU. 

La solución moderna a este tipo de estrategias es la paginación, optando por un uso de memoria no contigua.

---

## Parte 4: Esquema de Segmentación
1. **¿Cómo organiza la memoria el esquema de segmentación para reflejar la visión lógica del programador (código, pila, datos, funciones)?**

Primero, el esquema de segmentación consiste en una organización de memoria por "segmentos" dinámicos que corresponden a las necesidades del usuario y el compilador; cada segmento representa una unidad lógica con un propósito definido.

- Código: Almacena el programa a ejecutar.
- Pila: Se encarga de la memoria estática, como variables locales y direcciones de retorno en funciones.
- Datos: Almacena constantes y variables globales.
- Heap: Se encarga de la memoria dinámica, como instancias de clases o estructuras de datos dinámicas.

El compilador se encarga automáticamente de generar estos segmentos al traducir el código fuente.

2. **¿Cómo funciona la traducción de direcciones mediante la tabla de segmentos utilizando la pareja $\langle \text{segmento}, \text{desplazamiento} \rangle$?**

La función de la tabla de segmentos es el traducir una pareja $\langle \text{segmento}, \text{desplazamiento} \rangle$? en una dirección en memoria física; esto se logra mediante la base y el límite, que son componentes de la tabla de segmentos. 

Teniendo la pareja $\langle \text{segmento}, \text{desplazamiento} \rangle$, $\langle \text{segmento}$ representa el índice a buscar en la tabla, y la dirección de memoria a buscar termina siendo la $\text{Base} + \text{offset}$, donde el offset es el segundo elemento del par original.

3. **¿Por qué la segmentación elimina la fragmentación interna pero sigue generando fragmentación externa?**

Elimina la fragmentación interna ya que asigna la memoria exacta que necesita cada proceso, pero sigue generando fragmentación externa debido que los segmentos son de longitud variable, y dependiendo de la entrada y salida de procesos, van quedando agujeros inutilizables por otros procesos.

---

## Parte 5: Paginación Básica y Traducción
1. **Marcos vs. Páginas:** ¿Qué son los marcos (*frames*) en RAM física y las páginas (*pages*) en memoria lógica, y por qué sus tamaños son siempre potencias de 2 ($2^n$)? 

La paginación consiste en un esquema de de gestión de memoria no contigua. Divide las espacio de direcciones físicas en **marcos** de longitud fija, y el espacio de direcciones lógicas en **páginas** de igual longitud que los marcos. Al tratarse de memoria no contigua, se pueden almacenar procesos repartiendo su contenido en diferentes bloques en memoria.

El por qué sus magnitudes siempre son potencias de 2 es bastante simple, ya que esto simplifica el esfuerzo de la CPU, sin tener que recurrir a operaciones matemáticas.

2. **División de la dirección:** ¿Cómo divide la CPU una dirección lógica en número de página ($p$) y desplazamiento ($d$)? 

Es un proceso de la CPU y la MMU en conjunto, dividiendo la dirección lógica en número de página y offset. El número de página indica la página a buscar, y el offset indica la posición exacta dentro de dicha página.

3. **Paso a paso de la MMU:** ¿Cuáles son los pasos exactos que sigue la MMU para reemplazar $p$ por el marco $f$ en la tabla de páginas sin alterar $d$? 

1. La MMU toma el número de página y lo usa como índice en la tabla de paginas.
2. Al encontrar el índice, reemplaza $p$ por $Base$ (Recordando que la tabla contiene $Base$ y $Límite$). 
3. Se conserva el desplazamiento, por lo que resulta un nuevo par $\text{Base} , \text{offset}$ que corresponde a la dirección física.

4. **Fragmentación en paginación:** ¿Por qué la paginación elimina totalmente la fragmentación externa pero conserva fragmentación interna en el último marco? 

Elimina la fragmentación externa debido a la paginación, que considera memoria descontigua en bloques de misma longitud, por lo que no hay un escenario en el que se puedan dejar bloques aislados (todo bloque libre es utilizable).

Se conserva la fragmentación interna en el último marco de un proceso (obviando que un proceso es repartido en múltiples marcos), y la explicación es bastante sencilla; si tenemos un proceso cuyo peso en memoria no coincide exactamente con alguna potencia de 2, entonces habrá un sobrante en el último marco, por lo que ese sobrante causa una fragmentación interna. 

5. **Páginas compartidas:** ¿Cómo permite la paginación compartir bibliotecas del sistema (como `libc`) entre múltiples procesos de forma segura? 

Todos los procesos tienen una tabla de paginación, donde pueden acceder en forma de lectura a los bloques de la biblioteca, permitiendo una reutilización de forma segura. El sistema operativo protege estas bibliotecas con roles de acceso, y si se intenta escribir sobre la biblioteca, salta una trampa. 

---

## Parte 6: Optimización con TLB y Rendimiento
1. **Función del TLB:** ¿Qué es el *Translation Lookaside Buffer* (TLB) y por qué evita que cada acceso lógico requiera dos accesos físicos a la RAM? 

Es una memoria caché asociativa dentro de la MMU, se dedica a almacenar los registros de la tabla de paginación recientes para agilizar el tiempo de acceso a memoria. 

Soluciona el problema del doble acceso a memoria para registros recurrentes, pero en caso de un TLB MISS, tiene que acceder de igual forma a la tabla de paginación y guardar su registro en el caché.

3. **Uso de ASID:** ¿Qué función cumplen los Identificadores de Espacio de Direcciones (ASID) en el TLB para evitar el *flushing* en cambios de contexto? 

El ASID es un identificador que relaciona al proceso con el TLB, entonces se puede diferenciar entre procesos en el TLB y al hacer cambios de contexto, que se preserven los datos necesarios.

---

## Parte 7: Estructuras Avanzadas de Tablas de Páginas
1. **Problema de tablas planas:** ¿Por qué una tabla de páginas lineal/plana resulta inviable en sistemas de 32 o 64 bits por su consumo de RAM? 

La idea es ahorrar recursos cuando escala la magnitud de la tabla, por lo que en vez de tener un vector masivo cargado en memoria principal, se carga una matriz, pero con el detalle de cargar solo aquellas filas que se requieren ya que gran parte de esta memoria no es utilizada activamente en su longitud entera.

2. **Paginación Jerárquica:** ¿Cómo funciona la paginación multinivel (*forward-mapped*) al dividir el número de página en $p_1, p_2, \dots$? 

La idea de la paginación multinivel se utiliza cuando hablamos de tablas de páginas masivas, donde se crean tablas que referencian a otras tablas, aplicando paginación sobre las mismas, con la finalidad de no tener la tabla como un bloque contiguo masivo en memoria.

3. **Tablas Hash y Clúster:** ¿En qué casos y cómo se aplican las tablas hash para direccionar espacios virtuales dispersos (*sparse*)? 

Cuando se escala demasiado, y la paginación jerárquica implica varios subniveles de tablas, se recurre a una Tabla Hash ya que se está tendiendo que acceder múltiples veces a RAM para poder recuperar un registro. En vez de tener que recurrir a una tabla masiva, se accede a una tabla de hash que, mediante una función hash, permite acceder rápidamente a las direcciones de memoria requeridas.

4. **Tabla de Páginas Invertida:** ¿Qué es una tabla invertida (una entrada por marco físico) y cuáles son sus ventajas en uso de RAM frente a sus desventajas en tiempo de búsqueda? 

La tabla de páginas invertida mantiene una tabla global para todos los procesos, por lo que cada proceso individual deja de tener su propia tabla de páginas. La tabla está indexada por número de marco en vez de página, y posee un índice de marco para cada marco de memoria.

Como beneficio frente a una tabla de páginas común, no se requiere una instancia de la tabla por cada proceso, sino que se contempla una tabla global, por lo que no se ve afectado cuando la cantidad de procesos crece.

---

## Parte 8: Intercambio (*Swapping*)
1. **Swapping tradicional vs. Paging:** ¿En qué se diferencia el *swapping* clásico de procesos completos frente al intercambio moderno por páginas (*page in* / *page out*)? 

Bien, primero hablando sobre swapping, este consiste en el pasado de RAM a alguna memoria secundaria debido a la falta de recursos, por lo que puede dejar procesos inutilizados en una memoria secundaria hasta que se vuelvan a requerir, pero esto suele ser tardado y se refleja en forma de lentitud en la computadora.

Sobre el swapping tradicional vs el swapping con paging, el swapping tradicional trata de pasar a segundo plano procesos enteros que no se estén necesitando activamente, mientras que los sistemas operativos modernos utilizan swapping con paging, donde resulta menos costoso guardar páginas bajo demanda en vez de procesos enteros, que implican una operación costosa cada vez que se debe recurrir a este método. 

2. **Sistemas Móviles (iOS/Android):** ¿Por qué los SO móviles desaconsejan o evitan el *swapping* convencional sobre almacenamiento flash? 

Evitan el swapping debido a que el almacenamiento flash se ve dagnificado por esta operación; se genera un desgaste en la memoria, por lo que simplemente se matan los procesos y se guarda su estado en vez de hacer un swap.