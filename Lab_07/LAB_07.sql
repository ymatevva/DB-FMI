-- Problem 1
-- Produce a report listing all employees whose last name ends with 'N'. List the
-- employee number, the last name, and the last character of the last name used to
-- control the result. The LASTNAME column is defined as VARCHAR. There is a
-- function which provides the length of the last name.

SELECT EMPNO, LASTNAME, SUBSTR(LASTNAME, LENGTH(LASTNAME), 1) AS LAST_CHAR FROM EMPLOYEE
    WHERE SUBSTR(LASTNAME, LENGTH(LASTNAME),1) = 'N';

-- Problem 2
-- For each project, display the project number, project name, department number, and
-- project number of its associated major project (COLUMN = MAJPROJ). If the value
-- in MAJPROJ is NULL, show a literal of your choice instead of displaying a null value.
-- List only projects assigned to departments D01 or D11. The rows should be listed in
-- project number sequence.

 SELECT PROJNO, PROJNAME, DEPTNO, COALESCE(MAJPROJ, 'UNKNOWN MAJPROJ') FROM PROJECT
     WHERE DEPTNO IN ('D01', 'D11');

-- Problem 3
-- The salaries of the employees in department E11 will be increased by 3.75 percent.
-- What will be the increase in dollars? Display the last name, actual yearly salary, and
-- the salary increase rounded to the nearest dollar. Do not show any cents.
SELECT LASTNAME,
       ROUND(DECIMAL(SALARY * 3.75, 10, 2), 2) AS INCREASE,
       SALARY + ROUND(DECIMAL(SALARY * 3.75, 10, 2), 2) AS ACTUAL_SALARY
FROM EMPLOYEE
WHERE EMPLOYEE.WORKDEPT = 'E11';


-- Problem 5
-- For each female employee in the company present her department, her job and her
-- last name with only one blank between job and last name.

 SELECT WORKDEPT, JOB || ' ' || LASTNAME AS JOB_LAST_NAME FROM EMPLOYEE
     WHERE SEX = 'F';

-- Problem 6
-- Calculate the difference between the date of birth and the hiring date for all
-- employees for whom the hiring date is more than 30 years later than the date of
-- birth. Display employee number and calculated difference. The difference should be
-- shown in years, months, and days - each of which should be shown in a separate
-- column. Make sure that the rows are in employee number sequence.

SELECT  EMPNO, DECIMAL(DAYS(HIREDATE) - DAYS(BIRTHDATE), 6, 0) AS DAYS, DECIMAL(MONTHS_BETWEEN(HIREDATE, BIRTHDATE),4,0) AS MONTHS, DECIMAL(YEAR(HIREDATE) - YEAR( BIRTHDATE),4,0) AS YEARS  FROM EMPLOYEE
    WHERE YEAR(HIREDATE) - YEAR(BIRTHDATE) > 30
ORDER BY EMPNO;

-- Problem 7
-- Display project number, project name, project start date, and project end date of
-- those projects whose duration was less than 10 months. Display the project duration
-- in days.

  SELECT PROJNO, PROJNAME, PRSTDATE, PRENDATE , DAYS(PRENDATE) - DAYS(PRSTDATE) AS DURATION FROM PROJECT
WHERE MONTHS_BETWEEN(PRENDATE , PRSTDATE) < 10;

-- Problem 8
-- List the employees in department D11 who had activities. Display employee number,
-- last name, and first name. Also, show the activity number and the activity duration
-- (in days) of the activities started last. Multiple activities may have been started on
-- the same day.

    SELECT  E.EMPNO, E.LASTNAME, E.FIRSTNME, EMP.ACTNO , EMP.EMSTDATE, DAYS(EMP.EMENDATE) - DAYS(EMP.EMSTDATE) AS DAYS_DURATION FROM EMPLOYEE E, EMPPROJACT EMP, ACT A
    WHERE EMP.EMPNO = E.EMPNO
      AND A.ACTNO = EMP.ACTNO
        AND E.WORKDEPT = 'D11'
    ORDER BY E.EMPNO, EMP.EMSTDATE DESC;

-- Problem 9
-- How many weeks are between the first manned landing on the moon (July 20, 1969)
-- and the first day of the year 2000?

SELECT
    (DAYS(DATE('2000-01-01')) - DAYS(DATE('1969-07-20'))) / 7 AS WFMLM
FROM SYSIBM.SYSDUMMY1;

-- Problem 10
-- Find out which employees were hired on a Saturday or a Sunday. List their last
-- names and their hiring dates.

SELECT EMPLOYEE.LASTNAME, EMPLOYEE.HIREDATE FROM EMPLOYEE
WHERE DAYOFWEEK(HIREDATE) IN (6,7);
