--task 1
SELECT id, name 
FROM cities 
WHERE name LIKE '%ськ';

--task 2
SELECT id, name 
FROM cities 
WHERE name LIKE '%донец%';

--task 3
SELECT CONCAT(name, ' (', region, ')') AS city_region
FROM cities
WHERE population > 100000
ORDER BY name ASC;

--task 4
SELECT name,population, ROUND((population / 40000000) * 100, 2) AS population_percentage
FROM cities
ORDER BY population DESC
LIMIT 10;

--task 5
SELECT CONCAT(name, ' - ', ROUND((population / 40000000) * 100, 2), '%') AS city_population_percentage
FROM cities
WHERE population >= 40000  
ORDER BY ROUND((population / 40000000) * 100, 2) ASC;