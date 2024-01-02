-- 1. LIST THE EMPLOYEE NUMBER, LAST NAME, FIRST NAME, SEX, AND SALARY OF EACH EMPLOYEE.
SELECT 
    employees.emp_no AS "Employee Number",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name",
    employees.sex AS "Sex",
    salaries.salary AS "Salary"
FROM 
    employees
JOIN 
    salaries ON employees.emp_no = salaries.emp_no;
    
-- 2. LIST THE FIRST NAME, LAST NAME, AND HIRE DATE FOR THE EMPLOYEES WHO WERE HIRED IN 1986.
SELECT 
    first_name AS "First Name",
    last_name AS "Last Name",
    hire_date AS "Hire Date"
FROM
    employees
WHERE
    date_part('year', hire_date) = '1986';
    
-- 3. LIST THE MANAGER OF EACH DEPARTMENT ALONG WITH THEIR DEPARTMENT NUMBER, DEPARTMENT NAME, EMPLOYEE NUMBER, LAST NAME, AND FIRST NAME.
SELECT 
    departments.dept_no AS "Department Number",
    departments.dept_name AS "Department Name",
    employees.emp_no AS "Employee Number",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name"
FROM 
    departments 
JOIN 
    dept_manager dm ON departments.dept_no = dm.dept_no
JOIN 
    employees ON dm.emp_no = employees.emp_no;
    
-- 4. LIST THE DEPARTMENT NUMBER FOR EACH EMPLOYEE ALONG WITH THAT EMPLOYEE’S EMPLOYEE NUMBER, LAST NAME, FIRST NAME, AND DEPARTMENT NAME.
SELECT
    dept_emp.dept_no AS "Department Number",
    employees.emp_no AS "Employee Number",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name",
    departments.dept_name AS "Department Name"
FROM
    employees
JOIN
    dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
    departments ON dept_emp.dept_no = departments.dept_no;
    
-- 5. LIST FIRST NAME, LAST NAME, AND SEX OF EACH EMPLOYEE WHOSE FIRST NAME IS HERCULES AND WHOSE LAST NAME BEGINS WITH THE LETTER B.
SELECT
    first_name AS "First Name",
    last_name AS "Last Name",
    sex AS "Sex"
FROM
    employees
WHERE
    first_name = 'Hercules'
AND
    last_name LIKE 'B%';

-- 6. LIST EACH EMPLOYEE IN THE SALES DEPARTMENT, INCLUDING THEIR EMPLOYEE NUMBER, LAST NAME, AND FIRST NAME.
SELECT 
    employees.emp_no AS "Employee Number",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name"
FROM
    employees
JOIN
    dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
    departments ON dept_emp.dept_no = departments.dept_no
WHERE 
    departments.dept_name = 'Sales';
    
-- 7. LIST EACH EMPLOYEE IN THE SALES AND DEVELOPMENT DEPARTMENTS, INCLUDING THEIR EMPLOYEE NUMBER, LAST NAME, FIRST NAME, AND DEPARTMENT NAME.
SELECT 
    employees.emp_no AS "Employee Number",
    employees.last_name AS "Last Name",
    employees.first_name AS "First Name",
    departments.dept_name AS "Department Name"
FROM
    employees
JOIN
    dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN
    departments ON dept_emp.dept_no = departments.dept_no
WHERE 
    departments.dept_name IN ('Sales', 'Development');

-- 8. LIST THE FREQUENCY COUNTS, IN DESCENDING ORDER, OF ALL THE EMPLOYEE LAST NAMES (THAT IS, HOW MANY EMPLOYEES SHARE EACH LAST NAME).
SELECT
    last_name as "Last Name",
    COUNT(last_name) AS Frequency
FROM
    employees
GROUP BY
    last_name
ORDER BY
    frequency DESC;
