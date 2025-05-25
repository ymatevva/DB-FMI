
SET SCHEMA DB2PC;

--1. Напишете заявка, която извежда производителите на персонални компютри с честота поне 500

SELECT DISTINCT p.MAKER
FROM PRODUCT p , PC pc
WHERE pc.MODEL = p.MODEL
AND SPEED >= 500;


--2. Напишете заявка, която извежда принтерите с най-висока цена.

SELECT *
FROM PRINTER
WHERE PRICE = (SELECT MAX(PRICE) FROM PRINTER);

--3.  Напишете заявка, която извежда лаптопите, чиято честота е по-ниска от честотата на който и да е персонален компютър.

SELECT *
FROM LAPTOP
WHERE SPEED < ALL(SELECT SPEED FROM PC);


--4.  Напишете заявка, която извежда производителя на цветния принтер с най-ниска цена.

SELECT p.MAKER
FROM PRINTER pr, PRODUCT p
WHERE P.MODEL = pr.MODEL
AND COLOR = 'y'
AND PRICE = (SELECT MIN(PRICE) FROM PRINTER);


--5. Напишете заявка, която извежда производителите на тези персонални компютри с най-малко RAM памет, които имат най-бързи процесори.

SELECT DISTINCT p.MAKER
FROM PRODUCT p, PC pc
WHERE P.MODEL = PC.MODEL
AND PC.RAM = (SELECT MIN(RAM) FROM PC WHERE SPEED = (SELECT MAX(SPEED) FROM PC));


