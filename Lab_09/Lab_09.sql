-- CREATE FUNCTION WHICH TELLS WHETHER NUMBER IS ODD OR EVEN

CREATE OR REPLACE FUNCTION IS_EVEN_FUNC(P_NUM INT)
RETURNS VARCHAR(50)
BEGIN
  DECLARE V_MOD INT;
  SET V_MOD = MOD(ABS(P_NUM), 2);

  IF V_MOD = 0 THEN  RETURN 'четно';
  ELSE RETURN 'нечетно';
  END IF;

END;

-- PROBLEM 1
-- Напишете функция за таблицата employee,
-- която връща възрастта на работника към момента в години
--

CREATE OR REPLACE FUNCTION AGE_EMP(EMP_NO INT)
RETURNS INT
RETURN
    SELECT YEAR(CURRENT_DATE  - BIRTHDATE) AS AGE FROM EMPLOYEE
        WHERE EMP_NO = EMPLOYEE.EMPNO;

VALUES FN3MI0700295.AGE_EMP(000010);

-- PROBLEM 2
-- Напишете функция за таблицата employee,
-- която връща трудовия стаж на работника към момента в години

CREATE OR REPLACE FUNCTION STAJ(EMP_NO INT)
RETURNS INT
RETURN
    SELECT YEAR(CURRENT_DATE  - EMPLOYEE.HIREDATE) FROM EMPLOYEE
        WHERE EMPNO = EMP_NO;

VALUES FN3MI0700295.STAJ(000010);

CREATE OR REPLACE FUNCTION SALARY_EMP(work_d CHAR(3))
RETURNS TABLE (
    EMPNO   CHAR(6),
    EMPNAME VARCHAR(30),
    EMPSAL  INT
)
RETURN
    SELECT
        E.EMPNO,
        E.LASTNAME,
        E.SALARY
    FROM EMPLOYEE E
    WHERE E.WORKDEPT = work_d;

SELECT T.*, P.PROJNO
FROM TABLE(FN3MI0700295.SALARY_EMP('D11')) T
JOIN EMPACT P ON T.EMPNO = P.EMPNO;


-- Като използвате горните функции, създайте изглед за таблицата employee,
-- която връща трудовия стаж на работника в години, годините на работника, стойността
-- на заплатата, пола и номера на работника, само за тези работници на възраст над 59
-- години за жените и на възраст над 62 години за мъжете.