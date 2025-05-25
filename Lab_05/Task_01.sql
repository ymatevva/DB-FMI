
-- 1. За таблицата Movie, да се изведе номер на продуцент, брой на филми за този продуцент.

    SELECT me.CERT# , COUNT(m.TITLE)
    FROM MOVIEEXEC me, MOVIE m
    WHERE ME.CERT# = m.PRODUCERC#
    GROUP BY ME.CERT#;


-- 2. Като задача 1, но искаме и име на продуцент и networth.

SELECT me.CERT# , me.NAME , me.NETWORTH, COUNT(m.TITLE)
FROM MOVIEEXEC me, MOVIE m
WHERE ME.CERT# = m.PRODUCERC#
GROUP BY ME.CERT#, me.NAME, me.NETWORTH;

-- 3. Заявка, която ни връща име на актьор, рождена дата и броя на филмите, в които е участвал

SELECT sn.STARNAME, ms.BIRTHDATE, COUNT(sn.MOVIETITLE) AS ROLE_COUNT
FROM STARSIN sn, MOVIESTAR ms
WHERE sn.STARNAME = ms.NAME
GROUP BY SN.STARNAME, ms.BIRTHDATE;

-- 4. Заявка, която ни връща имената на актьорите, рождена дата и броя на филмите,
-- в които са участвали за тези актьори с най-много филми.

SELECT sn.STARNAME, ms.BIRTHDATE, COUNT(sn.MOVIETITLE) AS ROLE_COUNT
FROM STARSIN sn, MOVIESTAR ms
WHERE sn.STARNAME = ms.NAME
GROUP BY SN.STARNAME, ms.BIRTHDATE
ORDER BY ROLE_COUNT DESC
LIMIT 5;


-- 5. За Movie, име на продуцент, име на студио, и брой на филми за всички продуцент, според студиото.

SELECT me.NAME, m.STUDIONAME, COUNT(m.TITLE)
FROM MOVIEEXEC me, MOVIE m
WHERE me.CERT# = m.PRODUCERC#
GROUP BY me.NAME, m.STUDIONAME;

-- 6. Име на филм и име на най-възрастния актьор участвал във филма



-- 7. Намира най-възрастният актьор участвал във филм. Извежда имената му и броя на филмите, в който е участвал.

SELECT ms.NAME, COUNT(sn.MOVIETITLE)
FROM MOVIESTAR ms, STARSIN sn
WHERE ms.NAME = sn.STARNAME
AND ms.BIRTHDATE = (SELECT MIN(BIRTHDATE) FROM MOVIESTAR)
GROUP BY ms.NAME;
