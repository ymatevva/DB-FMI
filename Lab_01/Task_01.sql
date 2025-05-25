SET SCHEMA DB2MOVIE;
--1. Напишете заявка, която извежда адресът на студио ‘MGM’

SELECT ADDRESS
FROM STUDIO
WHERE NAME = 'MGM';

--2. Напишете заявка, която извежда рождената дата на актрисата Sandra Bullock

SELECT BIRTHDATE
FROM MOVIESTAR
WHERE NAME = 'Sandra Bullock';

--3. Напишете заявка, която извежда имената на всички актьори, които са участвали във филм през 1980 в заглавието на които има думата ‘Love’

SELECT SN.STARNAME
FROM STARSIN SN, MOVIE M
WHERE SN.MOVIETITLE = M.TITLE
AND SN.MOVIEYEAR = M.YEAR
AND M.YEAR = 1980
AND M.TITLE LIKE '%lOVE%';

--4. Напишете заявка, която извежда имената на всички продуценти на филми на стойност над 10 000 000 долара

SELECT NAME
FROM MOVIEEXEC
WHERE NETWORTH  10000000;

--5. Напишете заявка, която извежда имената на всички актьори, които са мъже или живеят в Malibu

SELECT NAME
FROM MOVIESTAR
WHERE GENDER = 'M' OR ADDRESS = 'Malibu'
