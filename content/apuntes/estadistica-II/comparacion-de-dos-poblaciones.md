+++
date = '2026-08-07T23:27:07-03:00'
draft = false
title = 'Comparación De Dos Poblaciones'
author = 'Valentino Mendé'
tags = ["medias", "proporciones", "inferencia"]
categories = ["Estadística"]
+++

(mucho contenido)

# Introducción al tema
A lo largo de este capítulo veremos como comparar un parámetro en común entre dos poblaciones para determinar si hay evidencia estadística suficiente para indicar que hay una igualdad o una diferencia entre estas poblaciones. Podremos resolver cuestiones como:

> Hay una diferencia en el tiempo de reacción entre hombres y mujeres en un determinado rango de edad?

Por lo que estudiaremos ciertos estimadores para comparar las poblaciones.

Usaremos como **parámetros** la diferencia de medias $\Delta\mu = \mu_1 - \mu_2$ y diferencia de proporciones $\Delta\phi = \phi_1 - \phi_2$.

Y usaremos los **estimadores** correspondientes $\hat{\Delta x} = \bar{x}_1 - \bar{x}_2$ y $\hat{\Delta p} = \hat{p}_1 - \hat{p}_2$.

El muestreo de ambas poblaciones debe ser probabilístico y de carácter aleatorio. El más común es el muestreo aleatorio simple, en el que todos los elementos de la población tienen la misma probabilidad de ser parte de la muestra.

La aplicación de los principios de la estadística inferencial pasa por tres partes:
1. Las distribuciones muestrales
2. La estimación de los parámetros
3. El contraste de hipótesis

## Distribuciones muestrales
Un repaso breve y aclaración de conceptos base, para que sea más intuitivo entender lo que hablaremos más adelante.

Al comparar dos poblaciones, lo hacemos mediante muestras, en particular los estadísticos de dicha muestra; pero estos estadísticos dependen de la distribución muestral de la muestra. Dígase, cada muestra es aleatoria y posiblemente distinta, por lo que es complicado comparar dos poblaciones y que nos den valores completamente idénticos.

Entonces optamos por preguntarnos si son lo suficientemente parecidas para considerar si hay una diferencia o no, ya que por el carácter aleatorio de esta comparación se admite cierto margen para probar su diferencia. La distribución de frecuencias de un estadístico muestral se llama **distribución muestral**. Entonces, la **distribución muestral de un estadístico** consiste en el valor que toma en todos los posibles subconjuntos de tamaño *n* de la población.

Podemos construir experimentalmente una distribución muestral de un estadístico mediante muestras en de tamaño *n* de una población finita; de cada muestra calculamos el estadístico y lo tabulamos en una tabla de frecuencias. A partir de eso podemos visualizar la distribución muestral mediante un histograma o una gráfica de barras.

> A continuación habrá un desarrollo pesado, quiero primero decir que en la práctica es mucho más sencillo de lo que aparenta. En gran parte es el mismo procedimiento para medias que para proporciones, lo relevante es tener claro el cómo es el seguimiento lógico de qué tenemos que hacer y por qué lo tenemos que hacer.

# Diferencia de medias poblacionales
Empecemos comparando la media entre poblaciones para determinar si hay una diferencia entre estas o no.

## Distribución muestral de la diferencia de medias muestrales
Se tienen dos poblaciones distintas, la primera con la media $\mu_1$ y desviación estándar $\sigma_1$, la segunda con la media $\mu_2$ y desviación estándar $\sigma_2$. Se elige una muestra de tamaño *n* de cada población y se calcula la diferencia de medias muestrales $\bar{x}_1 - \bar{x}_2$. La distribución muestral de todas esas diferencias se denota como $\Delta \hat{x} = \bar{X}_1 - \bar{X}_2$.

La distribución es aproximadamente normal si $n_1 >= 30$ y $n_2 >= 30$.

El error estándar para la diferencia de medias muestrales es:
$$SE = \sqrt{\dfrac{\sigma_1^2}{n_1} + \dfrac{\sigma_2^2}{n_2}}$$

Y si se usan varianzas muestrales: 
$$SE = \sqrt{\dfrac{s_1^2}{n_1} + \dfrac{s_2^2}{n_2}}$$

El estadístico *z* se obtiene mediante: 
$$Z = \dfrac{(\bar{x}_1 - \bar{x}_2) - (\mu_1 - \mu_2)}{\sqrt{\dfrac{\sigma_1^2}{n_1} + \dfrac{\sigma_2^2}{n_2}}}$$

El valor *z* se compara con la distribución normal estándar para determinar, con cierta significancia, si la diferencia de medias es estadísticamente significativa. 

## Estimación de la diferencia entre dos medias
Ahora, a partir de una muestra de cada población con tamaños $n_1$ y $n_2$ respectivamente, calculamos las medias muestrales de cada muestra. En este caso, el estimador puntual es simplemente la diferencia entre las medias muestrales:
$$\hat{x}_1 - \hat{x}_2$$
lo cual es una aproximación del parámetro real
$$\Delta\mu = \mu_1 - \mu_2$$

> Es fundamental que estas muestras sean independientes (que una no influya a la otra)

## Intervalo para la diferencia de medias
Ahora buscamos un intervalo de confianza para la diferencia de medias poblacionales. Recordando la distribución muestral de la diferencia de medias: 

$$Z = \dfrac{(\bar{x}_1 - \bar{x}_2) - (\mu_1 - \mu_2)}{\sqrt{\dfrac{\sigma_1^2}{n_1} + \dfrac{\sigma_2^2}{n_2}}}$$

Despejamos la diferencia de medias poblacionales ($\Delta\mu$):

$$(\mu_1 - \mu_2) = (\bar{x}_1 - \bar{x}_2) - Z \cdot \sqrt{\dfrac{\sigma_1^2}{n_1} + \dfrac{\sigma_2^2}{n_2}}$$

Y llegamos a la forma del I.C de diferencia de medias. En el caso en el que se desconozca la varianza poblacional pero $n >= 30$, se puede usar la varianza muestral.

Cuando no conocemos la varianza y además $n < 30$, se puede usar la distribución *t* de Student para conseguir el factor de confiabilidad, siempre que asumamos una normalidad.

### Intervalo para la diferencia de medias homocedáticas (varianzas iguales)
No conocemos las varianzas poblacionales, pero asumimos que son iguales en ambas poblaciones. No tiene sentido estimarlas por separado, asumiendo que valen lo mismo. Entonces combinamos ambas varianzas muestrales en una sola estimación de la varianza total. De aquí surge la **varianza ponderada**:

$$S_p^2 = \dfrac{(n_1-1)S_1^2 + (n_2-1)S_2^2}{n_1+n_2-2}$$

Que es un promedio ponderado de las varianzas muestrales. Podemos denotar el error estándar de la diferencia como:

$$SE = S_p \sqrt{\dfrac{1}{n_1} + \dfrac{1}{n_2}}$$

Y podemos finalmente formar el I.C de medias homocedáticas

$$(\bar{x}_1 - \bar{x}\_2) \pm t\_{gl} \cdot S\_p\sqrt{\dfrac{1}{n\_1} + \dfrac{1}{n\_2}}$$

## Contrastes de diferencia entre medias poblacionales independientes
Y entramos al clímax de este tema, y herramienta básica para el resto de la materia; la prueba de hipótesis. 

Trataremos con tres tipos de prueba de hipótesis o contrastes de diferencia:

$$1.\begin{cases} H_0: \mu_x - \mu_y = d_0 \newline H_1: \mu_x - \mu_y \neq d_0 \end{cases}$$

$$2.\begin{cases} H_0: \mu_x - \mu_y \leq d_0 \newline H_1: \mu_x - \mu_y > d_0 \end{cases}$$

$$3.\begin{cases} H_0: \mu_x - \mu_y \geq d_0 \newline H_1: \mu_x - \mu_y < d_0 \end{cases}$$

Si bien el caso más común es el de probar si $d_0 = 0$, es posible probar si una población tiene una media mayor que otra bajo el mismo procedimiento.

También podemos obtener los siguientes contrastes usando el estadístico $Z_{exp}$:
$$Z_{exp} = \dfrac{(\bar{x} - \bar{y}) - d_0}{\sqrt{\dfrac{\sigma_x^2}{n_x} + \dfrac{\sigma_y^2}{n_y}}}$$

A continuación desarrollamos esto.

### Contraste de medias con varianzas conocidas
Queremos contrastar la hipótesis de que las medias de dos poblaciones son iguales, cuando las varianzas son conocidas y solo difieren en una cantidad $\Delta$. Entonces decimos que:

$$\begin{cases} H_0: \mu_x - \mu_y = \Delta \newline H_1: \mu_x - \mu_y \neq \Delta \end{cases}$$

$$H_0 \text{ cierta} \implies \begin{cases} \bar{X_1} \sim N(\mu_1, \dfrac{\sigma_1^2}{n_1}) \newline \bar{X_2} \sim N(\mu_2, \dfrac{\sigma_2^2}{n_2}) \end{cases}$$

$$\implies \bar{X_1} - \bar{X_2} \sim N(\Delta, \dfrac{\sigma_1^2}{n_1} + \dfrac{\sigma_2^2}{n_2})$$

$$\iff Z_{exp} = \dfrac{(\bar{x} - \bar{y}) - d_0}{\sqrt{\dfrac{\sigma_x^2}{n_x} + \dfrac{\sigma_y^2}{n_y}}} \sim N(0, 1)$$

> Aclaro que $$Z_{exp} \equiv \text {valor de prueba / experimental}$$ $$Z_{teo} \equiv \text {valor critico / teorico}$$

### Contraste bilateral (dos colas)

$$\begin{cases} H_0 : \mu_1 - \mu_2 = \Delta \newline H_1 : \mu_1 - \mu_2 \neq \Delta \end{cases} \qquad Z_{exp} = \dfrac{(\bar{X}_1 - \bar{X}_2) - \Delta}{\sqrt{\dfrac{\sigma_1^2}{n_1} + \dfrac{\sigma_2^2}{n_2}}}$$

$$Z_{teo} = z_{1-\alpha/2}$$

Se define entonces:

$$\textbf{Se acepta } H_0 \textbf{ si:} \quad -z_{\alpha/2} \leq z_{\exp} \leq z_{\alpha/2}$$

y el test consiste en:

$$\begin{cases} \text{si } |Z_{exp}| \leq Z_{teo} \implies \text{no rechazamos } H_0; \newline \text{si } |Z_{exp}| > Z_{teo} \implies \text{rechazamos } H_0 \text{ y aceptamos } H_1. \end{cases}$$

### Contraste unilateral (una cola)

Se utiliza en ambos casos el mismo estadístico utilizado para el contraste bilateral:

$$Z_{exp} = \dfrac{(\bar{X}_1 - \bar{X}_2) - \Delta}{\sqrt{\dfrac{\sigma_1^2}{n_1} + \dfrac{\sigma_2^2}{n_2}}}$$

$$Z_{teo} = z_{1-\alpha}$$

Para el test:

$$\begin{cases} H_0 : \mu_1 - \mu_2 = \Delta \newline H_1 : \mu_1 - \mu_2 < \Delta \end{cases} \qquad \left( \text{o bien} \begin{cases} H_0 : \mu_1 - \mu_2 \geq \Delta \newline H_1 : \mu_1 - \mu_2 < \Delta \end{cases} \right)$$

**Se acepta** $H_0$ **si:** $z_{\exp} > -z_\alpha$

$$Z_{teo} = z_\alpha = -z_{1-\alpha} \rightarrow \begin{cases} \text{si } Z_{exp} \geq Z_{teo} \implies \text{no rechazamos } H_0; \newline \text{si } Z_{exp} < Z_{teo} \implies \text{rechazamos } H_0 \text{ y aceptamos } H_1. \end{cases}$$

y para el contraste de significación contrario:

$$\begin{cases} H_0 : \mu_1 - \mu_2 = \Delta \newline H_1 : \mu_1 - \mu_2 > \Delta \end{cases} \qquad \left( \text{o bien} \begin{cases} H_0 : \mu_1 - \mu_2 \leq \Delta \newline H_1 : \mu_1 - \mu_2 > \Delta \end{cases} \right)$$

**Se acepta** $H_0$ **si:** $z_{\exp} \leq z_\alpha$

$$Z_{teo} = z_{1-\alpha} \rightarrow \begin{cases} \text{si } Z_{exp} \leq Z_{teo} \implies \text{no rechazamos } H_0; \newline \text{si } Z_{exp} > Z_{teo} \implies \text{rechazamos } H_0 \text{ y aceptamos } H_1. \end{cases}$$

## Contraste de medias homocedáticas (varianzas poblacionales desconocidas pero iguales)

Cuando no conocemos las varianzas poblacionales $\sigma_x^2$ y $\sigma_y^2$, pero asumimos que son iguales ($\sigma_x^2 = \sigma_y^2$), no podemos usar $Z_{exp}$ directamente porque no tenemos $\sigma$. En su lugar, estimamos una **varianza combinada (pooled)** a partir de ambas muestras, y usamos el estadístico $t$ en vez de $Z$.

### Varianza combinada

$$S_p^2 = \dfrac{(n_x-1)S_x^2 + (n_y-1)S_y^2}{n_x+n_y-2}$$

Es un promedio ponderado de las dos varianzas muestrales, usando como peso los grados de libertad de cada una.

### Contraste de medias con varianzas homocedáticas

Queremos contrastar la hipótesis de que las medias de dos poblaciones difieren en una cantidad $d_0$, cuando las varianzas son desconocidas pero iguales:

$$\begin{cases} H_0: \mu_x - \mu_y = d_0 \newline H_1: \mu_x - \mu_y \neq d_0 \end{cases}$$

$$H_0 \text{ cierta} \implies t_{exp} = \dfrac{(\bar{x} - \bar{y}) - d_0}{S_p\sqrt{\dfrac{1}{n_x} + \dfrac{1}{n_y}}} \sim t_{n_x+n_y-2}$$

> Aclaro que $$t_{exp} \equiv \text{valor de prueba / experimental}$$ $$t_{teo} \equiv \text{valor crítico / teórico, con } n_x+n_y-2 \text{ grados de libertad}$$

### Contraste bilateral (dos colas)

$$\begin{cases} H_0 : \mu_x - \mu_y = d_0 \newline H_1 : \mu_x - \mu_y \neq d_0 \end{cases} \qquad t_{exp} = \dfrac{(\bar{x} - \bar{y}) - d_0}{S_p\sqrt{\dfrac{1}{n_x} + \dfrac{1}{n_y}}}$$

$$t_{teo} = t_{1-\alpha/2,\ n_x+n_y-2}$$

Se define entonces:

$$\textbf{Se acepta } H_0 \textbf{ si:} \quad -t_{\alpha/2} \leq t_{\exp} \leq t_{\alpha/2}$$

y el test consiste en:

$$\begin{cases} \text{si } |t_{exp}| \leq t_{teo} \implies \text{no rechazamos } H_0; \newline \text{si } |t_{exp}| > t_{teo} \implies \text{rechazamos } H_0 \text{ y aceptamos } H_1. \end{cases}$$

### Contraste unilateral (una cola)

Se utiliza en ambos casos el mismo estadístico utilizado para el contraste bilateral:

$$t_{exp} = \dfrac{(\bar{x} - \bar{y}) - d_0}{S_p\sqrt{\dfrac{1}{n_x} + \dfrac{1}{n_y}}}$$

$$t_{teo} = t_{1-\alpha,\ n_x+n_y-2}$$

Para el test:

$$\begin{cases} H_0 : \mu_x - \mu_y = d_0 \newline H_1 : \mu_x - \mu_y < d_0 \end{cases} \qquad \left( \text{o bien} \begin{cases} H_0 : \mu_x - \mu_y \geq d_0 \newline H_1 : \mu_x - \mu_y < d_0 \end{cases} \right)$$

**Se acepta** $H_0$ **si:** $t_{\exp} > -t_\alpha$

$$t_{teo} = t_\alpha = -t_{1-\alpha} \rightarrow \begin{cases} \text{si } t_{exp} \geq t_{teo} \implies \text{no rechazamos } H_0; \newline \text{si } t_{exp} < t_{teo} \implies \text{rechazamos } H_0 \text{ y aceptamos } H_1. \end{cases}$$

y para el contraste de significación contrario:

$$\begin{cases} H_0 : \mu_x - \mu_y = d_0 \newline H_1 : \mu_x - \mu_y > d_0 \end{cases} \qquad \left( \text{o bien} \begin{cases} H_0 : \mu_x - \mu_y \leq d_0 \newline H_1 : \mu_x - \mu_y > d_0 \end{cases} \right)$$

**Se acepta** $H_0$ **si:** $t_{\exp} \leq t_\alpha$

$$t_{teo} = t_{1-\alpha,\ n_x+n_y-2} \rightarrow \begin{cases} \text{si } t_{exp} \leq t_{teo} \implies \text{no rechazamos } H_0; \newline \text{si } t_{exp} > t_{teo} \implies \text{rechazamos } H_0 \text{ y aceptamos } H_1. \end{cases}$$

# Diferencia de proporciones poblacionales

Pasamos ahora de variables cuantitativas (medias) a variables cualitativas dicotomicas: éxito/fracaso, sí/no, defectuoso/no defectuoso. En vez de comparar promedios, comparamos que **proporción** de cada población cumple cierta característica. La lógica de fondo es idéntica a la de medias: buscamos la distribución muestral del estimador, lo usamos para estimar por intervalos, y después para contrastar hipótesis.

> Ejemplo típico: *¿Es distinta la proporción de estudiantes que aprueban Matemática III entre la comisión de la mañana y la de la tarde?*

## Distribución muestral de diferencia de proporciones

Sean dos poblaciones con proporciones poblacionales $\phi_1$ y $\phi_2$ (la proporción de "éxitos" en cada una). Se toma una muestra aleatoria e independiente de tamaño $n_1$ de la primera población y $n_2$ de la segunda, y se calculan las proporciones muestrales $\hat{p}_1$ y $\hat{p}_2$.

Al igual que con una sola proporción, cada $\hat{p}_i$ se distribuye aproximadamente normal si el tamaño de muestra es lo suficientemente grande, es decir, si se cumple la condición de normalidad:

$$n_i \cdot \phi_i \geq 5 \quad \text{y} \quad n_i \cdot (1-\phi_i) \geq 5$$

para $i = 1, 2$. Bajo esa condición, la diferencia $\hat{p}_1 - \hat{p}_2$ también se distribuye aproximadamente normal, con:

$$E(\hat{p}_1 - \hat{p}_2) = \phi_1 - \phi_2$$

$$\text{Var}(\hat{p}_1 - \hat{p}_2) = \dfrac{\phi_1(1-\phi_1)}{n_1} + \dfrac{\phi_2(1-\phi_2)}{n_2}$$

Por lo tanto el error estándar de la diferencia de proporciones es:

$$SE = \sqrt{\dfrac{\phi_1(1-\phi_1)}{n_1} + \dfrac{\phi_2(1-\phi_2)}{n_2}}$$

Y el estadístico *Z* correspondiente:

$$Z = \dfrac{(\hat{p}_1 - \hat{p}_2) - (\phi_1 - \phi_2)}{\sqrt{\dfrac{\phi_1(1-\phi_1)}{n_1} + \dfrac{\phi_2(1-\phi_2)}{n_2}}} \sim N(0,1)$$

## Estimación de la diferencia de dos proporciones

El estimador puntual de la diferencia de proporciones poblacionales es, como era de esperar, la diferencia de proporciones muestrales:

$$\hat{p}_1 - \hat{p}_2$$

que estima al parámetro real $\Delta\phi = \phi_1 - \phi_2$.

Como en la práctica no conocemos $\phi_1$ ni $\phi_2$ (son justamente lo que queremos estimar), para construir el intervalo de confianza reemplazamos las proporciones poblacionales por las muestrales dentro del error estándar. Así llegamos al **intervalo de confianza para la diferencia de proporciones**:

$$(\hat{p}_1 - \hat{p}_2) \pm z_{1-\alpha/2} \cdot \sqrt{\dfrac{\hat{p}_1(1-\hat{p}_1)}{n_1} + \dfrac{\hat{p}_2(1-\hat{p}_2)}{n_2}}$$

Este intervalo es válido siempre que se cumpla la condición de normalidad mencionada arriba para ambas muestras.

## Contraste sobre la diferencia de proporciones poblacionales independientes

Al igual que con las medias, distinguimos el caso general (contrastar contra un $d_0$ cualquiera) del caso más común en la práctica ($d_0 = 0$, es decir, probar si las proporciones son iguales).

### Caso general ($d_0 \neq 0$)

$$\begin{cases} H_0: \phi_1 - \phi_2 = d_0 \newline H_1: \phi_1 - \phi_2 \neq d_0 \end{cases}$$

Cuando la diferencia hipotética no es cero, no tiene sentido combinar las proporciones en una sola estimación, ya que bajo $H_0$ las poblaciones **no** se asumen iguales, solo separadas por $d_0$. En ese caso se usa cada proporción muestral por separado dentro del error estándar:

$$Z_{exp} = \dfrac{(\hat{p}_1 - \hat{p}_2) - d_0}{\sqrt{\dfrac{\hat{p}_1(1-\hat{p}_1)}{n_1} + \dfrac{\hat{p}_2(1-\hat{p}_2)}{n_2}}}$$

### Caso particular más común ($d_0 = 0$): proporción combinada

$$\begin{cases} H_0: \phi_1 = \phi_2 \newline H_1: \phi_1 \neq \phi_2 \end{cases}$$

Aquí si asumimos, bajo $H_0$, que ambas poblaciones comparten la misma proporción $\phi$. Entonces conviene estimar esa proporción común combinando (pooling) ambas muestras en una sola, en vez de estimarlas por separado. Si $x_1$ y $x_2$ son la cantidad de "éxitos" observados en cada muestra, la **proporción combinada** es:

$$\hat{p} = \dfrac{x_1 + x_2}{n_1 + n_2}$$

Y el estadístico de prueba queda:

$$Z_{exp} = \dfrac{\hat{p}_1 - \hat{p}_2}{\sqrt{\hat{p}(1-\hat{p})\left(\dfrac{1}{n_1} + \dfrac{1}{n_2}\right)}} \sim N(0,1)$$

### Contraste bilateral (dos colas)

$$Z_{teo} = z_{1-\alpha/2}$$

$$\textbf{Se acepta } H_0 \textbf{ si:} \quad -z_{\alpha/2} \leq z_{\exp} \leq z_{\alpha/2}$$

$$\begin{cases} \text{si } |Z_{exp}| \leq Z_{teo} \implies \text{no rechazamos } H_0; \newline \text{si } |Z_{exp}| > Z_{teo} \implies \text{rechazamos } H_0 \text{ y aceptamos } H_1. \end{cases}$$

### Contraste unilateral (una cola)

Se usa el mismo estadístico $Z_{exp}$ (con proporción combinada si $d_0=0$, o por separado si $d_0 \neq 0$).

$$\begin{cases} H_0 : \phi_1 - \phi_2 = d_0 \newline H_1 : \phi_1 - \phi_2 < d_0 \end{cases} \qquad \left( \text{o bien} \begin{cases} H_0 : \phi_1 - \phi_2 \geq d_0 \newline H_1 : \phi_1 - \phi_2 < d_0 \end{cases} \right)$$

$$Z_{teo} = z_\alpha = -z_{1-\alpha}$$

**Se acepta** $H_0$ **si:** $z_{\exp} > -z_\alpha$

$$\begin{cases} \text{si } Z_{exp} \geq Z_{teo} \implies \text{no rechazamos } H_0; \newline \text{si } Z_{exp} < Z_{teo} \implies \text{rechazamos } H_0 \text{ y aceptamos } H_1. \end{cases}$$

y para el contraste de significación contrario:

$$\begin{cases} H_0 : \phi_1 - \phi_2 = d_0 \newline H_1 : \phi_1 - \phi_2 > d_0 \end{cases} \qquad \left( \text{o bien} \begin{cases} H_0 : \phi_1 - \phi_2 \leq d_0 \newline H_1 : \phi_1 - \phi_2 > d_0 \end{cases} \right)$$

$$Z_{teo} = z_{1-\alpha}$$

**Se acepta** $H_0$ **si:** $z_{\exp} \leq z_\alpha$

$$\begin{cases} \text{si } Z_{exp} \leq Z_{teo} \implies \text{no rechazamos } H_0; \newline \text{si } Z_{exp} > Z_{teo} \implies \text{rechazamos } H_0 \text{ y aceptamos } H_1. \end{cases}$$

---

# Unas ultimas preguntas a resolver
Estas son preguntas integradoras con la finalidad de dejar en claro lo clave de este capítulo.

{{<qa q="Si quiero comparar las poblaciones ¿qué parámetros puedo utilizar y cuáles son sus correspondientes estimadores?" >}}
Vimos que para comparar poblaciones, nosotros estimamos con base a información de la muestra; nuestros estimadores. En este capítulo vimos estimadores puntuales e intervalos de confianza, pero en este caso mencionaremos los puntuales directos. Para la diferencia de medias usamos $\Delta \bar{x}$ y para la diferencia de proporciones usamos $\Delta \bar{p}$.
{{< /qa >}}

{{<qa q="¿Cómo debe ser el muestreo, cuál es el principal y cuáles otros se menciona ?" >}}
El muestreo debe ser probabilístico, de carácter aleatorio; esto para asegurar que la muestra sea significante respecto a la población. El principal y más común es le muestreo simple, en el que cada elemento de la población tiene la misma probabilidad de ser escogido en la muestra. Si bien no mencionamos los otros (mala mía), tenemos por ejemplo el muestreo estratificado, en el que se divide la población en subgrupos y se escogen elementos de cada subgrupo con una probabilidad diferente. El muestreo por conglomerados, en el que se agrupan elementos de la población y se escogen conglomerados enteros. Y por último el muestreo sistemático, en el que se escogen elementos de la población de manera sistemática mediante una secuencia regular.
{{< /qa >}}

{{<qa q="¿Qué debemos estudiar de los estimadores y cuáles son los pasos obligados de la estadística inferencial?" >}}
En primer lugar buscamos que el estimador se asemeje al parámetro poblacional, ese es su principal propósito. Buscamos que a medida que $n \to \infty$, los estimadores converjan a los valores poblacionales. Por lo que a mayor muestra, estos teóricamente deberían asemejarse más al comportamiento poblacional. Buscamos que este aproveche la mayor información posible de la muestra, es decir, que la muestra sea lo más representativa posible de la población.

La aplicación de la estadística inferencial pasa por tres etapas:
1. Entender como se comporta el estadístico
2. Estimar los parámetros
3. Realizar un contraste de prueba de hipótesis
{{< /qa >}}

{{<qa q="Presentar simbólicamente las distribuciones en el muestreo de los estimadores diferencia de las medias (muestra chicas y desvío desconocido ) y el de diferencia de proporciones poblacionales ." >}}
**1. Diferencia de medias (muestras pequeñas y desvíos poblacionales desconocidos pero asumiendo homocedasticidad $\sigma\_1^2 = \sigma\_2^2$):**

Si las poblaciones son normales y se asume homocedasticidad, el estadístico pívot se distribuye según una *t* de Student con $n\_1 + n\_2 - 2$ grados de libertad:

$$T = \dfrac{(\bar{X}\_1 - \bar{X}\_2) - (\mu\_1 - \mu\_2)}{S\_p \sqrt{\dfrac{1}{n\_1} + \dfrac{1}{n\_2}}} \sim t\_{n\_1 + n\_2 - 2}$$

donde $S\_p^2 = \dfrac{(n\_1-1)S\_1^2 + (n\_2-1)S\_2^2}{n\_1+n\_2-2}$ es la varianza combinada.

---

**2. Diferencia de proporciones poblacionales:**

Si se cumplen las condiciones de normalidad ($n\_i \phi\_i \geq 5$ y $n\_i (1-\phi\_i) \geq 5$ para $i=1,2$), la diferencia de proporciones muestrales se distribuye aproximadamente Normal:

$$(\hat{P}\_1 - \hat{P}\_2) \sim N\left(\phi\_1 - \phi\_2, \, \dfrac{\phi\_1(1-\phi\_1)}{n\_1} + \dfrac{\phi\_2(1-\phi\_2)}{n\_2}\right)$$

y su estandarización es:

$$Z = \dfrac{(\hat{P}\_1 - \hat{P}\_2) - (\phi\_1 - \phi\_2)}{\sqrt{\dfrac{\phi\_1(1-\phi\_1)}{n\_1} + \dfrac{\phi\_2(1-\phi\_2)}{n\_2}}} \sim N(0,1)$$
{{< /qa >}}

{{<qa q="Presentar las fórmulas más relevantes del capítulo (errores estándar , intervalos de confianza y estadísticos de prueba)." >}}
### 1. Errores Estándar ($SE$)

* **Diferencia de medias ($\sigma$ conocida):**

  $$SE = \sqrt{\dfrac{\sigma\_1^2}{n\_1} + \dfrac{\sigma\_2^2}{n\_2}}$$

* **Diferencia de medias homocedácticas ($\sigma$ desconocida, $\sigma\_1 = \sigma\_2$):**

  $$SE = S\_p \sqrt{\dfrac{1}{n\_1} + \dfrac{1}{n\_2}} \quad \text{con } S\_p = \sqrt{\dfrac{(n\_1-1)S\_1^2 + (n\_2-1)S\_2^2}{n\_1+n\_2-2}}$$

* **Diferencia de proporciones (estimación / contraste general $d\_0 \neq 0$):**

  $$SE = \sqrt{\dfrac{\hat{p}\_1(1-\hat{p}\_1)}{n\_1} + \dfrac{\hat{p}\_2(1-\hat{p}\_2)}{n\_2}}$$

* **Diferencia de proporciones (contraste con $H\_0: \phi\_1 = \phi\_2$):**

  $$SE = \sqrt{\hat{p}(1-\hat{p})\left(\dfrac{1}{n\_1} + \dfrac{1}{n\_2}\right)} \quad \text{con } \hat{p} = \dfrac{x\_1 + x\_2}{n\_1 + n\_2}$$

---

### 2. Intervalos de Confianza (I.C.)

* **Diferencia de medias ($\sigma$ conocida o $n \geq 30$):**

  $$(\bar{x}\_1 - \bar{x}\_2) \pm z\_{1-\alpha/2} \cdot \sqrt{\dfrac{\sigma\_1^2}{n\_1} + \dfrac{\sigma\_2^2}{n\_2}}$$

* **Diferencia de medias homocedácticas ($\sigma$ desconocida, $n < 30$):**

  $$(\bar{x}\_1 - \bar{x}\_2) \pm t\_{1-\alpha/2, \, n\_1+n\_2-2} \cdot S\_p \sqrt{\dfrac{1}{n\_1} + \dfrac{1}{n\_2}}$$

* **Diferencia de proporciones:**

  $$(\hat{p}\_1 - \hat{p}\_2) \pm z\_{1-\alpha/2} \cdot \sqrt{\dfrac{\hat{p}\_1(1-\hat{p}\_1)}{n\_1} + \dfrac{\hat{p}\_2(1-\hat{p}\_2)}{n\_2}}$$

---

### 3. Estadísticos de Prueba (de Contraste / Experimentales)

* **Diferencia de medias ($\sigma$ conocida):**

  $$Z\_{exp} = \dfrac{(\bar{x}\_1 - \bar{x}\_2) - d\_0}{\sqrt{\dfrac{\sigma\_1^2}{n\_1} + \dfrac{\sigma\_2^2}{n\_2}}}$$

* **Diferencia de medias homocedácticas ($\sigma$ desconocida):**

  $$t\_{exp} = \dfrac{(\bar{x}\_1 - \bar{x}\_2) - d\_0}{S\_p \sqrt{\dfrac{1}{n\_1} + \dfrac{1}{n\_2}}}$$

* **Diferencia de proporciones (para probar $H\_0: \phi\_1 = \phi\_2$):**

  $$Z\_{exp} = \dfrac{\hat{p}\_1 - \hat{p}\_2}{\sqrt{\hat{p}(1-\hat{p})\left(\dfrac{1}{n\_1} + \dfrac{1}{n\_2}\right)}}$$
{{< /qa >}}
