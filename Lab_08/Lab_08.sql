-- Problem 1
-- Joe's manager wants information about employees which match the following
-- criteria:
-- • Their yearly salary is between 22000 and 24000.
-- • They work in departments D11 or D21.
-- List the employee number, last name, yearly salary, and department number of the
-- appropriate employees.

SELECT EMPNO, LASTNAME, SALARY, WORKDEPT
FROM EMPLOYEE
WHERE WORKDEPT IN ('D11', 'D21')
  AND SALARY BETWEEN 22000 AND 24000;


-- Problem 2
-- Now, Joe's manager wants information about the yearly salary. He wants to know
-- the minimum, the maximum, and average yearly salary of all employees with an
-- education level of 16. He also wants to know how many employees have this
-- education level.

SELECT MIN(SALARY) AS MIN_SAL, MAX(SALARY) AS MAX_SAL, AVG(SALARY) AS AVG_SAL, COUNT(*) AS CNT
FROM EMPLOYEE
WHERE EDLEVEL = 16;

-- Problem 3
-- Joe's manager is interested in some additional salary information. This time, he
-- wants information for every department that appears in the EMPLOYEE table,
-- provided that the department has more than five employees. The report needs to
-- show the department number, the minimum, maximum, and average yearly salary,
-- and the number of employees who work in the department.

SELECT WORKDEPT, MIN(SALARY) AS MIN_SAL, MAX(SALARY) AS MAX_SAL, AVG(SALARY) AS AVG_SAL, COUNT(*) AS CNT_EMP
FROM EMPLOYEE
GROUP BY WORKDEPT
HAVING COUNT(*) > 5;


-- Problem 4
-- Joe's manager wants information about employees grouped by department,
-- grouped by sex and in addition by the combination of department and sex. List only
-- those who work in a department which start with the letter D.
-- List the department, the sex, sum of the salaries, minimum salary and maximum
-- salary.

SELECT WORKDEPT, SEX, SUM(SALARY), MIN(SALARY), MAX(SALARY)
FROM EMPLOYEE
WHERE WORKDEPT LIKE 'D%'
GROUP BY CUBE (WORKDEPT, SEX);

-- Problem 5
-- Joe's manager wants information about the average total salary for all departments.
-- List in department order, the department, average total salary and rank over the
-- average total salary.


SELECT WORKDEPT, AVG(SALARY + BONUS) AS TOTAL_S, RANK() OVER (ORDER BY AVG(SALARY + BONUS)) AS RANK
FROM EMPLOYEE
GROUP BY WORKDEPT
ORDER BY WORKDEPT;

-- SOME EXAMPLES FROM SEMINAR

-- this is example for using cube
-- cube will make 2^n combinations When we use grouping we can differ
-- whether the value is missing or is just bc the row summarizes
SELECT WORKDEPT,
       SEX,
       EDLEVEL,
       MIN(SALARY)        AS MIN_SAL,
       GROUPING(WORKDEPT) AS GW,
       GROUPING(SEX)      AS GS,
       GROUPING(EDLEVEL)  AS GE
FROM EMPlOYEE
WHERE WORKDEPT IN ('C01', 'D11', 'A00')
GROUP BY CUBE (WORKDEPT, SEX, EDLEVEL)
ORDER BY WORKDEPT, SEX, EDLEVEL;

-- HERE IS USED ROLLUP WHICH WILL COMBINE WORDKEPT SEX EDL, THEN WORKD, SEX AND THEN WORKDEPT AND TOTAL
SELECT EMPLOYEE.WORKDEPT, SEX, EDLEVEL, MAX(SALARY),
       GROUPING(EMPLOYEE.WORKDEPT) AS GW,
       GROUPING(EMPLOYEE.SEX) AS GS,
       GROUPING(EMPLOYEE.EDLEVEL) AS GE FROM EMPLOYEE
GROUP BY ROLLUP(EMPLOYEE.WORKDEPT, SEX, EDLEVEL);

-- THE LAST EXAMPLE IS USING GROUPING SETS AND WE CAN SPECIFY WHICH SETS TO BE MADE
-- GROUPING SETS DOES NOT MAKE AUTOMATICALLY CALCULATION FOR ALL
SELECT EMPLOYEE.WORKDEPT, SEX, EDLEVEL, MAX(SALARY),
       GROUPING(EMPLOYEE.WORKDEPT) AS GW,
       GROUPING(EMPLOYEE.SEX) AS GS,
       GROUPING(EMPLOYEE.EDLEVEL) AS GE FROM EMPLOYEE
GROUP BY GROUPING SETS (EMPLOYEE.WORKDEPT, SEX, EDLEVEL, (SEX,EDLEVEL));


CREATE VIEW TEST_VIEW AS
SELECT * FROM EMPLOYEE ;

SELECT * FROM TEST_VIEW;