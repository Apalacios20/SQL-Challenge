
CREATE TABLE Titles (
    title_id VARCHAR(50)   NOT NULL,
    title VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

SELECT * FROM "Titles"
;

CREATE TABLE Departments (
    dept_no VARCHAR(50)   NOT NULL,
    dept_name VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        dept_no
     )
);

SELECT * FROM "Departments"
;

CREATE TABLE Department_Employees (
    emp_no INT   NOT NULL,
    dept_no VARCHAR(50)   NOT NULL
);

SELECT * FROM "Department_Employees"
;

CREATE TABLE Department_Manager (
    dept_no VARCHAR(50)   NOT NULL,
    emp_no INT   NOT NULL,
    CONSTRAINT pk_Department_Manager PRIMARY KEY (
        emp_no
     )
);

SELECT * FROM "Department_Manager"
;

CREATE TABLE Employees (
    emp_no INT   NOT NULL,
    emp_title_id VARCHAR(50)   NOT NULL,
    birth_date date   NOT NULL,
    first_name VARCHAR(50)   NOT NULL,
    last_name VARCHAR(50)   NOT NULL,
    sex VARCHAR(50)   NOT NULL,
    hire_date date   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        emp_no
     )
);

SELECT * FROM "Employees"
;

CREATE TABLE Salaries (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        emp_no
     )
);

SELECT * FROM "Salaries"
;

ALTER TABLE Department_Employees ADD CONSTRAINT fk_Department_Employees_emp_no FOREIGN KEY(emp_no)
REFERENCES Salaries (emp_no);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_dept_no FOREIGN KEY(dept_no)
REFERENCES Departments (dept_no);

ALTER TABLE Department_Manager ADD CONSTRAINT fk_Department_Manager_emp_no FOREIGN KEY(emp_no)
REFERENCES Department_Employees (emp_no);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_no FOREIGN KEY(emp_no)
REFERENCES Department_Manager (emp_no);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES Titles (title_id);

