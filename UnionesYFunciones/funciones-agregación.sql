                            /* Micro desafío 1 */
/* 1 Utilizando la base de datos de películas queremos conocer, por un lado, los títulos y el
nombre del género de todas las series de la base de datos. */
SELECT title, name
FROM series
INNER JOIN genres ON genres.id = series.genre_id

/* 1.2 Por otro, necesitamos listar los
títulos de los episodios junto con el nombre y apellido de los actores que trabajan en cada
uno de ellos. */
SELECT e.title AS "Título", a.first_name AS "Nombre", a.last_name AS "Apellido"
FROM episodes AS e
INNER JOIN actor_episode AS ae ON ae.episode_id = e.id
INNER JOIN actors AS a ON a.id = ae.actor_id
GROUP BY e.title

                            /* Micro desafío 2 */
/* Para nuestro próximo desafío necesitamos obtener a todos los actores o actrices (mostrar
nombre y apellido) que han trabajado en cualquier película de la saga de la Guerra de las
galaxias, pero ¡cuidado!: debemos asegurarnos de que solo se muestre una sola vez cada
actor/actriz. */
SELECT DISTINCT first_name AS "Nombre", last_name AS "Apellido"
FROM actors AS a
INNER JOIN actor_movie AS am ON a.id = am.actor_id
INNER JOIN movies AS m ON m.id = am.movie_id
WHERE UPPER(m.title) LIKE UPPER("%guerra%galaxias%")

                            /* Micro desafío 3 */
/* Debemos listar los títulos de cada película con su género correspondiente. En el caso de
que no tenga género, mostraremos una leyenda que diga "no tiene género". Como ayuda
podemos usar la función COALESCE() que retorna el primer valor no nulo de una lista. */
SELECT title, COALESCE(name, "No tiene Género")
FROM movies AS m
LEFT JOIN genres AS g ON m.genre_id = g.id

                            /* Micro desafío 4 */
/* Necesitamos mostrar, de cada serie, la cantidad de días desde su estreno hasta su fin, con
la particularidad de que a la columna que mostrará dicha cantidad la renombraremos:
“Duración”. */
SELECT title AS "Título", DATEDIFF(end_date, release_date) AS "Duración"
FROM series AS s

                            /* Micro desafío 5 */
/* Listar los actores ordenados alfabéticamente cuyo nombre sea mayor a 6 caracteres. */
SELECT *
FROM actors
WHERE LENGTH(first_name) > 6
ORDER BY first_name
--
/* Debemos mostrar la cantidad total de los episodios guardados en la base de datos. */
SELECT COUNT(*) AS "Cantidad de episodios guardados"
FROM episodes
--
/* Para el siguiente desafío nos piden que obtengamos el título de todas las series y el total de temporadas que tiene cada una de ellas. */
SELECT s.title AS "Título", COUNT(se.id) AS "Temporadas"
FROM series AS s
INNER JOIN seasons AS se ON se.serie_id = s.id
GROUP BY s.title
--
/* Mostrar, por cada género, la cantidad total de películas que posee, siempre que sea mayor o igual a 3. */
SELECT name AS "Género", COUNT(title) AS Cantidad_De_Peliculas
FROM genres
INNER JOIN movies ON genres.id = movies.genre_id
GROUP BY name
HAVING Cantidad_De_Peliculas >= 3


















-- con AS le podemos poner un alias para abreviarlo y utilizarlo mas adelante
SELECT title AS "Título", name AS "Género"
FROM series AS s
INNER JOIN genres AS g ON g.id = s.genre_id


/* ejemplo inner + 3
SELECT series.title, name, rating, episodes.title
FROM series
INNER JOIN genres ON genres.id = series.genre_id
INNER JOIN seasons ON seasons.serie_id = series.id
INNER JOIN episodes ON episodes.season_id = seasons.id 

Un carácter comodín se utiliza para sustituir cualquier otro carácter en una cadena. Los caracteres comodín se utilizan con el operador SQL LIKE. El operador LIKE se utiliza en una cláusula WHERE para buscar un patrón específico en una columna. Hay dos comodines utilizados junto con el operador LIKE:

"%": El signo de porcentaje representa cero, uno o varios caracteres
"_"  El subrayado representa un solo carácter
*/