+++
title = 'Memoria Virtual'
date = '2026-11-21T14:35:37-03:00'
draft = true
author = 'Valentino Mendé'
tags = ['tag1', 'tag2']
categories = ['Categoría']
+++

## Parte 1: Fundamentos y Paginación bajo Demanda
1. **Concepto de Memoria Virtual:** ¿Cómo permite la memoria virtual ejecutar programas parcialmente cargados en RAM y qué ventajas aporta a la multiprogramación?
2. **Paginación bajo demanda (*Demand Paging*):** ¿Qué es la carga bajo demanda y en qué se diferencia de la paginación pura?
3. **Bit de Validez (V/I):** ¿Qué indica el bit de *válido/inválido* en las entradas de la tabla de páginas?

---

## Parte 2: Fallo de Página (*Page Fault*) y Copia en Escritura (COW)
1. **Secuencia del Fallo de Página:** ¿Cuáles son los 6 pasos exactos que ejecuta el SO cuando la CPU referencia una página con bit inválido (interrupción, E/S y reinicio de instrucción)?
2. **Impacto en el EAT:** ¿Cómo afecta el tiempo de servicio de fallo de página ($t_{\text{servicio}}$ en ms) al Tiempo Efectivo de Acceso?
3. **Copia en Escritura (*Copy-on-Write / COW*):** ¿Cómo optimiza COW la llamada al sistema `fork()` compartiendo páginas de solo lectura hasta que un proceso intenta modificar una?

---

## Parte 3: Algoritmos de Reemplazo de Páginas
1. **Algoritmo FIFO y Anomalía de Belady:** ¿En qué consiste el reemplazo FIFO y por qué sufre de la anomalía de Belady (más marcos pueden producir más fallos)?
2. **Algoritmo Óptimo (OPT):** ¿Por qué OPT ofrece la cota inferior teórica de fallos de página y por qué es irrealizable en la práctica?
3. **Algoritmo LRU (Menos Usada Recientemente):** ¿Cómo funciona LRU y cuáles son sus implementaciones por contador de reloj o por pila?
4. **Segunda Oportunidad (Reloj) y Bit de Modificación:** ¿Cómo aproxima el algoritmo del reloj a LRU usando el bit de referencia, y cómo se mejora combinándolo con el bit sucio (*dirty bit*)?

---

## Parte 4: Asignación de Marcos y Hiperpaginación (*Thrashing*)
1. **Asignación Local vs. Global:** ¿En qué se diferencia el reemplazo de marcos local frente al global entre procesos?
2. **Hiperpaginación (*Thrashing*):** ¿Qué es el *thrashing*, por qué ocurre cuando la CPU baja su ocupación y la E/S se satura, y cómo se detecta?
3. **Modelo del Conjunto de Trabajo (*Working-Set*):** ¿Cómo previene el *thrashing* midiendo la localidad temporal mediante la ventana $\Delta$?
4. **Frecuencia de Fallos de Página (PFF):** ¿Cómo ajusta el SO el número de marcos de un proceso mediante límites superior e inferior de tasa de fallos?

---

## Parte 5: Memoria del Kernel y SO Reales
1. **Asignación de Memoria del Kernel:** ¿Por qué la memoria del kernel se asigna con esquemas propios como la *descomposición binaria* (*Buddy System*) y *franjas* (*Slab Allocation*)?
2. **Estrategias en Linux, Windows y Solaris:** ¿Cómo gestionan la recuperación de páginas Linux (`kswapd` con listas activa/inactiva) y Solaris (`pageout` con reloj de dos manecillas)?
3. **Fijación de Páginas (*Page Pinning*):** ¿Por qué es obligatorio fijar marcos en memoria mediante bits de bloqueo durante operaciones de E/S de DMA?