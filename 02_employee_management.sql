-- 1. Select the last name of all employees.

SELECT LastName FROM Employees;

-- 2. Select the last name of all employees, without duplicates.

SELECT DISTINCT LastName FROM Employees;

-- 3. Select all the data of employees whose last name is "Smith".

SELECT * FROM Employees
  WHERE LastName = 'Smith';

-- 4. Select all the data of employees whose last name is "Smith" or "Doe".

SELECT * FROM Employees
  WHERE LastName IN ('Smith', 'Doe');

-- 5. Select all the data of employees that work in department 14.

SELECT * FROM Employees
  WHERE Department = 14;

-- 6. Select all the data of employees that work in department 37 or department 77.

SELECT * FROM Employees
  WHERE Department IN (37, 77);

-- 7. Select all the data of employees whose last name begins with an "S".

SELECT * FROM Employees
  WHERE LastName LIKE 'S%';

-- 8. Select the sum of all the departments' budgets.

SELECT SUM(Budget) FROM Departments; 

-- 9. Select the number of employees in each department (you only need to show the department code and the number of employees).

SELECT Department, COUNT(*) FROM Employees
  GROUP BY Department;
  
-- 10. Select all the data of employees, including each employee's department's data.

SELECT E.Name, LastName, D.Name, Department, Code, Budget FROM Employees E
  JOIN Departments D ON E.Department = D.Code;

-- 11. Select the name and last name of each employee, along with the name and budget of the employee's department.

SELECT E.Name, LastName, D.Name, Budget FROM Employees E
  JOIN Departments D ON E.Department = D.Code;

-- 12. Select the name and last name of employees working for departments with a budget greater than $60,000.

SELECT Name, LastName FROM Employees
  WHERE Department IN
    (SELECT Code FROM Departments
     WHERE Budget > 60000);

-- 13. Select the departments with a budget larger than the average budget of all the departments.

SELECT Name FROM Departments
  WHERE Budget > 
    (SELECT AVG(Budget) FROM Departments); 

-- 14. Select the names of departments with more than two employees.

SELECT Name FROM Departments
  WHERE Code IN
    (SELECT Department FROM Employees
     GROUP BY Department
     HAVING COUNT(*) > 2);

-- 15. Select the name and last name of employees working for departments with second lowest budget.

SELECT Name, LastName FROM Employees
  WHERE Department IN
    (SELECT Code FROM Departments WHERE Budget = MAX
      (SELECT Budget FROM Departments
      ORDER BY Budget
      LIMIT 2));

-- 16. Add a new department called "Quality Assurance", with a budget of $40,000 and departmental code 11. Add an employee called "Mary Moore" in that department, with SSN 847-21-9811.

INSERT INTO Departments(Code, Name, Budget)
VALUES (11, "Quality Assurance", 40000);

INSERT INTO Employees(SSN, Name, LastName, Department)
VALUES (847-21-9811, "Mary", "Moore", 11);

-- 17. Reduce the budget of all departments by 10%.

UPDATE Departments
  SET Budget = Budget - (Budget * 0.10);

-- 18. Reassign all employees from the Research department (code 77) to the IT department (code 14).

UPDATE Employees
  SET Department = 14
  WHERE Department = 77;

-- 19. Delete from the table all employees in the IT department (code 14).

DELETE FROM Employees
  WHERE Department = 14;

-- 20. Delete from the table all employees who work in departments with a budget greater than or equal to $60,000.

DELETE FROM Employees
  WHERE Department IN (SELECT Code FROM Departments WHERE Budget >= 60000)

-- 21. Delete from the table all employees.

DELETE FROM employees;
