-- Drops the employee_tracker_db if it exists currently --
DROP DATABASE IF EXISTS employee_tracker_db;
-- Creates the  employee_tracker_db" database --
CREATE DATABASE employee_tracker_db;

-- Makes it so all of the following code will affect employee_tracker_db --
USE employee_tracker_db;

-- Creates the table  department" within employee_tracker_db --
CREATE TABLE department (
  id INTEGER(11) PRIMARY KEY, 
  name VARCHAR(30) NOT NULL,
  
);
INSERT INTO department (id, name)
VALUES (101, "HR");

INSERT INTO department (id, name)
VALUES (102, "sales");

INSERT INTO department (id, name)
VALUES (103, "accounting");

INSERT INTO department (id, name)
VALUES (104, "customer service");

INSERT INTO department (id, name)
VALUES (105, "warehouse");

CREATE TABLE role (
  id INTEGER(11) PRIMARY KEY, 
  title VARCHAR(30),
  salary DECIMAL(6,0),
  department_id INTEGER(11)

);

INSERT INTO role (id, title, salary, department_id)
VALUES ("201", "human resources", 50000, 101);

INSERT INTO role (id, title, salary, department_id)
VALUES ("202", "accountant", 50000, 103);

INSERT INTO role (id, title, salary, department_id)
VALUES ("203", "customer service rep", 50000, 104);

INSERT INTO role (id, title, salary, department_id)
VALUES ("204", "salesperson", 60000, 102);

INSERT INTO role (id, title, salary, department_id)
VALUES ("205", "delivery", 50000, 105);


CREATE TABLE employee (
  id INTEGER(11) PRIMARY KEY, 
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  role_id INTEGER(11),
  manager_id INTEGER(11)
);

-- Creates new rows containing data in all named columns --
INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES ("741", "Dwight", "Schrute", 222, 999);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES ("Ahmed", TRUE, "Rockington", 100);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES ("Jacob", TRUE, "Misty", 10);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES ("Jacob", TRUE, "Misty", 10);


select * from employee

-- Updates the row where the column name is peter --
UPDATE department
SET has_pet = true, pet_name = "Franklin", pet_age = 2
WHERE name = "Peter";