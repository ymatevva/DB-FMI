
SET SCHEMA DB2SHIPS;

--1. • Напишете заявка, която извежда страните, чиито кораби са с най-голям брой оръжия.

SELECT COUNTRY
FROM CLASSES
WHERE NUMGUNS = (SELECT MAX(NUMGUNS) FROM CLASSES);

--2. Напишете заявка, която извежда класовете, за които поне един от корабите им е потънал в битка

SELECT sh.CLASS
FROM SHIPS sh, OUTCOMES ou
WHERE ou.SHIP = sh.NAME
HAVING COUNT((SELECT RESULT FROM OUTCOMES)) > 1;


--3. Напишете заявка, която извежда имената на корабите с 16 инчови оръдия (bore).

SELECT NAME
    FROM SHIPS
        WHERE CLASS IN (SELECT CLASS FROM CLASSES WHERE BORE > 15);

--4. Напишете заявка, която извежда имената на битките, в които са участвали кораби от клас ‘Kongo’.

SELECT BATTLE
FROM OUTCOMES
WHERE SHIP IN (SELECT NAME FROM SHIPS WHERE CLASS = 'Kongo');



--5. Напишете заявка, която извежда иманата на корабите, чиито брой оръдия е найголям в сравнение с корабите със същия калибър оръдия (bore).

SELECT NAME
FROM SHIPS sh, CLASSES cl1
WHERE sh.CLASS = cl1.CLASS
AND NUMGUNS > ALL(SELECT Cl2.NUMGUNS FROM CLASSES cl2 WHERE cl2.BORE = cl1.BORE AND cl1.CLASS <> cl2.CLASS) ;
