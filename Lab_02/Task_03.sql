
SET SCHEMA DB2SHIPS;

--1.Напишете заявка, която извежда името на корабите по-тежки от 35000
SELECT sh.NAME
FROM SHIPS sh, CLASSES cl
WHERE sh.CLASS = cl.CLASS
AND cl.DISPLACEMENT > 35000;

--2.Напишете заявка, която извежда имената, водоизместимостта и броя оръжия на всички кораби участвали в битката при ‘Guadalcanal’

SELECT sh.NAME, cl.BORE, cl.NUMGUNS
FROM CLASSES cl, SHIPS sh, OUTCOMES ou
WHERE cl.CLASS = sh.CLASS
AND sh.NAME = ou.SHIP
AND ou.BATTLE = 'Guadalcanal';


--3. Напишете заявка, която извежда имената на тези държави, които имат кораби от тип ‘bb’ и ‘bc’ едновременнo

(SELECT COUNTRY
FROM CLASSES
WHERE TYPE = 'bb')
INTERSECT
(SELECT COUNTRY
 FROM CLASSES
 WHERE TYPE = 'bc');

--4. Напишете заявка, която извежда имената на тези битки с три кораби на една и съща държава

SELECT ou.BATTLE
FROM OUTCOMES ou, CLASSES cl, SHIPS sh
WHERE ou.SHIP = sh.NAME
AND sh.CLASS = cl.CLASS
GROUP BY ou.BATTLE, cl.COUNTRY
HAVING (COUNT(DISTINCT sh.NAME) = 3);

--5. • Напишете заявка, която извежда имената на тези кораби, които са били повредени в една битка, но по късно са участвали в друга битка
