+++
title = 'Almacenamiento Masivo'
date = '2026-11-22T22:27:48-03:00'
draft = false
toc = true                 
author = 'Valentino Mendé'
tags = ['Sistema Operativo']
categories = ['Computación']
+++

## Parte 1: Arquitectura Física y Rendimiento (HDD vs. SSD/NVM)

1. **HDD (Geometría y Tiempos de Acceso):** ¿Cómo se organizan físicamente los datos en un disco mecánico (platos, pistas, cilindros, sectores) y cuáles son los 3 componentes del tiempo de acceso (búsqueda, latencia rotacional, transferencia), explicando por qué las E/S aleatorias degradan tanto el rendimiento?

En un disco mecánico, tratamos con un brazo con un cabezal que se encarga de leer datos, este cabezal se desplaza a través de pistas, que a su vez contienen sectores, por lo que el sector es considerado la unidad de almacenamiento (aprox 4kb), estos sectores son contenidos en el cilindro.

Se consideran tres componentes de tiempo de acceso, búsqueda, latencia rotacional (tiempo que tarda en desplazarse el cabezal, pueden llegar a ser milisegundos), y transferencia. Debido a estos componentes de tiempo de acceso, las E/S aleatorias degradan el rendimiento ya que como es sabido, los discos mecánicos son lentos debido al movimiento de sus componentes mecánicos, a diferencia de su alternativa popular, el SSD, que carece de componentes mecánicos e incluso admite paralelismo.

Debido a esta tardanza en los componentes mecánicos, se consideran algoritmos de gestión de memoria para intentar agilizar su E/S.

2. **SSD/NVM (FTL, Desgaste y TRIM):** ¿Cómo funciona la memoria NAND Flash (páginas vs. bloques de borrado), qué rol cumple la capa FTL (nivelación de desgaste y recolección de basura), qué es la amplificación de escritura y para qué sirve el comando TRIM?

En contraste con los HDD, las memorias NAND Flash poseen un paginado similar a lo que vimos en memoria principal y virtual (todo gracias al TLS). El tiempo de lectura y escritura en estas páginas es bastante rápido, pero con el limitante de que para poder escribir en una página, primero se debe borrar su contenido actual, y esa operación de borrado no se puede realizar puntualmente en esa página, sino que se realiza en todo un conjunto (un bloque), y además es una operación tardada en contraste con E/S. 

Es interesante agregar que estas memorias tienen una vida útil, ya que cada celda de memoria puede admitir hasta $100,000$ borrados antes de afectar a la celda. Esto es gestionado por la capa FTL, que se encarga de nivelar y distribuir uniformemente el uso de celdas de memoria, por lo que si empiezan a surgir problemas con alguna celda, posiblemente significa que la memoria ya esté en sus últimos alientos. 

El comando TRIM sirve para avisar qué bloques lógicos han sido liberados, para que el recolector de basura pueda ir a hacer su trabajo y no quede memoria en disco.

3. **Interfaces de Conexión:** ¿Qué diferencias principales existen entre las interfaces/buses tradicionales (SATA/SAS) y NVMe sobre PCIe en cuanto a velocidad, colas y paralelismo?

La diferencia principal es que SATA/SAS fueron pensados para discos mecánicos, mientras que NVMe esta pensado para NAND Flash, por lo que son dos arquitecturas distintas. En los benchmarks NVMe destroza a SATA/SAS. 

---

## Parte 2: Algoritmos de Planificación de Disco (E/S)

4. **Algoritmos Mecánicos Clásicos:** ¿Cómo funcionan FCFS, SSTF, SCAN, C-SCAN, LOOK y C-LOOK, por qué SSTF puede causar inanición (*starvation*) y qué ventaja ofrecen C-SCAN/C-LOOK en la uniformidad de espera?

Todos estos algoritmos tratan con discos mecánicos HDD, por lo que hoy en día no son lo común en computadoras personales. Pero la cosa va así:

- FCFS: El primero en llegar es el primero en ser servido, por lo que el primero en llegar a cola es el primero en ser atendido. Genera movimientos indiscriminados del cabezal en el disco, no es nada de otro mundo.

- SSTF: Shortest Seek Time First, atiende lo más próximo en memoria primero, por lo que constantemente atiende sectores en la cercanía. Presenta el problema de inanición, donde constantemente atiene sectores en la cercanía, dejando abandonados los extremos lejanos.

- SCAN: Va atendiendo de extremo a extremo, viajando de izquierda a derecha y de derecha a izquierda (regresando). 

- C-SCAN: Scan circular, lo mismo que scan, pero al llegar de izquierda a derecha, regresa directamente a origen izquierdo y empieza denuevo.

- LOOK: No solo atiende, sino que va leyendo si tiene algo que atender para ahorrar tiempos. Es una versión optimizada de los SCAN.

- C-LOOK: Lo mismo que LOOK, pero al llegar al último sector requerido a derecha, regresa hasta origen izquierdo. 

Las alternativas circulares ofrecen mejor uniformidad de espera ya que aliminan la asimetría en los regresos, haciendo algoritmos unilaterales.

5. **Planificación Moderna en SSDs (`blk-mq`):** ¿Por qué los algoritmos de movimiento de cabezal no tienen sentido en SSDs y cómo aprovecha Linux la arquitectura de bloques multicola (`blk-mq`) en NVMe?

No tienen sentido los algoritmos de movimiento de cabezal porque NO HAY CABEZAL!!! (brillante).

El tiempo de acceso a memoria NAND Flash es uniforme, por lo que no se requieren de estos algoritmos, por lo que basta con tener políticas FCFS simples y ya.

El *blk-mq* permite asignar una cola a cada núcleo del cpu, efectivamente paralelizando sus accesos de almacenamiento masivo.

---

## Parte 3: Gestión del Dispositivo (Preparación, Swap y Bad Blocks)

6. **Preparación y Arranque:** ¿En qué consisten los 3 pasos para preparar un disco (formateo físico/bajo nivel, particionado MBR/GPT y formateo lógico) y cómo interactúa el firmware (BIOS/UEFI) para cargar el sistema operativo?

Los tres pasos para preparar un disco son:
- Formateo Físico: Se crean los sectores o inicializa la tabla de páginas en NAND Flash.
- Particionado: Consideramos particionado MBR y GPT, creando separaciones lógicas en bloques de memoria, por ejemplo, userspace y kernelspace.
- Formateo Lógico: Registra las estructuras iniciales del **sistema de archivos (tema a futuro)**. 

7. **Memoria de Swap y Bloques Defectuosos:** ¿Qué tipo de datos guarda el espacio de *swap* (partición cruda vs. archivo de swap) y cómo gestionan los sectores dañados (*bad blocks*) la controladora física (reasignación de sectores) y el sistema operativo?

El espacio de swap es una zona de memoria secundaria dedicada a almacenar la memoria virtual. Hay dos formas de tratar esta zona: 

- Partición Cruda: Una partición sin estructura completamente dedicada a almacenar los datos. Es óptima en tiempos de acceso y transmisión de datos. No posee sistema de archivos. 

- Archivo de Swap: En vez de una partición, se tiene un archivo dinámico (puede aumentar o disminuir su peso), que vive en el sistema de archivos. Resulta más lento por la fragmentación externa y las propias estructuras del sistema de archivos.

Para tratar con los bad blocks, que son celdas desgastadas, se utilizan algunos métodos: Para celdas que no estan desgastadas del todo pero que presentan un error en su almacenamiento, son celdas de error blando, donde se pueden corregir sus errores sin pasar a mayores. Si los bits afectados superan la capacidad de correccion, tratamos con un error duro, con una pérdida irrecuperable de los datos.

Si tenemos un error duro, consideramos *sustitución de sectores* (en el formateo físico se definen algunos sectores como reemplazo en estos escenarios, estos no son visibles para el SO), entonces la controladora del disco se encarga de sustituir los sectores afectados por los de reemplazo.

En unidades SSD/NVM es trivial el manejo de estas páginas afectadas, simplemente se bloquean y reasignan dede el área de sobreprovisionamiento. (El sobreprovisionamiento consiste en que se reserva parte de la memoria total ~20% para reemplazo de errores.) 

---

## Parte 4: Redundancia y Confiabilidad (Estructuras RAID)

8. **Niveles Básicos de RAID (0, 1, 5 y 6):** ¿Cómo funcionan, qué capacidad útil entregan y cuántas fallas de discos toleran RAID 0 (*striping*), RAID 1 (*mirroring*), RAID 5 (paridad distribuida) y RAID 6 (doble paridad P+Q)?

Primero, la idea de RAID consiste en tener múltiples dispositivos de almacenamiento secundario funcionando en paralelo, agilizando la velocidad de transferencia y el rendimiento.

- RAID 0: Distribución en bandas. Reparte los bloques de datos entre los discos disponibles sin agregar redundancia, por lo que si falla un disco, cae todo.

- RAID 1: Mantiene una copia idéntica de cada disco. Duplica la tasa de lectura y una rápida reconstrucción ante fallos, pero disminuye la capacidad en 1/2.

- RAID 5: Es la variante de paridad más común. Distribuye paridad en todos los discos, tolera la falla de un disco

- RAID 6: Similar a RAID 5, pero almacena 2 bloques de redundancia, con la capacidad de detectar fallos hasta en 2 discos.

9. **RAID Anidados (1+0 vs. 0+1):** ¿En qué se diferencia la estructura de RAID 1+0 (10) frente a RAID 0+1 y por qué RAID 1+0 es significativamente más confiable y seguro de reconstruir tras una falla?

- En RAID (0 + 1) primero se aplica RAID 1 y después RAID 0, por lo que se distribuyen los datos sin redundancia y después se clonan.

- En RAID (1 + 0) primero se clonan y después se distribuyen.

Resulta ser más seguro RAID (1 + 0), ya que ante un fallo, solo ese disco queda afectado.

10. **RAID HW vs. SW y Discos de Reserva:** ¿Qué diferencia un arreglo RAID por hardware de uno por software y qué función cumple un disco de reserva caliente (*hot spare*)?

En RAID HW, se tiene un componente de hardware dedicado a la gestión de bandas, por lo que el CPU puede delegar trabajo a este componente. En RAID SW, el CPU tiene que dedicar operaciones el mismo a la gestión de bandas; es más barato, pero consume ciclos de CPU. 

Los discos de reserva sirven como discos activos en memoria completamente dedicados a soportar fallos de otros discos; si un disco falla, se reasigna automáticamente al disco hot spare para aguantar sin tener que intervenir inmediatamente con un técnico.

---

## Parte 5: Arquitecturas de Conexión del Almacenamiento

11. **Direct-Attached vs. NAS vs. SAN vs. Objeto:** ¿Cuáles son las diferencias fundamentales entre el almacenamiento conectado al host (SATA/NVMe), NAS (acceso a archivos por red vía NFS/SMB), SAN (red dedicada a nivel de bloques vía iSCSI/Fibre Channel) y el almacenamiento de objetos (APIs REST/HTTP)?

- Direct-Attached: Hay una comunicación directa mediante puerto y cable, así de simple.

- NAS: Conexión mediante una red local sobre protocolos de red estándar TCP/UDP.

- SAN: (Storage Area Network) Red privada dedicada a la conexión de dispositivos de almacenamiento con servidores mediante conmutadores SAN (switches). 

- Objetos: Comunicación mediante una WAN mediante APIs o frameworks distribuidos como Ceph y HDFS.

