SET SCHEMA DB2PC;

--1.Напишете заявка, която извежда производителя и честотата на тези лаптопи с размер на диска поне 9 GB

SELECT p.MAKER, l.SPEED
FROM PRODUCT p, LAPTOP l
WHERE p.MODEL = l.MODEL
AND RAM > 9;

--2.Напишете заявка, която извежда номер на модел и цена на всички продукти, произведени от производител с име ‘B’

(SELECT l.CODE, l.PRICE
FROM PRODUCT p, LAPTOP l
WHERE l.MODEL = p.MODEL
AND p.MAKER = 'B')
UNION
(SELECT pc.CODE, pc.PRICE
 FROM PRODUCT p, PC pc
 WHERE pc.MODEL = p.MODEL
   AND p.MAKER = 'B')
UNION
(SELECT pr.CODE, pr.PRICE
 FROM PRODUCT p, PRINTER pr
 WHERE pr.MODEL = p.MODEL
   AND p.MAKER = 'B');

--3.Напишете заявка, която извежда размерите на тези дискове, които се предлагат в повече от два компютъра

SELECT HD
FROM PC
GROUP BY HD
HAVING COUNT(DISTINCT model) > 2;

--4.Напишете заявка, която извежда всички двойки модели на компютри, които имат еднаква честота и памет. Двойките трябва да се показват само по веднъж, например само (i, j), но не и (j, i)


--5.Напишете заявка, която извежда производителите на поне два различни модела

SELECT MAKER
FROM PRODUCT
GROUP BY MAKER
HAVING COUNT(DISTINCT MODEL) >= 2;
