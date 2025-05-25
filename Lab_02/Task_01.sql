SET SCHEMA DB2MOVIE;

--1.Напишете заявка, която извежда имената на актьорите мъже участвали в ‘Terms of Endearment’

SELECT sn.STARNAME
FROM STARSIN sn, MOVIESTAR ms
WHERE sn.STARNAME = ms.NAME
AND sn.MOVIETITLE = 'Terms of Endearment'
AND ms.GENDER = 'M';

--2.Напишете заявка, която извежда имената на актьорите участвали във филми продуцирани от ‘MGM’през 1995 г.

SELECT sn.STARNAME
FROM MOVIE m, STARSIN sn
WHERE m.TITLE = sn.MOVIETITLE
AND   m.YEAR  = sn.MOVIEYEAR
AND m.STUDIONAME = 'MGM'
AND YEAR = 1995;

--3.Напишете заявка, която извежда името на президента на ‘MGM’

SELECT DISTINCT me.NAME
FROM MOVIE m, MOVIEEXEC me
WHERE m.PRODUCERC# = me.CERT#
AND m.STUDIONAME = 'MGM';

--4.Напишете заявка, която извежда имената на всички филми с дължина по-голяма от дължината на филма ‘Gone With the Wind’

SELECT TITLE
FROM MOVIE
WHERE LENGTH > (SELECT LENGTH FROM MOVIE WHERE TITLE = 'Gone With the Wind');

--5.Напишете заявка, която извежда имената на тези продукции на стойност поголяма от продукциите на продуценти ‘Merv Griffin’

SELECT TITLE
FROM MOVIE m, MOVIEEXEC me
WHERE m.PRODUCERC# = me.CERT#
AND me.NETWORTH > (SELECT NETWORTH FROM MOVIEEXEC WHERE NAME = 'Merv Griffin');
