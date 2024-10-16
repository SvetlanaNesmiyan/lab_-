--task1
SELECT UPPER(name)
FROM cities
ORDER BY name
LIMIT 5 OFFSET 5;

--task2
SELECT name, LENGTH(name) AS name_length
FROM cities
WHERE LENGTH(name) NOT IN (8, 9, 10);

--task3
SELECT region, SUM(population) AS total_population
FROM cities
WHERE region IN ('C', 'S')
GROUP BY region;

--task4
SELECT AVG(population) AS average_population
FROM cities
WHERE region = 'W';

--task5
SELECT COUNT(*) AS city_count
FROM cities
WHERE region = 'E';