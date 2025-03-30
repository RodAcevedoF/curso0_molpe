-- ################
-- ## EJERCICIOS ##
-- ################

-- Lista los tipos almacenados en la tabla elements.
SELECT * FROM elements;

-- Muestra todos los Pokémon con su nombre y su ID en la Pokédex.
SELECT p.name, ca.pokemon_id 
FROM pokemons p
JOIN captures ca ON p.id = ca.pokemon_id
JOIN pokedex po ON po.id = ca.pokedex_id;

-- Muestra el total de Pokémon capturados.
SELECT COUNT(*) AS total_captured FROM captures;

-- Muestra los nombres de los Pokémon en orden alfabético.
SELECT name FROM pokemons 
ORDER BY name;

-- Encuentra todos los Pokémon que sean del tipo agua.
SELECT p.id, p.name, e.name 
FROM pokemons p
JOIN pokemons_elements pe ON p.id = pe.pokemon_id
JOIN elements e ON pe.element_id = e.id
WHERE e.name = 'water';

-- Selecciona todos los Pokémon cuyo nombre empieza con la letra "B".
SELECT p.id, p.name 
FROM pokemons p
WHERE p.name LIKE 'B%';

-- Lista todos los Pokémon que tengan "Normal" como uno de sus tipos.
SELECT p.id, p.name, e.name 
FROM pokemons p
JOIN pokemons_elements pe ON p.id = pe.pokemon_id
JOIN elements e ON pe.element_id = e.id
WHERE e.name = 'normal';

-- Muestra los Pokémon que tengan menos de dos tipos asignados.
SELECT p.id, p.name 
FROM pokemons p
JOIN pokemons_elements pe ON p.id = pe.pokemon_id
GROUP BY p.id, p.name
HAVING COUNT(p.id) < 2;

-- Selecciona los Pokémon cuyo nombre contiene la letra "u".
SELECT p.id, p.name 
FROM pokemons p
WHERE p.name LIKE '%u%';

-- Encuentra todos los Pokémon capturados que sean de tipo eléctrico.
SELECT p.id, p.name 
FROM pokemons p
JOIN captures ca ON p.id = ca.pokemon_id
JOIN pokemons_elements pe ON p.id = pe.pokemon_id
JOIN elements e ON e.id = pe.element_id
WHERE e.name = 'electric';

-- Encuentra todos los Pokémon que tengan exactamente dos tipos.
SELECT p.id, p.name 
FROM pokemons p
JOIN pokemons_elements pe ON p.id = pe.pokemon_id
GROUP BY p.id, p.name
HAVING COUNT(p.id) = 2;

-- Muestra todos los Pokémon registrados en la Pokédex.
SELECT p.id, p.name, po.id AS pokedex_id
FROM pokemons p
JOIN captures c ON p.id = c.pokemon_id
JOIN pokedex po ON po.id = c.pokedex_id;

-- Encuentra el primer Pokémon registrado en la Pokédex.
SELECT p.id, p.name, c.captured_at 
FROM pokemons p
JOIN captures c ON p.id = c.pokemon_id
ORDER BY c.captured_at
LIMIT 1;

SELECT p.id, p.name, c.captured_at 
FROM pokemons p
JOIN captures c ON p.id = c.pokemon_ID
where c.CAPTURED_AT = (SELECT MIN(captured_at) FROM captures);

-- Muestra la cantidad de Pokémon que tiene un usuario en su Pokédex.
SELECT u.id, u.name, COUNT(c.pokemon_id) AS total_pokemons 
FROM users u
JOIN pokedex po ON u.id = po.user_id
JOIN captures c ON po.id = c.pokedex_id
GROUP BY u.id, u.name;

-- Muestra los Pokémon que sean tipo bicho o veneno.
SELECT p.id, p.name, e.name 
FROM pokemons p
JOIN pokemons_elements pe ON p.id = pe.pokemon_id
JOIN elements e ON pe.element_id = e.id
WHERE e.name IN ('bug', 'poison');

-- Selecciona todos los nombres de Pokémon que tengan más de cinco letras.
SELECT p.id, p.name 
FROM pokemons p
WHERE LENGTH(p.name) > 5;

-- Encuentra todos los Pokémon que son de tipo fuego y volador.
SELECT p.id, p.name, e.name 
FROM pokemons p
JOIN pokemons_elements pe ON p.id = pe.pokemon_id
JOIN elements e ON pe.element_id = e.id
WHERE e.name IN ('fire', 'flying');

-- Selecciona los cinco tipos más comunes en la base de datos.
SELECT e.id, e.name, COUNT(p.id) AS total 
FROM elements e
JOIN pokemons_elements pe ON e.id = pe.element_id
JOIN pokemons p ON pe.pokemon_id = p.id
GROUP BY e.id, e.name
ORDER BY total DESC
LIMIT 5;

-- Selecciona los tipos que no están asociados con ningún Pokémon.
SELECT e.id, e.name 
FROM elements e
LEFT JOIN pokemons_elements pe ON e.id = pe.element_id
GROUP BY e.id, e.name
HAVING COUNT(pe.pokemon_id) < 1;

-- Muestra el nombre de cada Pokémon junto con la cantidad de tipos que tiene.
SELECT p.name, COUNT(pe.pokemon_id) AS type_total 
FROM pokemons p
JOIN pokemons_elements pe ON p.id = pe.pokemon_id
GROUP BY p.name;

-- Muestra los nombres de todos los Pokémon y todos los tipos asociados a cada uno.
SELECT p.id, p.name, GROUP_CONCAT(e.name SEPARATOR ', ') AS types 
FROM pokemons p 
JOIN pokemons_elements pe ON p.id = pe.pokemon_id
JOIN elements e ON pe.element_id = e.id
GROUP BY p.id, p.name;

SELECT p.id, p.name, e.name FROM pokemons p 
JOIN pokemons_elements pe ON p.id = pe.POKEMON_ID
JOIN elements e ON pe.ELEMENT_ID = e.id
GROUP BY p.id, p.name, e.name;

-- Lista los Pokémon en la Pokédex agrupados por tipo.
SELECT e.name, GROUP_CONCAT(p.name SEPARATOR ', ') AS pokemons 
FROM elements e 
JOIN pokemons_elements pe ON e.id = pe.element_id
JOIN pokemons p ON pe.pokemon_id = p.id
JOIN captures c ON p.id = c.pokemon_id
GROUP BY e.name;

SELECT e.name, p.name 
FROM ELEMENTS e
JOIN POKEMONS_ELEMENTS PE ON e.id = pe.ELEMENT_ID
JOIN pokemons p ON pe.POKEMON_ID  = p.id
JOIN captures c ON p.id = c.POKEMON_ID
GROUP BY e.name, p.name;

-- Encuentra todos los tipos que tienen exactamente tres Pokémon asociados.
SELECT e.id, e.name 
FROM elements e
JOIN pokemons_elements pe ON e.id = pe.element_id
GROUP BY e.id, e.name
HAVING COUNT(pe.pokemon_id) = 3;

-- Muestra todos los tipos y el número total de Pokémon que pertenecen a cada uno.
SELECT e.name, COUNT(pe.pokemon_id) AS total 
FROM elements e
JOIN pokemons_elements pe ON e.id = pe.element_id
GROUP BY e.name
ORDER BY total DESC;

-- Encuentra el tipo que tiene más Pokémon asociados.
SELECT e.name, COUNT(pe.pokemon_id) AS total 
FROM elements e
JOIN pokemons_elements pe ON e.id = pe.element_id
GROUP BY e.name
HAVING total = (
    SELECT MAX(total_count) 
    FROM (
        SELECT COUNT(pe1.pokemon_id) AS total_count
        FROM pokemons_elements pe1
        JOIN elements e1 ON pe1.element_id = e1.id
        GROUP BY e1.name
    ) AS subquery
);


SELECT e.name, COUNT(pe.pokemon_id) total 
FROM elements e
JOIN pokemons_elements pe ON e.id = pe.ELEMENT_ID
GROUP BY e.name
ORDER BY total DESC
LIMIT 1;