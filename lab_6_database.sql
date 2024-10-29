--task1
SELECT cities.name AS city_name, regions.name AS region_name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE cities.population > 350000;

--task2
SELECT cities.name AS city_name
FROM cities
JOIN regions ON cities.region = regions.uuid
WHERE regions.name = 'Nord';