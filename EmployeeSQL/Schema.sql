-- CREATE DEPARTMENTS TABLE 
CREATE TABLE departments (
	dept_no VARCHAR(30) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(255)
);

-- CREATE TITLES TABLE
CREATE TABLE titles (
	title_id VARCHAR(30) PRIMARY KEY NOT NULL,
	title VARCHAR(255)
);

-- CREATE EMPLOYEES TABLE
CREATE TABLE employees (
	emp_no INT PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(30) NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
	birth_date DATE,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(5),
	hire_date DATE
);

-- CREATE SALARIES TABLE
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY NOT NULL,
	salary INT,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- CREATE DEPT_MANAGER TABLE (CREATE COMPOSITE PK)
CREATE TABLE dept_manager (
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

-- CREATE DEPT_EMP TABLE (CREATE COMPOSITE PK)
CREATE TABLE dept_emp (
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(30) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);
