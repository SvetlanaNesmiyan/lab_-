SELECT name, population 
FROM cities 
WHERE population >= 1000000;

SELECT id, name, population, region
FROM cities 
WHERE region IN ('E', 'W') 
ORDER BY population DESC;

SELECT id, name, population, region 
FROM cities 
WHERE population > 50000 
  AND region IN ('S', 'C', 'N')
ORDER BY population DESC;

SELECT id, name, population, region 
FROM cities 
WHERE population > 150000 
  AND population <= 350000 
  AND region IN ('E', 'W', 'N')
ORDER BY name 
LIMIT 20;

SELECT id, name, population, region 
FROM cities 
WHERE region NOT IN ('E', 'W') 
ORDER BY population DESC 
LIMIT 10 OFFSET 10;
