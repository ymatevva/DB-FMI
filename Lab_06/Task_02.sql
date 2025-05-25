
SET SCHEMA DB2SHIPS;

--1. Напишете заявка, която извежда броя на класовете кораби
SELECT COUNT( CLASS) AS CNT_CLASSES
FROM CLASSES;

--2. Напишете заявка, която извежда средния брой на оръжия, според класа на кораба

SELECT CLASS, AVG(NUMGUNS) AS AVG_NUMGUNS_BY_CLASS
FROM CLASSES
GROUP BY CLASS;

--3. Напишете заявка, която извежда средния брой на оръжия за всички кораби

SELECT  AVG(NUMGUNS) AS AVG_NUMGUNS_BY_CLASS
FROM CLASSES;

--4. Напишете заявка, която извежда за всеки клас първата и последната година, в която кораб от съответния клас е пуснат на вода

SELECT cl.CLASS, MIN(sh.LAUNCHED) AS FIRST_LAUNCHED, MAX(sh.LAUNCHED) AS LAST_LAUNCHED FROM
CLASSES cl, SHIPS sh
WHERE cl.CLASS = sh.CLASS
GROUP BY cl.CLASS;

--5. Напишете заявка, която извежда броя на корабите потънали в битка според класа

SELECT SH.CLASS, COUNT(*) AS CNT_SHIPS_SUNKED_BY_CLASS
FROM SHIPS sh, OUTCOMES ou
WHERE sh.NAME = ou.SHIP
AND ou.RESULT = 'sunk'
GROUP BY sh.CLASS;


--6. Напишете заявка, която извежда броя на корабите потънали в битка според класа, за тези класове с повече от 2 кораба

SELECT SH.CLASS, COUNT(*) AS CNT_SHIPS_SUNKED_BY_CLASS
FROM SHIPS sh, OUTCOMES ou
WHERE sh.NAME = ou.SHIP
  AND ou.RESULT = 'sunk'
GROUP BY sh.CLASS
HAVING COUNT(sh.CLASS) > 2;


--7. Напишете заявка, която извежда средното тегло на корабите, за всяка страна

SELECT COUNTRY ,AVG(DISPLACEMENT) AS AVG_WEIGHT
FROM CLASSES
GROUP BY COUNTRY;
