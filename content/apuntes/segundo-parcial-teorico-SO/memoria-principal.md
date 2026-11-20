+++
title = 'Gestión de Memoria Principal'
date = '2026-11-19T20:43:00-03:00'
draft = true
author = 'Valentino Mendé'
tags = ['Sistema Operativo', 'Examen']
categories = ['Computacion']
+++

Planteo cada sección como una serie de preguntas guía para entender el tema.

## Parte 1: Conceptos Fundamentales y Necesidad de Gestión
1. **¿Por qué es indispensable la gestión de memoria en un sistema operativo multiprogramado?**



2. **¿Qué diferencia a la memoria principal de los registros de la CPU y del almacenamiento masivo en cuanto a velocidad de acceso y directitud para la CPU?**
3. **¿Cómo garantizan la protección de memoria los registros base y límite (o de relocalización)?**
4. **¿Cuál es la diferencia exacta entre el espacio de direcciones lógico (o virtual) y el espacio de direcciones físico?**
5. **¿Qué rol cumple la Unidad de Gestión de Memoria (MMU) y cómo realiza la traducción de direcciones en tiempo de ejecución?**

---

## Parte 2: Ciclo de Vida del Programa y Enlace de Direcciones
1. **¿En qué momentos del ciclo de vida de un programa se puede realizar el enlace (*binding*) de instrucciones y datos a direcciones de memoria (compilación, carga o ejecución)?**
2. **¿En qué consiste la carga dinámica (*dynamic loading*) y por qué evita cargar rutinas que no se ejecutan?**
3. **¿Cómo funciona el montaje dinámico (*dynamic linking*) y qué papel cumplen los marcadores de posición (*stubs*) en las bibliotecas compartidas?**

---

## Parte 3: Asignación Contigua y Fragmentación
1. **¿Cómo funciona la asignación contigua en esquemas de monoprogramación, particiones fijas y particiones variables?**
2. **¿En qué consisten y cómo se comparan las estrategias de asignación de huecos: Primer Ajuste (*First-fit*), Mejor Ajuste (*Best-fit*) y Peor Ajuste (*Worst-fit*)?**
3. **¿Cuál es la diferencia fundamental entre la fragmentación interna y la fragmentación externa?**
4. **¿Qué es la compactación de memoria, cuándo es posible aplicarla y por qué resulta costosa computacionalmente?**

---

## Parte 4: Esquema de Segmentación
1. **¿Cómo organiza la memoria el esquema de segmentación para reflejar la visión lógica del programador (código, pila, datos, funciones)?**
2. **¿Cómo funciona la traducción de direcciones mediante la tabla de segmentos utilizando la pareja $\langle \text{segmento}, \text{desplazamiento} \rangle$?**
3. **¿Por qué la segmentación elimina la fragmentación interna pero sigue generando fragmentación externa?**

---

## Parte 5: Paginación Básica y Mecanismos de Traducción
1. **¿Qué son los marcos (*frames*) de memoria física y las páginas (*pages*) de memoria lógica, y por qué sus tamaños son siempre potencias de 2?**
2. **¿Cómo se divide una dirección lógica generada por la CPU en número de página ($p$) y desplazamiento ($d$)?**
3. **¿Qué pasos exactos sigue la MMU para reemplazar $p$ por el número de marco ($f$) en la tabla de páginas manteniendo el desplazamiento $d$?**
4. **¿Por qué la paginación elimina por completo la fragmentación externa, pero mantiene cierto grado de fragmentación interna?**
5. **¿Cómo permite la paginación compartir código (como bibliotecas del sistema) entre distintos procesos de forma segura?**

---

## Parte 6: Optimización de Rendimiento con el TLB
1. **¿Qué es el *Translation Lookaside Buffer* (TLB) y por qué es crucial para evitar que cada acceso a memoria requiera dos accesos físicos?**
2. **¿Cómo se calcula el Tiempo Efectivo de Acceso (EAT) combinando la tasa de aciertos (*hit ratio*) del TLB y el tiempo de acceso a la RAM?**
3. **¿Qué son y qué función cumplen los Identificadores de Espacio de Direcciones (ASID) en las entradas del TLB durante los cambios de contexto?**

---

## Parte 7: Estructuras Avanzadas para Tablas de Páginas
1. **¿Por qué las tablas de páginas planas resultan inviables en espacios de direcciones de 32 o 64 bits debido a su tamaño en RAM?**
2. **¿Cómo funciona la paginación jerárquica multinivel (o *forward-mapped*) dividiendo el número de página en $p_1, p_2, \dots$?**
3. **¿Cómo funcionan las tablas de páginas hash y las tablas en clúster para manejar espacios de direcciones dispersos (*sparse*)?**
4. **¿Qué es una tabla de páginas invertida (una entrada por marco físico) y cuáles son sus ventajas en uso de RAM y desventajas en búsqueda?**

---

## Parte 8: Intercambio (*Swapping*)
1. **¿Cuál es la diferencia entre el *swapping* tradicional de procesos completos y el intercambio de páginas moderno (*page in* / *page out*)?**
2. **¿Por qué los sistemas operativos móviles como iOS y Android desaconsejan o no utilizan *swapping* convencional sobre su memoria flash?**

---

## Parte 9: Implementaciones en Arquitecturas Reales
1. **¿Cómo maneja Intel la memoria en IA-32, qué es PAE (*Physical Address Extension*) y cómo amplia el bus físico a 36 bits?**
2. **¿Cómo implementa la arquitectura x86-64 una jerarquía de 4 niveles utilizando 48 bits efectivos de dirección virtual?**
3. **¿En qué consisten los gránulos de traducción (4 KB, 16 KB, 64 KB) y las micro-TLB en la arquitectura ARMv8?**