+++
date = '2026-08-06T20:43:06-03:00'
draft = false
title = 'Inferencia Estadística'
author = 'Valentino Mendé'
tags = ["inferencia", "repaso", "conceptos base"]
categories = ["Estadística"]
+++

Primero que todo, quiero alivianar la formalidad de este hilo; no estaremos hablando sobre axiomas ni estaremos haciendo demostraciones con tanto rigor (a menos que me de una corazonada). Por lo que nos podremos centrar en el propósito principal de esta parte de la materia.

Me parece interesante esta forma de ver la estadística, ya que no hay tanto interés en lo numérico, sino que podemos abstraer completamente esta parte para centrarnos en la interpretación de dichos números; de hecho, podríamos usar software estadístico para conseguir estos valores y concentrarnos en el análisis de estos.

A mi parecer, es intuitivo ver la estadística de esta forma, lo cual nos permite modelar estos procesos estadísticos y usarlos de forma práctica, por lo que me parece bastante funcional en cualquier escenario.

# Un repaso a la inferencia
Este post es un repaso de las conclusiones que se dan en Estadística I, dando el salto de la estadística descriptiva a la inferencial. Para mi, fue pesado cursar Estadística I, no por complejidad en el contenido, sino por lo tedioso que es el material; este se centra en la propia descripción de datos, por lo que se usa para analizar un conjunto de datos resumido en algunos valores clave, medidas de tendencia central, varianza, dispercion, gráficos, etc. 

Lo que quiero decir, y espero que no suene denigrante, es que todos estos procedimientos se pueden hacer con herramientas ya conocidas como excel, por lo que me parece una labor innecesaria.

Aquí entra la estadística inferencial a callarme cual hueso al perro. En la estadística inferencial obviamos estos procedimientos, incluso se promueve el uso de software para conseguir estos resultados (imaginarme feliz) y empezar a usar esto de forma pragmática para modelar el comportamiento de un fenómeno. 

La estadística inferencial consiste en obtener conclusiones sobre una población (parámetros) a partir de información muestral (estadísticos). Por lo que estudiando una muestra aleatoria significativa, podemos inferir el comportamiento de la población en cierto parámetro de interés.

No gastare tiempo en conceptos introducidos en Estadística I, pero de no estar familiarizado con estos conceptos, googlear lo siguiente bastaría para estar en contexto:

* Teorema del Límite Central (TLC)
* Error estándar
* Significancia
* P-Valor
* Población y muestra
* Estadístico y parámetro

Aunque quizá y hable de alguna definición más adelante.

# Conceptos fundamentales de la inferencia
(Respecto a lo anterior, dicho y hecho) Empecemos hablando de algunas ideas base para platicar más adelante:

- Población: Es el conjunto de todas las unidades de análisis o elementos del conjunto del cual se observa una o más características. Tiende a ser el objeto de interés en estudios estadísticos. 
- Variable: Característica o propiedad de una unidad de análisis. Puede ser medida y comparada mediante un valor numérico o una categoría. Tenemos variables cuantitativas continuas y discretas, y cualitativas nominales (sin orden. Dicotomicas o politomicas) y ordinales (con orden).
- Hipótesis estadística: Proposición o afirmación sobre una característica de la población que se puede poner a prueba para establecer si es verdadera o falsa. (La mayor parte de nuestro estudio de Estadística II consiste en la refutación de hipótesis estadísticas)
- Hipótesis nula y alternativa: La hipótesis nula consiste en una afirmación base sobre un fenómeno, mientras que la hipótesis alternativa aquella con la que se hace un contraste a la nula, probando con cierta confianza si esta estadísticamente sea verdadera o falsa.
- Técnicas de muestreo: Tenemos muestreo probabilístico y no probabilístico, donde a nosotros nos interesa más el probabilístico, enfocado en la aleatoriedad para aprovechar los principios del Teorema del Límite Central. 
- Estadístico: Es una característica numérica representante de una muestra respecto a una población. Es una variable (no como los parámetros, que son constantes), ya que depende completamente de los elementos de la muestra, y la muestra es aleatoria. 
- Variable tipificada *z*: Para poder usar nuestros procedimientos estadísticos, necesitamos transformar nuestras variables en variables tipificadas *z*, que son variables estandarizadas que representan la distancia de cada valor respecto a la media de la muestra. Básicamente usamos una métrica estándar para poder aplicar estos procedimientos. La media es 0 y la unidad de medida es la desviación estándar.
- Significancia: Se denota con $\alpha$ y representa la probabilidad de rechazar la hipótesis nula cuando ésta es verdadera. Es un margen de error que asumimos. La confianza es el complemento de esta, por lo que se la confianza se denota $1 - \alpha$.
- P-Valor: Un número muy usado en investicacion, que representa la probabilidad de obtener un valor igual o más extremo que el observado, si la hipótesis nula es verdadera. Nos permite cuantificar el riesgo de rechazar una hipótesis cuando ésta es verdadera, por lo que sería un falso positivo.

$$\text{Si } p \leq \alpha \Rightarrow \text{se rechaza } H_0$$ $$\text{Si } p > \alpha \Rightarrow \text{no se rechaza } H_0$$

# Distribuciones de muestreo
## Distribuciones de muestreo de medias muestrales
Es la distribución de probabilidad de todas las posibles medias muestrales según un tamaño de muestra dado, y su probabilidad asociada.

$$\bar{X} = \frac{1}{n}\sum_{i=1}^{n} X_i \qquad \Rightarrow \qquad E(\bar{X}) = \mu$$

La media de todas las medias de cada muestra de un tamaño dado, es la media de la población. El valor de muestra esperado $E(\bar{X})$ es igual a la media poblacional $\mu$.

$$\bar{X} \sim N\left(\mu, \frac{\sigma^2}{n}\right)$$

$$Z = \frac{\bar{X} - \mu}{\sigma/\sqrt{n}} \sim N(0,1)$$

$$T = \frac{\bar{X} - \mu}{S/\sqrt{n}} \sim t_{n-1}$$

Y a partir de esto es bueno repasar el TLC:

## Teorema del Límite Central (TLC)
El teorema dice que si nuestras muestras cumplen con $n >= 30$, entonces la distribución de las medias muestrales se aproxima a una distribución normal. Por lo que si tomamos una muestra **aleatoria** de por lo menos 30 elementos, podemos asumir normalidad aproximada en la población.

$$\text{Si } X_1, X_2, \ldots, X_n \text{ son i.i.d. con } E(X_i)=\mu \text{ y } Var(X_i)=\sigma^2,$$

$$\text{entonces } \bar{X} \xrightarrow{d} N\left(\mu, \frac{\sigma^2}{n}\right) \quad \text{cuando } n \to \infty$$

Por lo que entre más crece el tamaño de la muestra, más se aproxima a una distribución normal, eso quiere decir $n \to \infty$

## Distribución muestral de las proporciones muestrales
Al igual que con las medias muestrales, se observa que con muestras de $n >= 30$, la distribución de las proporciones muestrales se aproxima a una distribución normal, o dígase que el centro de la distribución es la proporción poblacional.

$$\hat{p} \sim N\left(p, \frac{p(1-p)}{n}\right)$$

$$Z = \frac{\hat{p} - p}{\sqrt{\dfrac{p(1-p)}{n}}} \sim N(0,1)$$

Siempre y cuando se cumpla:

$$np \geq 5 \quad \text{y} \quad n(1-p) \geq 5$$

> En síntesis, ambas distribuciones muestrales se aproximan a una normal cuando $n >= 30$, por lo que se puede estimar sobre su población con base a una muestra significativa.

# Estimaciones
## Estimaciones puntuales
Se estima una característica poblacional a partir de un solo valor extraído de la muestra. Es lo opuesto a un intervalo de confianza, que te da un rango de valores posibles; en una estimación puntual se utiliza un solo valor. Ejemplos de estimación puntual:

$$\bar{X} \text{ estima a } \mu$$
$$\hat{p} \text{ estima a } p$$
$$S^2 \text{ estima a } \sigma^2$$

A medida de que *n* crece, el error estándar de la estimación se reduce, lo que significa que la estimación es más precisa.

## Estimaciones de intervalo de confianza
Ahora no estimamos con base a solo un valor, sino que consideramos un intervalo en función de la significancia a la cual estamos interesados, en el cual quizá este el parámetro que estimamos.

$$\text{Estimador puntual} \pm \text{Margen de error}$$

$$IC = \bar{X} \pm z_{\alpha/2} \cdot \frac{\sigma}{\sqrt{n}}$$

para la media con $n < 30$ $$IC = \bar{X} \pm t_{\alpha/2,\, n-1} \cdot \frac{S}{\sqrt{n}}$$

y para la proporción $$IC = \hat{p} \pm z_{\alpha/2} \cdot \sqrt{\frac{\hat{p}(1-\hat{p})}{n}}$$

Y cabe aclarar que cuando hablamos de la confianza en dicho intervalo, no hablamos sobre que tenga cierta probabilidad de tener al parámetro, sino que consideramos la probabilidad de la generación de un intervalo que lo contenga.

# Tamaño de muestra
## Factor de corrección de población finita
Se dice que una población con cota superior es finita. Es común trabajar con poblaciones infinitas, cuales estadísticamente son tan masivas que siquiera pensamos en una cota superior. 

En los casos en los que es presente esta cota superior, se puede aplicar un factor de corrección para tratarla como una población estadísticamente infinita. 

Una regla práctica para considerar finita a una población  $$\frac{n}{N} > 0.05$$

El factor en sí $$FCPF = \sqrt{\frac{N-n}{N-1}}$$

Aplicado a la media $$\sigma_{\bar{X}} = \frac{\sigma}{\sqrt{n}} \cdot \sqrt{\frac{N-n}{N-1}}$$
$$IC = \bar{X} \pm z_{\alpha/2} \cdot \frac{\sigma}{\sqrt{n}} \cdot \sqrt{\frac{N-n}{N-1}}$$

Y aplicado a la proporción $$\sigma_{\hat{p}} = \sqrt{\frac{p(1-p)}{n}} \cdot \sqrt{\frac{N-n}{N-1}}$$ 
$$IC = \hat{p} \pm z_{\alpha/2} \cdot \sqrt{\frac{p(1-p)}{n}} \cdot \sqrt{\frac{N-n}{N-1}}$$

Si no se aplica este factor de corrección, el error estándar queda sobreestimado, lo cual exagera la variabilidad real del estimador.

$$\frac{\sigma}{\sqrt{n}} \geq \frac{\sigma}{\sqrt{n}} \cdot \sqrt{\frac{N-n}{N-1}}$$

Sin el factor de corrección, la varianza se nos dispara a valores muy altos, lo cual no es correcto.

## Tamaño de muestra para proporciones (u otro estimador)
Y ahora solucionamos un problema muy tangible, si queremos hacer una muestra para hacer un estudio, en primer lugar como determinamos un tamaño de muestra?

Partimos de la definición de intervalo de confianza para una proporción

$$E = z_{\alpha/2} \cdot \sqrt{\frac{\hat{p}(1-\hat{p})}{n}}$$

$$\frac{E}{z_{\alpha/2}} = \sqrt{\frac{\hat{p}(1-\hat{p})}{n}}$$

$$\left(\frac{E}{z_{\alpha/2}}\right)^2 = \frac{\hat{p}(1-\hat{p})}{n}$$

$$\frac{E^2}{z_{\alpha/2}^2} = \frac{\hat{p}(1-\hat{p})}{n}$$

$$n \cdot E^2 = z_{\alpha/2}^2 \cdot \hat{p}(1-\hat{p})$$

$$n = \frac{z_{\alpha/2}^2 \cdot \hat{p}(1-\hat{p})}{E^2}$$

Por lo que con esta idea podemos conseguir el tamaño de muestra ideal para una significancia dada y un margen de error, recordando que 

$$IC = \text{Estimador puntual} \pm \text{Margen de error}$$

Si bien ejemplificamos con proporciones anteriormente, es la misma idea para las medias; bello manejo algebraico.

---

Y bueno, este capítulo tuvo una carga conceptual fuerte, espero que no se haya leído como conceptos que fui aventando (aunque parcialmente fue eso), pero ya estamos en contexto para charlar un poco de los temas posteriores.
