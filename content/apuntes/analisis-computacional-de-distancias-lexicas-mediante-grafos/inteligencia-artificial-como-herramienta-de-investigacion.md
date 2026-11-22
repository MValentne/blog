+++
date = '2026-08-28T00:23:23-03:00'
draft = true
title = 'Inteligencia Artificial Como Herramienta De Investigación'
author = 'Valentino Mendé'
tags = ["IA", "investigación", "Agentes"]
categories = ["Computación"]
+++

Siendo este mi primer proyecto de investigación formal, no quise dejar pasar la oportunidad de probar herramientas curiosas para dicho trabajo. En su momento, leyendo novedades en Github, me entere de un proyecto al leer el feed en el que un profesor mio había estado interesado en en una supuesta herramienta de investigación científica con inteligencia artificial como motor. Adjunto el proyecto [aquí](https://github.com/handsome-rich/Awesome-Auto-Research-Tools). 

Me pareció interesante la idea de IA como herramienta de investigación, ya que a mis ojos sería más un limitante que un beneficio. Es fácil pensar inmediatamente en la IA como una fuente de poco rigor a la hora de buscar información sobre un tema, ya que cae en generalizaciones o en un peor escenario, aluscinacion. Estuve dando vueltas a esta idea para buscar una forma de implementarla de tal manera en la que realmente sea de ayuda a la investigación más que una fuente información probabilística de la que no se puede confiar.

Uso Opencode-CLI, ya que al ser open source es accesible y seguro, además de tener un fácil acceso al proovedor [OpenCode-Zen](https://opencode.ai/docs/zen/); mi interés en este proveedor radica en sus modelos gratuitos (Tienen cierto modelo de negocio en el que te dejan acceso libre a ciertos modelos como forma experimental para ellos, pero en el lado de usuario es una maravilla el tener acceso a este poder de cómputo de forma virtualmente ilimitada). Si bien mis búsquedas previas respecto a la decisión de tomar un agente de código para trabajo de investigación fueron bastante negativas (constantemente se hacia énfasis en que un agente de código tiene como fuerte el código, pero no puede ser implementado en otros campos), decidí ignorar dichos comentarios y experimentar con un agente personalizado de OpenCode.

Me aseguré de que este agente no fuera limitado por un solo LLM, ya que los modelos gratuitos de OpenCode-Zen suelen rotar a medida que se actualizan, por lo que preferí optar por esta versatilidad de poder usar cualquier LLM en cualquier punto del proyecto y que este no cambie el resultado esperado.

El agente consiste en un conjunto de reglas que definen el comportamiento, funcionamiento, capacidades y limitaciones del LLM de turno, por lo que se espera un resultado consistente y predecible en cualquier contexto. Algunas capacidades establecidas por este ruleset son:

> De base, al ser un agente de código, posee acceso controlado a una computadora (por lo que no tiene acceso superusuario y cualquier proceso relevante es informado preivo a ejecución), lo cual permite funciones como manejo de terminal (bastante poderoso), manejo de archivos, ejecución de scripts, búsqueda en internet, uso de herramientas de terminal, entre otras.

1. Búsqueda web académica (websearch): Busca papers, artículos científicos y fuentes académicas. Prioriza Google Scholar, PubMed, arXiv, entre otros, por lo que limita su alcance de búsqueda a fuentes confiables. Filtra por fecha de publicación, citaciones y relevancia.
2. Lectura y análisis de documentos (read): Lectura de PDF's y documentos académicos. Identifica metodología, hallazgos y limitaciones. Extrae datos clave.
3. Generación Bibliográfica: APA 7a edición, MCA, Chicago, Vancouver, IEEE.
4. Resumen de papers: Analiza la estructura de Contexto --> Objetivo --> Método --> Resultados --> Conclusiones. Identifica contribución original y limitaciones.
5. Análisis Crítico: Evalúa calidad metodológica. Identifica sesgos y conflictos de interés. Compara hallazgos con literatura existente.

Ahora, sobre **skills** particulares que agilizan el flujo de trabajo:

> Primero aclaro, una skill no es nada más que una función/proceso; es un conjunto de instrucciones personalizadas para un workflow particular, de uso modular y reutilizable.

Las skills de investigación que posee este agente cubren el ciclo completo de trabajo académico, desde la búsqueda de literatura hasta la publicación. Se cargan bajo demanda según la tarea detectada (trigger keywords en cada **SKILL.md**) y no saturan el contexto del LLM si no se necesitan:

| Skill | Función | Tarea que desencadena su uso |
|-------|---------|------------------------------|
| **systematic-review** | Protocolo PRISMA 2020 completo: búsqueda estructurada, cribado, extracción, evaluación de calidad y síntesis (cualitativa y meta-análisis) | "revisión sistemática", "meta-análisis", "PRISMA" |
| **citation-analysis** | Análisis bibliométrico: redes de citación, co-citación, h-index, factor de impacto, detección de papers seminales y benchmarking | "análisis de citaciones", "bibliometría", "papers más citados" |
| **gap-analysis** | Identificación sistemática de brechas en la literatura (evidencia, metodológicas, teóricas, contextuales) y priorización de nuevas líneas de investigación | "brechas de investigación", "que falta investigar", "nuevas lineas de investigación" |
| **methodology-critique** | Evaluación crítica de validez interna/externa, sesgos, asignación, cegamiento y calidad metodológica general | "crítica metodológica", "sesgos", "calidad del estudio" |
| **statistical-review** | Revisión de análisis estadístico: potencia, supuestos, selección de pruebas, errores comunes (p-hacking, HARKing) y reporte | "revisión estadística", "poder estadístico", "tamaño efecto" |
| **data-extraction** | Extracción estructurada de datos de papers (población, diseño, variables, resultados, tablas) con reglas de consistencia y validación | "extraer datos", "tablas", "extraer estadísticos" |
| **ethics-review** | Evaluación de consideraciones éticas: consentimiento informado, aprobación IRB/CEI, análisis riesgo-beneficio, poblaciones vulnerables | "revisión ética", "consentimiento informado", "comité de ética" |
| **plagiarism-check** | Detección de plagio directo, de ideas y accidental; verificación de citación correcta y técnicas de parafraseo aceptable | "verificar plagio", "revisar originalidad", "Turnitin" |
| **writing-assistant** | Redacción académica estructurada: IMRAD, abstract, introducción con embudo invertido, estilos APA/Vancouver/Chicago | "redactar introducción", "escribir resumen", "ayuda a escribir" |
| **journal-matching** | Selección de revistas para publicar: alcance temático, cuartil, tiempo de revisión, APC y detección de revistas depredadoras | "donde publicar", "seleccionar revista", "journal matching" |
| **markdown-to-pdf** | Conversión de notas de investigación en markdown a PDF formateado para lectura en Kindle o impresión A4 | "convertir a pdf", "exportar a pdf" |

---

Ahora mismo el trabajo sigue en una etapa de definición y exploración de ideas. Pude darle uso a esta herramienta para enterarme del *state of the art* del tema a investigar, pudo generar un documento con citas correctas y un paneo legítimo del tema, pero como observación, se limita a hablar superficialmente sobre los temas ya que da más importancia en la cita del trabajo original, lo cual me parece bastante prudente.

Además, lo empece a usar dentro de un [repositorio](https://github.com/MValentne/linguistic-distance-graphs); este sirve de entorno de trabajo colaborativo en el que va documentando cada tarea relevante que se lleva a cabo (tiene un archivo markdown y la indicación de actualizarlo cada vez que hay una novedad en la investigación, este sirve como bitácora para el agente), y tiene un espacio para escribir sus investigaciones, por lo que todas sus salidas relevantes son almacenadas sistemáticamente para posterior lectura y referencia.

Hasta ahora ha tenido un rol de búsqueda y exploración de ideas, me presenta fuentes relevantes para lo que quiero aprender y me deja al tanto de brechas y limitaciones en la bibliografía existente, por lo que deja a la vista posibles caminos alternativos para la investigación.

Si bien es un agente de código, con propósito base en la programación, hasta ahora ha presentado buenos resultados. El que tenga acceso a mi computadora me permite ordenarle que se maneje con archivos del sistema, y que además puede usar herramientas de terminal como curl, por lo que tiene acceso a lectura en la web o extenderse a software de CLI que llegue a instalar.
