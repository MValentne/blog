+++
date = '2026-07-08T21:06:31-03:00'
draft = false
title = 'Sobre La Creación De Sitios Con Hugo'
author = 'Valentino Mendé'
tags = ["explicativo", "prueba", "hugo"]
categories = ["Blog"]
+++

La cuestión es la siguiente, hoy en día no queremos usar html y css crudo, cuando podemos usar una capa de abstracción[^1] como Hugo. Esta capa de abstracción nos permite trabajar en un blog como este, sin un conocimiento denso y tedioso en el manejo de lenguajes de etiqueta o escritura innecesaria de boilerplate. Por lo que es el equivalente a usar unos pocos comandos y manejarse con markdown, algo simple de entender también. 

Si bien es nutritivo estudiar html y css, para el caso particular en el que queramos hacer un blog con una facilidad de ingreso y colaboración, es más fácil dejarlo de lado e ir directo al grano con una herramienta que solucione.

Primero, es relevante hablar de forma concreta sobre qué es Hugo y cómo funciona. Hugo es un framework [^2] centrado en generación de sitios estáticos. Un sitio estático es aquel que no cambiará de usuario en usuario, dígase, no hay una interacción personalizada para cada usuario, por lo que suelen ser sitios simples y ligeros en comparación de los dinámicos, donde tenemos que emplear cuestiones como backend, bases de datos, lógica integrada con algún lenguaje de programación, etc.

> Cabe aclarar que html y css no son lenguajes de programación per-se, sino que son lenguajes de marcado y estilización respectivamente.

Hugo funciona principalmente mediante el manejo de themes, un theme se construye con base a templates, que a su vez son bloques de código html. Entonces, un desarrollador de themes está usando una abstracción de html y css en bloques, y con esos bloques crea un theme, que es una plantilla para hacer sitios web.

Puedes trabajar en diversas aplicaciones con un framework como Hugo, tales como:
- Blogs
- Portafolios artísticos
- Landing pages 
- Proyectos individuales estáticos
- Curriculums
- etc.

Y esas aplicaciones tienden a tener temas hechos por la comunidad de hugo, por lo que ya hay un punto de partida. Véase [Hugo Themes](https://themes.gohugo.io/). 

## Uso general de markdown

También hablando un poco sobre las capacidades generales de Hugo y markdown, hay algunos usos interesantes, como la inclusión de código:

```c
#include <stdio.h>

int main(){
    printf("Hello, world!");
    return 0;
}
```
Diferentes headings:

# H1
## H2
### H3
#### H4

Texto **en negritas** o en *cursiva*.

Listas ordenadas:
1. un ítem
2. otro ítem
3. otro ítem más

y desordenadas:
- un ítem
- otro ítem
- otro ítem más

Una línea horizontal para dividir el contenido:

---

Y demás cosas que son redundantes, cosas que vienen a la cabeza cuando uno está escribiendo un post y de repente necesita algún elemento, el cual posiblemente vaya a encontrar en una cheatsheet como [esta de aquí](https://www.markdownguide.org/cheat-sheet/).

## Publicación en el blog

Por último, una pequeña explicación del workflow para hacer un post en este blog: De base debemos tener algunos elementos instalados. 
- git
- github (web, háganse cuenta y vinculen con git)
- hugo ssg (CLI)
- alguna consola que use bash (más adelante el porqué de bash)

Para crear un post, primero tenemos que visualizar un poco la estructura de carpetas. Nuestros posts se van a crear dentro de la carpeta **content**, preferiblemente que haya una carpeta por cada persona, así es más fácil que cada quien pueda ordenar y mantener sus propias publicaciones (al tiempo de publicación de este post, ya debería haber una carpeta con mi nombre). La carpeta **public** contiene toda la página generada con el markdown que nosotros escribimos más toda la configuración de fondo (en gran parte el theme). En la carpeta **themes** incluimos la plantilla que usamos para este proyecto, hugo-theme-nostyleplease, que es un theme centrado en un estilo minimalista; estuve metiendo un poco de mano en el código (un poco mala práctica) para que el theme tenga el comportamiento adecuado para el funcionamiento del blog. 

Para hacer un post nosotros usamos un comando de hugo en la terminal; nos paramos en el directorio raíz [^3] y ejecutamos lo siguiente:

```bash
  hugo new content/autor/"titulo de la publicacion".md
```

Lo cual va a crear un nuevo archivo en la carpeta **content**, que es el markdown en el cual estaremos escribiendo todo el contenido a publicar. Este contenido al inicio tiene un poco de metadata, que se va a tener que completar con base a las necesidades del post.

Aquí entra el concepto de **taxonomía**, que es la forma en la que organizamos los posts en el blog. En este caso, organizamos los posts por categoría, por lo que cada categoría tiene su propia colección de publicaciones adjuntadas, por eso es relevante intentar mantener pequeño el número de categorías por post, reduciéndolo a solo lo más significativo posible. 

Una vez que escribimos el post en formato markdown (que tarde o temprano utilizaremos de forma natural), queremos ver cómo se ven los cambios aplicados al blog; en este caso tenemos un comando de hugo que nos da una previsualización en localhost de la computadora para saber cómo se visualizará y cazar errores en nuestros posts:

```bash
  hugo server -D
```

Donde el -D significa *draft*, por lo que estaremos visualizando los bosquejos que tengamos trabajados en el proyecto, entre ellos, nuestro post (que en el metadata tiene algo como draft = true, que a la hora de publicar seriamente pasaremos a false). 

abrimos localhost:1313/ y nos debería visualizar el blog con nuestro post aplicado. Una vez que todo está en lugar, podemos pasar a hacer deploy en el blog y subir los cambios a github para que todos tengan una versión actualizada del proyecto. Aquí entra en juego el manejo de git, véase este video como una referencia rápida de qué es git: 

{{< youtube mJ-qvsxPHpY >}}

Básicamente queremos subir los cambios a main, por lo que de forma muy simple (que vamos a cambiar después) hacemos:

```bash
  git pull
  git add .
  git commit -m "mensaje de commit"
  git push
```

Donde *git pull* es la acción fundamental para mantener nuestra versión local del repositorio actualizada respecto a los cambios que haga el resto. Luego, *git add .* agrega todos los cambios al staging área, *git commit -m "mensaje de commit"* crea un nuevo commit con el mensaje especificado, y *git push* sube los cambios al repositorio remoto.

Esto es muy simple y quizá cambie dentro de muy poco debido a un workflow particular con github que tendremos que usar para evitar conflictos entre usuarios del blog, pero la escencia es la misma. 

Y por último tenemos que hacer deploy a la página web (en este caso github pages), donde ya trabaje en un comando de bash (cosa que van a ejecutar en consola). Vayan a la raíz del proyecto y ejecuten el siguiente comando:

```bash
  ./deploy.sh
```

Lo cual ejecuta una serie de comandos que son redundantes para el alcance de esta explicación, por lo que ha de abstraerse y usarse tal y como está hecho. 

## Felicidades

Y Ta-dah, a este punto ya habrán creado su primera publicación en el blog, lo cual es algo bastante lindo. Es un lindo proyecto y se puede aprender bastante, ya que en cada post podemos usar libertad artística completa en temas y estructura de lo que querramos decir. La idea de el blog es que quede como un registro perpetuo de lo que vayamos publicando, y podamos volver a esto en un futuro y ver que babosadas decíamos y pensábamos en su momento. Sin más que eso, diviértanse publicando y sugiriendo mejoras para el proyecto.

![computadora-y-ordenador-imagen-animada-0178](https://www.gifsanimados.org/data/media/56/computadora-y-ordenador-imagen-animada-0178.gif)


[^1]: La abstracción consiste en formar un modelo mental en el que solo tomamos en cuenta factores relevantes para el problema que queremos solucionar. En este caso, Hugo abstrae la necesidad de trabajar con html y css, ya que solo metemos mano en markdown y damos por sentado que se va a generar un frontend automáticamente.

[^2]: Un framework es una colección de herramientas que nos facilitan el trabajo, centrado en programación, por lo que nosotros no tenemos que reinventar la rueda cada vez que queramos trabajar en un proyecto, al contrario, nosotros nos amoldamos a un marco ya hecho (y por gente mucho más inteligente que nosotros) y abstraemos gran parte de los procedimientos y código que deberíamos hacer manualmente, reemplazándolo con herramientas que nos provee el framework.

[^3]: El directorio raíz es la carpeta principal del proyecto, donde podemos ver directamente archetypes, assets, content, etc.
