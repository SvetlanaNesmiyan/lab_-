--task1
SELECT region, SUM(population) AS total_population
FROM cities
GROUP BY region;

--task2
SELECT region, SUM(population) AS total_population, COUNT(*) AS city_count
FROM cities
GROUP BY region
HAVING city_count >= 10;

--task3
WITH RegionFilter AS (
    SELECT region
    FROM cities
    GROUP BY region
    HAVING COUNT(*) >= 5
),
RankedCities AS (
    SELECT name, population, ROW_NUMBER() OVER (ORDER BY population DESC) AS row_num
    FROM cities
    WHERE region IN (SELECT region FROM RegionFilter)
)
SELECT name, population
FROM RankedCities
WHERE row_num BETWEEN 11 AND 15;

--task4
SELECT region, SUM(population) AS total_population
FROM cities
WHERE population > 300000
GROUP BY region;

--task5
SELECT name, population
FROM cities
WHERE region IN (
    SELECT region
    FROM cities
    GROUP BY region
    HAVING COUNT(DISTINCT name) <= 5
)
AND (population < 150000 OR population > 500000);