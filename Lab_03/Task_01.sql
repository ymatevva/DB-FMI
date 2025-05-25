

SET SCHEMA DB2MOVIE;

--1. Напишете заявка, която извежда имената на актрисите, които са също и продуценти с нетна стойност по-голяма от 10 милиона.
SELECT NAME
FROM MOVIESTAR
WHERE
GENDER = 'F'
AND NAME IN (SELECT NAME FROM MOVIEEXEC WHERE NETWORTH > 10000000);


--2. Напишете заявка, която извежда имената на тези актьори (мъже и жени), които не са продуценти

SELECT NAME
FROM MOVIESTAR
WHERE NAME  NOT IN (SELECT NAME FROM MOVIEEXEC);

--3. Напишете заявка, която извежда имената на всички филми с дължина по-голяма от дължината на филма ‘Gone With the Wind’

SELECT TITLE
FROM MOVIE
WHERE LENGTH > (SELECT LENGTH FROM MOVIE WHERE TITLE = 'Gone With the Wind');

--4.Напишете заявка, която извежда имената на продуцентите и имената на продукциите за които стойността им е по-голяма от продукциите на продуценти ‘Merv Griffin’

SELECT me.NAME, m.TITLE
FROM MOVIEEXEC me, MOVIE m
WHERE me.CERT# = m.PRODUCERC#
AND NETWORTH > (SELECT NETWORTH FROM MOVIEEXEC WHERE NAME = 'Merv Griffin');

--5.Напишете заявка, която извежда името на филмите с най-голяма дължина по студио.

SELECT TITLE
FROM MOVIE
WHERE LENGTH = (SELECT MAX(LENGTH) FROM MOVIE)
ORDER BY STUDIONAME;
