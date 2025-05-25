SET SCHEMA DB2SHIPS;

--1. . Да се напише заявка, която извежда име на битка и име на кораб в една колона (конкатенирани) с тире между тях, както и деня и седмицата, в която се е провела битката.

SELECT CONCAT(CONCAT(ou.BATTLE,' '),ou.SHIP) AS BATTLE_DATA, DAY(B.DATE) AS BATTLE_DAY, WEEK(b.DATE) AS BATTLE_WEEK
FROM OUTCOMES ou, BATTLES b
WHERE ou.BATTLE = B.NAME;


--2.  Напишете заявка, която извежда имената и рождените дати на тези актьори, за които е изпълнено, че са родени във високосна година и едновременно с това са и една и съща зодия по китайския календар. Да се счита, че всички родени с 12 години разлика са една и съща зодия по китайския календар.

SET SCHEMA DB2MOVIE;

SELECT M1.NAME AS M1_NAME, M1.BIRTHDATE AS M1_BIRTHDATE, M2.NAME AS M2_NAME, M2.BIRTHDATE AS M2_BIRTHDATE
FROM MOVIESTAR M1, MOVIESTAR M2
WHERE MOD(YEAR(M1.BIRTHDATE),4) = 0 AND (MOD(YEAR(M1.BIRTHDATE),400) = 0 OR MOD(YEAR(M1.BIRTHDATE),100)<>0)
AND MOD(YEAR(M2.BIRTHDATE),4) = 0 AND (MOD(YEAR(M2.BIRTHDATE),400) = 0 OR MOD(YEAR(M2.BIRTHDATE),100)<>0)
AND MOD(YEAR(M1.BIRTHDATE) - YEAR(M2.BIRTHDATE),12) = 0;


--3.nапишете заявка, която извежда рождената дата и имената на тези актьори родени на една и съща дата. Изведете имената на актьорите по шаблона (MS1_NAME, MS2_NAME). Повтарящите се двойки от вида (MS1_NAME, MS2_NAME) да не се извеждат в резултата.

SELECT M1.NAME AS M1_NAME, M1.BIRTHDATE AS M1_BIRTDATE, M2.NAME AS M2_NAME, M2.BIRTHDATE AS M2_BIRTHDATE
FROM MOVIESTAR M1, MOVIESTAR M2
WHERE  M1.BIRTHDATE < M2.BIRTHDATE
AND DAY(M1.BIRTHDATE) = DAY(M2.BIRTHDATE)
AND MONTH(M1.BIRTHDATE) = MONTH(M2.BIRTHDATE);


--4.  Да се напише заявка, която извежда колко години има разлика между датата, на която кораб е бил пуснат на вода и първата битка, в която е уч




--5.  Да се напише заявка, която намира филма с най-малка продължителност. Ако продължителността на филма е NULL да се извежда 0.

SELECT TITLE, COALESCE(LENGTH, 0) AS duration
FROM MOVIE
WHERE COALESCE(LENGTH, 0) = (
    SELECT MIN(COALESCE(LENGTH, 0)) FROM MOVIE
);
