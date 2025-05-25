
SET SCHEMA DB2PC;

--1.Напишете заявка, която извежда средната честота на компютрите

SELECT AVG(SPEED) AS AVG_PC_SPEED
FROM PC;


--2. • Напишете заявка, която извежда средния размер на екраните на лаптопите за всеки производител

SELECT p.MAKER, AVG(l.SCREEN) AS AVG_LAPTOP_SCREEN
FROM LAPTOP l, PRODUCT p
WHERE L.MODEL = P.MODEL
GROUP BY p.MAKER;


--3. Напишете заявка, която извежда средната честота на лаптопите с цена над 1000

SELECT ROUND(DECIMAL(AVG(SPEED),9,2)) AS AVG_LAPTOP_SPEED
FROM LAPTOP
WHERE PRICE > 1000;

--4 .Напишете заявка, която извежда средната цена на компютрите произведени от производител ‘A’

SELECT p.MAKER, ROUND(AVG(pc.PRICE)) AS AVG_PC_PRICE
FROM PRODUCT p, PC pc
WHERE P.MODEL = pc.MODEL
GROUP BY p.MAKER;

--5.Напишете заявка, която извежда средната цена на компютрите и лаптопите за производител ‘B’

--6. Напишете заявка, която извежда средната цена на компютрите според различните им честоти

SELECT AVG(PRICE) AS AVG_PRICE
FROM PC
GROUP BY SPEED;

--7. Напишете заявка, която извежда производителя, които е произвел поне 3 различни модела компютъра

SELECT p.MAKER
FROM PRODUCT p, PC pc
WHERE pc.MODEL = p.MODEL
GROUP BY p.MAKER
HAVING COUNT(DISTINCT pc.CODE) >= 3;

--8. Напишете заявка, която извежда производителя с най-висока цена на компютър

SELECT p.MAKER
FROM PRODUCT p, PC pc
WHERE p.MODEL = pc.MODEL
AND pc.PRICE = (SELECT MAX(PRICE) FROM pc);

--9. Напишете заявка, която извежда средната цена на компютрите за всяка честота по-голяма от 200

SELECT SPEED ,AVG(PRICE) AS AVG_PC_PRICE
FROM PC
WHERE SPEED > 200
GROUP BY SPEED;

--10. Напишете заявка, която извежда средния размер на диска на тези компютри произведени от производители, които произвеждат и принтери

SELECT DECIMAL(AVG(pc.HD),9,2) AS AVG_HD
FROM PC pc, PRODUCT p
WHERE pc.MODEL = p.MODEL
AND p.MAKER IN (SELECT p1.MAKER FROM PRODUCT p1, PRINTER pr WHERE pr.MODEL = p1.MODEL );



