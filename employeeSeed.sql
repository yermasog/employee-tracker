-- Drops the employee_tracker_db if it exists currently --
DROP DATABASE IF EXISTS employee_tracker_db;
-- Creates the  employee_tracker_db" database --
CREATE DATABASE employee_tracker_db;

-- Makes it so all of the following code will affect employee_tracker_db --
USE employee_tracker_db;

-- Creates the table  department" within employee_tracker_db --
CREATE TABLE department (
  id INTEGER(11) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL
);
ALTER table department auto_increment=101;

INSERT INTO department (id, name)
VALUES (id, "administration");

INSERT INTO department (id, name)
VALUES (id, "sales");

INSERT INTO department (id, name)
VALUES (id, "accounting");

INSERT INTO department (id, name)
VALUES (id, "customer service");

INSERT INTO department (id, name)
VALUES (id, "warehouse");

select * from department;

CREATE TABLE role (
  id INTEGER(11) PRIMARY KEY AUTO_INCREMENT, 
  title VARCHAR(30),
  salary DECIMAL(6,0),
  department_id INTEGER(11)
);

ALTER table role auto_increment=501;

INSERT INTO role (id, title, salary, department_id)
VALUES (id, "receptionist", 50000, 101);

INSERT INTO role (id, title, salary, department_id)
VALUES (id, "human resources", 50000, 101);

INSERT INTO role (id, title, salary, department_id)
VALUES (id, "accountant", 50000, 103);

INSERT INTO role (id, title, salary, department_id)
VALUES (id, "customer service rep", 50000, 104);

INSERT INTO role (id, title, salary, department_id)
VALUES (id, "quality assurance", 50000, 104);

INSERT INTO role (id, title, salary, department_id)
VALUES (id, "sales rep", 60000, 102);

INSERT INTO role (id, title, salary, department_id)
VALUES (id, "delivery", 50000, 105);

select * from role;

CREATE TABLE employee (
  id INTEGER(11) PRIMARY KEY auto_increment, 
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  role_id INTEGER(11),
  manager_id INTEGER(11)
);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Michael", "Scott", 506, null);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Dwight", "Schrute", 506, 1);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Jim", "Halpert", 506, 1);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Andy", "Bernard", 506, 1);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Stanley", "Hudson", 506, 1);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Phyllis", "Vance", 506, 1);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Ryan", "Howard", 506, 1);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Angela", "Martin", 510, null);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Oscar", "Martinez", 510, 8);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Kevin", "Malone", 510, 8);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Darryl", "Philbin", 514, null);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Glen", "X", 514, 11);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Lonny", "Collins", 514, 11);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Madge", "Madsen", 514, 11);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Kelly", "Kapoor", 511, 1);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Meredith", "Palmer", 511, 1);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Creed", "Bratton", 512, 1);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Pam", "Beesly", 508, 1);

INSERT INTO employee (id, first_name, last_name, role_id, manager_id)
VALUES (id, "Toby", "Flenderson", 509, 1);

select * from employee;

CREATE TABLE manager (
  id INTEGER(11) PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL
);

INSERT INTO manager (id, first_name, last_name)
VALUES (1, "Michael", "Scott");

INSERT INTO manager (id, first_name, last_name)
VALUES (8, "Angela", "Martin");

INSERT INTO manager (id, first_name, last_name)
VALUES (11, "Darryl", "Philbin");

select * from manager;

SELECT employee.first_name, employee.last_name, manager.first_name, manager.last_name
FROM employee
RIGHT JOIN manager ON employee.manager_id=manager.id

