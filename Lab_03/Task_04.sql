-- Problem 1
-- Retrieve all employees who are not involved in a project. Not involved in a project
-- are those employees who have no row in the EMP_ACT table. Display employee
-- number, last name, and department name.

SELECT E.EMPNO, E.LASTNAME, E.WORKDEPT
FROM EMPLOYEE E
WHERE E.EMPNO NOT IN (SELECT EMP2.EMPNO
                      FROM EMPPROJACT EMP2);

-- Problem 2
-- Retrieve all employees whose yearly salary is more than the average salary of the
-- employees in their department. Display department number, employee number, and
-- yearly salary. Sort the result by department number and employee number.

SELECT WORKDEPT, EMPNO, SALARY
FROM EMPLOYEE E
WHERE SALARY > (SELECT AVG(SALARY)
                FROM EMPLOYEE
                WHERE WORKDEPT = E.WORKDEPT);


-- Problem 3
-- Retrieve all departments having the same number of employees as department
-- A00. List department number and number of employees. Department A00 should
-- not be part of the result.

SELECT WORKDEPT, COUNT(*) AS CNT
FROM EMPLOYEE E
WHERE WORKDEPT <> 'A00'
GROUP BY WORKDEPT
HAVING COUNT(*) = (SELECT COUNT(*)
                   FROM EMPLOYEE
                   WHERE WORKDEPT = 'A00');

-- Problem 4
-- Display employee number, last name, salary, and department number of employees
-- who earn more than at least one employee in department D11. Employees in
-- department D11 should not be included in the result. In other words, report on any
-- employees in departments other than D11 whose individual yearly salary is higher
-- than that of at least one employee of department D11. List the employees in
-- employee number sequence.

    SELECT EMPNO, EMPLOYEE.LASTNAME, SALARY, WORKDEPT FROM EMPLOYEE
    WHERE WORKDEPT <> 'D11'
    AND SALARY > ANY (SELECT SALARY FROM EMPLOYEE
                                    WHERE WORKDEPT = 'D11')
    ORDER BY EMPNO;

-- Problem 5
-- Display employee number, last name, salary, and department number of all
-- employees who earn more than everybody belonging to department D11.
-- Employees in department D11 should not be included in the result. In other words,
-- report on all employees in departments other than D11 whose individual yearly
-- salary is higher than that of every employee in department D11. List the employees
-- in employee number sequence.

SELECT EMPNO, LASTNAME, SALARY, WORKDEPT FROM EMPLOYEE
WHERE WORKDEPT <> 'D11'
AND SALARY > ALL (SELECT SALARY FROM EMPLOYEE
                                WHERE WORKDEPT = 'D11')
ORDER BY EMPNO;

-- Problem 6
-- Display employee number, last name, and number of activities of the employee with
-- the largest number of activities. Each activity is stored as one row in the EMP_ACT
-- table.
SELECT E.EMPNO, E.LASTNAME, COUNT(*) AS CNT_ACT FROM EMPLOYEE E, EMPPROJACT EMP
WHERE E.EMPNO = EMP.EMPNO
GROUP BY E.EMPNO, E.LASTNAME
HAVING COUNT(*) >= ALL(SELECT COUNT(*) FROM EMPPROJACT GROUP BY EMPNO);
