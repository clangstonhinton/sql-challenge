-- (1) List the employee number, last name, first name, sex, and salary of each employee

-- View the employees table
SELECT *
FROM employees;

-- Perform an INNER JOIN on the employees and salaries tables

CREATE VIEW employee_info_with_salary AS
SELECT employees.emp_no, 
employees.last_name, 
employees.first_name, 
employees.sex, 
salaries.salary
FROM employees
INNER JOIN salaries ON
salaries.emp_no=employees.emp_no;

SELECT *
FROM employee_info_with_salary;


-- (2) List the first name, last name, and hire date for the employees who were 
-- hired in 1986

CREATE VIEW hire_date_1986 AS
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > '1985-12-31' and hire_date < '1987-01-01'
ORDER BY last_name, first_name;

SELECT * FROM hire_date_1986;


-- (3) List the manager of each department along with their department number, 
-- department name, employee number, last name, and first name

-- Perform an INNER JOIN on the dept_manager and department and then on employees tables

CREATE VIEW dept_manager_info AS
SELECT 
employees.last_name, 
employees.first_name,
dept_manager.dept_no, 
departments.dept_name, 
dept_manager.emp_no
FROM dept_manager
  INNER JOIN departments
  ON departments.dept_no = dept_manager.dept_no
  	INNER JOIN employees
  	ON employees.emp_no = dept_manager.emp_no
	ORDER BY dept_name, last_name, first_name;

SELECT * FROM dept_manager_info;
  
-- (4) List the department number for each employee along with that 
-- employee’s employee number, last name, first name, and department name

-- Perform an INNER JOIN on the employees and department and then on dept_emp tables

CREATE VIEW employees_by_dept AS
SELECT dept_emp.dept_no, 
employees.emp_no, 
employees.last_name, 
employees.first_name, 
departments.dept_name
FROM employees
  INNER JOIN dept_emp
  ON dept_emp.emp_no = employees.emp_no
  	INNER JOIN departments
  	ON departments.dept_no = dept_emp.dept_no
	ORDER BY dept_name, last_name, first_name;
  
SELECT * FROM employees_by_dept;

-- (5) List first name, last name, and sex of each employee whose 
-- first name is Hercules and whose last name begins with the letter B

CREATE VIEW hercules_employees AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE'B%'
ORDER BY last_name;

SELECT * FROM hercules_employees;


-- (6) List each employee in the Sales department, including their 
-- employee number, last name, and first name

-- Perform an INNER JOIN on employees, dept_emp, and department tables and WHERE dept_name=Sales

CREATE VIEW sales_employees AS
SELECT departments.dept_name, 
employees.emp_no, 
employees.last_name, 
employees.first_name
FROM employees
  INNER JOIN dept_emp
  ON dept_emp.emp_no = employees.emp_no
  	INNER JOIN departments
  	ON departments.dept_no = dept_emp.dept_no
  	WHERE departments.dept_name = 'Sales'
	ORDER BY last_name, first_name;
	
SELECT * FROM sales_employees;
		
-- (7) List each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name

CREATE VIEW sales_dev_employees AS
SELECT departments.dept_name, 
employees.emp_no, 
employees.last_name, 
employees.first_name
FROM employees
  INNER JOIN dept_emp
  ON dept_emp.emp_no = employees.emp_no
  	INNER JOIN departments
 	ON departments.dept_no = dept_emp.dept_no
  	WHERE departments.dept_name = 'Sales' or departments.dept_name = 'Development'
	ORDER BY last_name, first_name;

SELECT * FROM sales_dev_employees;

-- (8) List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).

-- Count the frequency of employees last_name with GROUP BY

CREATE VIEW last_name_count AS
SELECT last_name,COUNT(*) AS "frequency" 
FROM employees 
GROUP BY last_name
ORDER BY frequency DESC;

SELECT * FROM last_name_count;
