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
VALUES (101, "administration");

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
VALUES ("201", "receptionist", 50000, 101);

INSERT INTO role (id, title, salary, department_id)
VALUES ("206", "human resources", 50000, 101);

INSERT INTO role (id, title, salary, department_id)
VALUES ("202", "accountant", 50000, 103);

INSERT INTO role (id, title, salary, department_id)
VALUES ("203", "customer service rep", 50000, 104);

INSERT INTO role (id, title, salary, department_id)
VALUES ("207", "quality assurance", 50000, 104);

INSERT INTO role (id, title, salary, department_id)
VALUES ("204", "sales rep", 60000, 102);

INSERT INTO role (id, title, salary, department_id)
VALUES ("205", "delivery", 50000, 105);




CREATE TABLE employee (
  id INTEGER(11) PRIMARY KEY, 
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  role_id INTEGER(11),
  manager_id INTEGER(11)
);
--Michael 999
--Angela 888
--Darryl 777

-- Creates new rows containing data in all named columns --
INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (999, "Michael", "Scott", 204);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (741, "Dwight", "Schrute", 204, 999);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (456, "Jim", "Halpert", 204, 999);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (321, "Andy", "Bernard", 204, 999);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (369, "Stanley", "Hudson", 204, 999);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (852, "Phyllis", "Vance", 204, 999);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (821, "Ryan", "Howard", 204, 999);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (888, "Angela", "Martin", 202);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (159, "Oscar", "Martinez", 202, 888);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (123, "Kevin", "Malone", 202, 888);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (777, "Darryl", "Philbin", 205);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (357, "Glen", "X", 205, 777);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (486, "Lonny", "Collins", 205, 777);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (258, "Madge", "Madsen", 205, 777);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (951, "Kelly", "Kapoor", 203, 999);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (526, "Meredith", "Palmer", 203, 999);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (788, "Creed", "Bratton", 207, 999);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (294, "Pam", "Beesly", 201, 999);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (666, "Toby", "Flenderson", 206, 999);

select * from employee

-- Updates the row where the column name is peter --
UPDATE department
SET has_pet = true, pet_name = "Franklin", pet_age = 2
WHERE name = "Peter";